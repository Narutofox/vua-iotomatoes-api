using System;
using System.Collections.Generic;

namespace IoTomatoes.Domain.Models
{
    public class Plant
    {
        public Plant()
        {
            FarmPlants = new HashSet<FarmPlant>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public string Description { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }
        public int? Version { get; set; }

        public virtual ICollection<FarmPlant> FarmPlants { get; set; }
    }
}
