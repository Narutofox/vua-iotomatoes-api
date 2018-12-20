using System;
using System.Collections.Generic;

namespace IoTomatoes.Persistence.Models
{
    public partial class FarmActutators
    {
        public int Id { get; set; }
        public int? FarmId { get; set; }
        public int? ActuatorId { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }

        public virtual Actuators Actuator { get; set; }
        public virtual Farms Farm { get; set; }
    }
}
