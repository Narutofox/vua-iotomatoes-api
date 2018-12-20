using System;
using System.Collections.Generic;

namespace IoTomatoes.Persistence.Models
{
    public partial class Farms
    {
        public Farms()
        {
            FarmActutators = new HashSet<FarmActutators>();
            FarmPlants = new HashSet<FarmPlants>();
            FarmRuleSets = new HashSet<FarmRuleSets>();
            FarmSensors = new HashSet<FarmSensors>();
        }

        public int Id { get; set; }
        public int? UserId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Address { get; set; }
        public int? CityId { get; set; }
        public decimal? Latitude { get; set; }
        public decimal? Longitude { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }

        public virtual Cities City { get; set; }
        public virtual Users User { get; set; }
        public virtual ICollection<FarmActutators> FarmActutators { get; set; }
        public virtual ICollection<FarmPlants> FarmPlants { get; set; }
        public virtual ICollection<FarmRuleSets> FarmRuleSets { get; set; }
        public virtual ICollection<FarmSensors> FarmSensors { get; set; }
    }
}
