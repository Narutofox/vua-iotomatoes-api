using System;
using System.Collections.Generic;
using System.Text;

namespace IoTomatoes.Application.Models.Farm
{
    public abstract class BaseFarmDTO
    {
        public int UserId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Address { get; set; }
        public int CityId { get; set; }
        public int RuleSetId { get; set; }
        public decimal Latitude { get; set; }
        public decimal Longitude { get; set; }
        public List<int> SensorIds { get; set; }
        public List<int> PlantIds { get; set; }
        public List<int> ActuatorIds { get; set; }
    }
}
