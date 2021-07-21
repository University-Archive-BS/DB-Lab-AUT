using System;
using System.Linq;
using System.Threading.Tasks;
using AutFinalProject.Data;
using AutFinalProject.Models;

namespace AutFinalProject.Repositories.Imp
{
    public class ProductRepository : IProductRepository
    {
        private readonly DataContext _db;
        public ProductRepository(DataContext dataContext)
        {
            _db = dataContext;
        }
        public IQueryable<Product> GetQueryableAsync()
        {
            return _db.Product.AsQueryable();
        }

        public async Task<Product> AddAsync(Product comment)
        {
            var result = await _db.Product.AddAsync(comment);
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