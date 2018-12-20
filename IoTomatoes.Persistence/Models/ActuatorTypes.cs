using System;
using System.Collections.Generic;

namespace IoTomatoes.Persistence.Models
{
    public partial class ActuatorTypes
    {
        public ActuatorTypes()
        {
            Actuators = new HashSet<Actuators>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }
        public int? Version { get; set; }

        public virtual ICollection<Actuators> Actuators { get; set; }
    }
}
