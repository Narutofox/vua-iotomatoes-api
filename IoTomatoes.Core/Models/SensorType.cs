using System;
using System.Collections.Generic;

namespace IoTomatoes.Domain.Models
{
    public class SensorType
    {
        public SensorType()
        {
            Sensors = new HashSet<Sensor>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }
        public int? Version { get; set; }

        public virtual ICollection<Sensor> Sensors { get; set; }
    }
}
