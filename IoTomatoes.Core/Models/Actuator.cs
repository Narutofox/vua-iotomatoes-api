using System;
using System.Collections.Generic;

namespace IoTomatoes.Domain.Models
{
    public class Actuator
    {
        public Actuator()
        {
            FarmActuators = new HashSet<FarmActuator>();
        }

        public int Id { get; set; }
        public string Code { get; set; }
        public int? ActutatorTypeId { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }

        public virtual ActuatorType ActuatorType { get; set; }
        public virtual ICollection<FarmActuator> FarmActuators { get; set; }
    }
}
