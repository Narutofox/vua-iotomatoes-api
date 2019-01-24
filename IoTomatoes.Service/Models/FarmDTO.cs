using System;
namespace IoTomatoes.Application.Models
{
    public class FarmDTO
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Address { get; set; }
        public string CityName { get; set; }
        public string RuleSetName { get; set; }
        public decimal Latitude { get; set; }
        public decimal Longitude { get; set; }
        public DateTime DateCreated { get; set; }
    }
}
