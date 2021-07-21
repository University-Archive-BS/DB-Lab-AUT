using System;
using System.Linq;
using System.Threading.Tasks;
using AutFinalProject.Data;
using AutFinalProject.Models;

namespace AutFinalProject.Repositories.Imp
{
    public class DiscountRepository: IDiscountRepository
    {
        private readonly DataContext _db;
        public DiscountRepository(DataContext dataContext)
        {
            _db = dataContext;
        }
        public IQueryable<Discount> GetQueryableAsync()
        {
            return _db.Discount.AsQueryable();
        }

        public async Task<Discount> AddAsync(Discount comment)
        {
            comment.Code = new Guid().ToString();
            var result = await _db.Discount.AddAsync(comment);
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