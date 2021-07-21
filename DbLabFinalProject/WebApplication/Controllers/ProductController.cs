using System;
using System.Linq;
using System.Threading.Tasks;
using AutFinalProject.Models;
using AutFinalProject.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace AutFinalProject.Controllers
{
    [Route("api/v1/product")]
    public class ProductController : Controller
    {
        private readonly IProductRepository _productRepository;

        public ProductController(IProductRepository productRepository)
        {
            _productRepository = productRepository;
        }
        
        [AllowAnonymous]
        [HttpPost]
        public async Task<IActionResult> SignUp([FromBody] Product inputDto)
        {
            try
            {
                return Ok(await _productRepository.AddAsync(inputDto));
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
                var queryable = _productRepository.GetQueryableAsync();
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