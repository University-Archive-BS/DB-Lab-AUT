using System;
using System.Linq;
using System.Threading.Tasks;
using AutFinalProject.Data;
using AutFinalProject.Models;

namespace AutFinalProject.Repositories.Imp
{
    public class CustomerRepository: ICustomerRepositroy
    {
        private readonly DataContext _db;
        public CustomerRepository(DataContext dataContext)
        {
            _db = dataContext;
        }
        public IQueryable<Customer> GetQueryableAsync()
        {
            return _db.customer.AsQueryable();
        }

        public async Task<Customer> AddAsync(Customer comment)
        {
            var result = await _db.customer.AddAsync(comment);
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