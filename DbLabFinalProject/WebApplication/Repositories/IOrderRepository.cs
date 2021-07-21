using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutFinalProject.Controllers.Contract;
using AutFinalProject.Models;

namespace AutFinalProject.Repositories
{
    public interface IOrderRepository
    {
        IQueryable<Order> GetQueryableAsync();
        Task<Order> AddAsync(PurchaseInputDto inputDto);
        Task<List<Order>> GetOrderByUUId(long uuid);
        Task<List<OrderItem>> GetOrderLineItemByOrderId(long orderId);
    }
}