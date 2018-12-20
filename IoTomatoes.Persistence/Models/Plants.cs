using System;
using System.Collections.Generic;

namespace IoTomatoes.Persistence.Models
{
    public partial class Plants
    {
        public Plants()
        {
            FarmPlants = new HashSet<FarmPlants>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public string Description { get; set; }
        public int? PlantTypeId { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }
        public int? Version { get; set; }

        public virtual PlantTypes PlantType { get; set; }
        public virtual ICollection<FarmPlants> FarmPlants { get; set; }
    }
}
