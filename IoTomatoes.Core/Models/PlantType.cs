using System;
using System.Collections.Generic;

namespace IoTomatoes.Domain.Models
{
    public class PlantType
    {
        public PlantType()
        {
            Plants = new HashSet<Plant>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }
        public int? Version { get; set; }

        public virtual ICollection<Plant> Plants { get; set; }
    }
}
