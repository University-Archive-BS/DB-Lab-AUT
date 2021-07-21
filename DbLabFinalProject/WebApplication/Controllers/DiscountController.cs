using System;
using System.Linq;
using System.Threading.Tasks;
using AutFinalProject.Models;
using AutFinalProject.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace AutFinalProject.Controllers
{
    [Route("api/v1/discount")]
    public class DiscountController : Controller
    {
        private readonly IDiscountRepository _discountRepository;

        public DiscountController(IDiscountRepository discountRepository)
        {
            _discountRepository = discountRepository;
        }
        
        [AllowAnonymous]
        [HttpPost]
        public async Task<IActionResult> SignUp([FromBody] Discount inputDto)
        {
            try
            {
                return Ok(await _discountRepository.AddAsync(inputDto));
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
                var queryable = _discountRepository.GetQueryableAsync();
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
    }
}