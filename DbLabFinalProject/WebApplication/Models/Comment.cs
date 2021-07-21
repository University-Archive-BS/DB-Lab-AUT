using System.ComponentModel.DataAnnotations;

namespace AutFinalProject.Models
{
    public class Comment
    {
        [Key]
        public long UUId { get; set; }
        public long ProductId { get; set; }
        public string Text { get; set; }
        public int Score { get; set; }
    }
}