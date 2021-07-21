using System.Linq;
using System.Threading.Tasks;
using AutFinalProject.Models;

namespace AutFinalProject.Repositories
{
    public interface IDiscountRepository
    {
        IQueryable<Discount> GetQueryableAsync();
        Task<Discount> AddAsync(Discount comment);
    }
}