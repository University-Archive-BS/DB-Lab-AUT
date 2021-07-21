using System.Linq;
using System.Threading.Tasks;
using AutFinalProject.Models;

namespace AutFinalProject.Repositories
{
    public interface IProductRepository
    {
        IQueryable<Product> GetQueryableAsync();
        Task<Product> AddAsync(Product comment);
    }
}