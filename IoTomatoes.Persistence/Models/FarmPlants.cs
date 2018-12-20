using System;
using System.Collections.Generic;

namespace IoTomatoes.Persistence.Models
{
    public partial class FarmPlants
    {
        public int Id { get; set; }
        public int? FarmId { get; set; }
        public int? PlantId { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }

        public virtual Farms Farm { get; set; }
        public virtual Plants Plant { get; set; }
    }
}
