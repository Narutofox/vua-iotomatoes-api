using System;
using System.Collections.Generic;

namespace IoTomatoes.Domain.Models
{
    public class Actuator
    {
        public Actuator()
        {
            FarmActutators = new HashSet<FarmActutator>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int? ActutatorTypeId { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }

        public virtual ActuatorType ActutatorType { get; set; }
        public virtual ICollection<FarmActutator> FarmActutators { get; set; }
    }
}
