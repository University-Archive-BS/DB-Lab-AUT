using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutFinalProject.Controllers.Contract;
using AutFinalProject.Data;
using AutFinalProject.Models;
using Microsoft.EntityFrameworkCore;

namespace AutFinalProject.Repositories.Imp
{
    public class OrderRepository : IOrderRepository
    {
        private readonly DataContext _db;

        public OrderRepository(DataContext dataContext)
        {
            _db = dataContext;
        }

        public IQueryable<Order> GetQueryableAsync()
        {
            return _db.Order.AsQueryable();
        }

        public async Task<List<Order>> GetOrderByUUId(long uuid)
        {
            return await _db.Order.FromSql("GetCustomerOrders @p0", uuid).ToListAsync();
        }

        public async Task<List<OrderItem>> GetOrderLineItemByOrderId(long orderId)
        {
            return await _db.OrderItem.FromSql("GetOrderItemsByOrderId @p0", orderId).ToListAsync();
        }
        public async Task<Order> AddAsync(PurchaseInputDto inputDto)
        {
            var orderItems = inputDto.Items.Select(item => new OrderItem
            {
                Count = item.Count, Fee = _db.Product.First(x => x.ProductId == item.ProductId).Price,
                ProductId = item.ProductId,
            }).ToList();

            var order = new Order
            {
                TotalPrice = orderItems.Sum(x => x.Fee * x.Count),
                CreationTime = DateTime.Now,
                DiscountId = inputDto.DiscountId,
                UUId = inputDto.UUId,
            };

            if (order.DiscountId != null)
            {
                order.PaidAmount =
                    order.TotalPrice - _db.Discount.First(x => x.DiscountId == order.DiscountId).Amount;
            }
            else
            {
                order.PaidAmount = order.TotalPrice;
            }

            var result = await _db.Order.AddAsync(order);
            await SaveDataChanges("There was a problem inserting the information.");

            foreach (var item in orderItems)
            {
                item.OrderId = result.Entity.OrderId;
            }

            await _db.OrderItem.AddRangeAsync(orderItems);
            await SaveDataChanges("There was a problem inserting the information.");
            return result.Entity;
        }

        public async Task<bool> SaveDataChanges(string errorMessage)
        {
            try
            {
                var result = await _db.SaveChangesAsync();
                return result > 0;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw new Exception(errorMessage);
            }
        }
    }
}