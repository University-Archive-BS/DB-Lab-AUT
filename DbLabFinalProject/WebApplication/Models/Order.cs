using System;
using System.ComponentModel.DataAnnotations;

namespace AutFinalProject.Models
{
    public class Order
    {
        [Key]
        public long OrderId { get; set; }
        public long UUId { get; set; }
        public int? DiscountId { get; set; }
        public int TotalPrice { get; set; }
        public int PaidAmount { get; set; }
        public DateTime CreationTime { get; set; }
    }
}