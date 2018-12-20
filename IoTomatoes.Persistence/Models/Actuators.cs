using System;
using System.Collections.Generic;

namespace IoTomatoes.Persistence.Models
{
    public partial class Actuators
    {
        public Actuators()
        {
            FarmActutators = new HashSet<FarmActutators>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int? ActutatorTypeId { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }

        public virtual ActuatorTypes ActutatorType { get; set; }
        public virtual ICollection<FarmActutators> FarmActutators { get; set; }
    }
}
