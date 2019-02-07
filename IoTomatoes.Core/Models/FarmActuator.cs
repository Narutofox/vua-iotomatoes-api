using System;
using System.Collections.Generic;

namespace IoTomatoes.Domain.Models
{
    public class FarmActuator
    {
        public int Id { get; set; }
        public int FarmId { get; set; }
        public int ActuatorId { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }

        public virtual Actuator Actuator { get; set; }
        public virtual Farm Farm { get; set; }
    }
}
