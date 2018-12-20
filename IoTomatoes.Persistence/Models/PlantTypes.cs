using System;
using System.Collections.Generic;

namespace IoTomatoes.Persistence.Models
{
    public partial class PlantTypes
    {
        public PlantTypes()
        {
            Plants = new HashSet<Plants>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }
        public int? Version { get; set; }

        public virtual ICollection<Plants> Plants { get; set; }
    }
}
