using System;
using System.Collections.Generic;

namespace IoTomatoes.Application.Models
{
    public class FarmDTO
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string UserFullName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Address { get; set; }
        public int CityId { get; set; }
        public string CityName { get; set; }
        public int RuleSetId { get; set; }
        public string RuleSetName { get; set; }
        public decimal Latitude { get; set; }
        public decimal Longitude { get; set; }
        public List<int> SensorIds { get; set; }
        public List<int> PlantIds { get; set; }
        public List<int> ActuatorIds { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime DateModified { get; set; }
    }
}
