using System;
using System.Linq;
using System.Threading.Tasks;
using AutFinalProject.Models;
using AutFinalProject.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;

namespace AutFinalProject.Controllers
{
    [EnableCors("AllowAllHeaders")]
    [Route("api/v1/comment")]
    public class CommentController: Controller
    {
        private readonly ICommentRepository _commentRepository;

        public CommentController(ICommentRepository commentRepository)
        {
            _commentRepository = commentRepository;
        }
        
        [AllowAnonymous]
        [HttpPost]
        public async Task<IActionResult> SignUp([FromBody] Comment inputDto)
        {
            try
            {
                return Ok(await _commentRepository.AddAsync(inputDto));
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
                var queryable = _commentRepository.GetQueryableAsync();
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