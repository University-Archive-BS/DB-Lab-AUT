using System;
using System.Linq;
using System.Threading.Tasks;
using AutFinalProject.Controllers.Contract;
using AutFinalProject.Models;
using AutFinalProject.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;

namespace AutFinalProject.Controllers
{
    [EnableCors("AllowAllHeaders")]
    [Route("api/v1/order")]
    public class OrderController: Controller
    {
        private readonly IOrderRepository _orderRepository;

        public OrderController(IOrderRepository orderRepository)
        {
            _orderRepository = orderRepository;
        }
        
        [AllowAnonymous]
        [HttpPost]
        public async Task<IActionResult> SignUp([FromBody] PurchaseInputDto inputDto)
        {
            try
            {
                return Ok(await _orderRepository.AddAsync(inputDto));
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return BadRequest(new
                {
                    Message = "There was a problem inserting the information.",
                });
            }
        }
        
        [AllowAnonymous]
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                var queryable = _orderRepository.GetQueryableAsync();
                return Ok(queryable.ToList());
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return BadRequest(new
                {
                    Message = "There was a problem to get data from sql",
                });
            }
        }
        
        [AllowAnonymous]
        [HttpGet]
        [Route("order-by-user-id")]
        public async Task<IActionResult> GetOrderById(long userId)
        {
            try
            {
                return Ok(await _orderRepository.GetOrderByUUId(userId));
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return BadRequest(new
                {
                    Message = "There was a problem to get data from sql",
                });
            }
        }
        
        [AllowAnonymous]
        [HttpGet]
        [Route("order-details")]
        public async Task<IActionResult> GetOrderItemsByOrderId(long orderId)
        {
            try
            {
                return Ok(await _orderRepository.GetOrderLineItemByOrderId(orderId));
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return BadRequest(new
                {
                    Message = "There was a problem to get data from sql",
                });
            }
        }
    }
}