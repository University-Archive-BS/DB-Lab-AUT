using System.Linq;
using System.Threading.Tasks;
using AutFinalProject.Models;

namespace AutFinalProject.Repositories
{
    public interface ICommentRepository
    {
        IQueryable<Comment> GetQueryableAsync();
        Task<Comment> AddAsync(Comment comment);
    }
}