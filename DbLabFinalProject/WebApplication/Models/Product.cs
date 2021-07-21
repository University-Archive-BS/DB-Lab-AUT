namespace AutFinalProject.Models
{
    public class Product
    {
        public long ProductId { get; set; }
        public int Price { get; set; }
        public int RemainingCount { get; set; }
        public Category Categoty { get; set; }
        public string ProductName { get; set; }
    }

    public enum Category
    {
        Food = 1,
        Fruit = 2, 
        Drinks = 3, 
        Wearable = 4,
        TechGadget = 5
    }
}