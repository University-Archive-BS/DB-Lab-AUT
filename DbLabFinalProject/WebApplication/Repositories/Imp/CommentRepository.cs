using System;
using System.Linq;
using System.Threading.Tasks;
using AutFinalProject.Data;
using AutFinalProject.Models;

namespace AutFinalProject.Repositories.Imp
{
    public class CommentRepository: ICommentRepository
    {
        private readonly DataContext _db;
        public CommentRepository(DataContext dataContext)
        {
            _db = dataContext;
        }
        
        public IQueryable<Comment> GetQueryableAsync()
        {
            return _db.Comment.AsQueryable();
        }

        public async Task<Comment> AddAsync(Comment comment)
        {
            var result = await _db.Comment.AddAsync(comment);
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