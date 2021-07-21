using System.ComponentModel.DataAnnotations;

namespace AutFinalProject.Models
{
    public class Customer
    {
        [Key]
        public long UUId { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string PhoneNumber { get; set; }
        public long? Reference { get; set; }
        public int Score { get; set; }
    }
}