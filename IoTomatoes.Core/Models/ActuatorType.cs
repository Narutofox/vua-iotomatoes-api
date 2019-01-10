using System;
using System.Collections.Generic;

namespace IoTomatoes.Domain.Models
{
    public class ActuatorType
    {
        public ActuatorType()
        {
            Actuators = new HashSet<Actuator>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }
        public int? Version { get; set; }

        public virtual ICollection<Actuator> Actuators { get; set; }
    }
}
