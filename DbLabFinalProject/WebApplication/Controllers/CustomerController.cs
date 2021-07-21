using System;
using System.Linq;
using System.Threading.Tasks;
using AutFinalProject.Models;
using AutFinalProject.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace AutFinalProject.Controllers
{
    [EnableCors("AllowAllHeaders")]
    [Route("api/v1/customer")]
    public class CustomerController : Controller
    {
        private readonly ICustomerRepositroy _customerRepositroy;

        public CustomerController(ICustomerRepositroy customerRepositroy)
        {
            _customerRepositroy = customerRepositroy;
        }
        
        [AllowAnonymous]
        [HttpPost]
        public async Task<IActionResult> SignUp([FromBody] Customer inputDto)
        {
            try
            {
                return Ok(await _customerRepositroy.AddAsync(inputDto));
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
                var queryable = _customerRepositroy.GetQueryableAsync();
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