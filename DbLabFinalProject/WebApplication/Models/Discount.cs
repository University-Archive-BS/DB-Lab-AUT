using System.ComponentModel.DataAnnotations;

namespace AutFinalProject.Models
{
    public class Discount
    {
        [Key]
        public int DiscountId { get; set; }
        public long UUId { get; set; }
        public string Code { get; set; }
        public int Amount { get; set; }
        public bool IsActive { get; set; }
    }
}