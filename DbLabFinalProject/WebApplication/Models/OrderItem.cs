using System.ComponentModel.DataAnnotations;

namespace AutFinalProject.Models
{
    public class OrderItem
    {
        [Key]
        public long ItemId { get; set; }
        public long OrderId { get; set; }
        public long ProductId { get; set; }
        public int Fee { get; set; }
        public int Count { get; set; }
    }
}