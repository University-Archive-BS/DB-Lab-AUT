using System.Collections.Generic;
using AutFinalProject.Models;

namespace AutFinalProject.Controllers.Contract
{
    public class PurchaseInputDto
    {
        public long UUId { get; set; }
        public int? DiscountId { get; set; }
        public List<ItemInputDto> Items { get; set; }
    }
}