using System.Linq;
using System.Threading.Tasks;
using AutFinalProject.Models;

namespace AutFinalProject.Repositories
{
    public interface ICustomerRepositroy
    {
        IQueryable<Customer> GetQueryableAsync();
        Task<Customer> AddAsync(Customer comment);
    }
}