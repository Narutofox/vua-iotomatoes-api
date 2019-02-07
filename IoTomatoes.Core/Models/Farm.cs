using System;
using System.Collections.Generic;

namespace IoTomatoes.Domain.Models
{
    public class Farm
    {
        public Farm()
        {
            FarmActuators = new HashSet<FarmActuator>();
            FarmPlants = new HashSet<FarmPlant>();
            FarmSensors = new HashSet<FarmSensor>();
        }

        public int Id { get; set; }
        public int UserId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Address { get; set; }
        public int? CityId { get; set; }
        public int RuleSetId { get; set; }
        public decimal? Latitude { get; set; }
        public decimal? Longitude { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }

        public virtual City City { get; set; }
        public virtual User User { get; set; }
        public virtual RuleSet RuleSet { get; set; }
        public virtual ICollection<FarmActuator> FarmActuators { get; set; }
        public virtual ICollection<FarmPlant> FarmPlants { get; set; }
        public virtual ICollection<FarmSensor> FarmSensors { get; set; }
    }
}
