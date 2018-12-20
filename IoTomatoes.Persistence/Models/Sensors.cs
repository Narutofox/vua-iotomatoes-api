using System;
using System.Collections.Generic;

namespace IoTomatoes.Persistence.Models
{
    public partial class Sensors
    {
        public Sensors()
        {
            FarmSensors = new HashSet<FarmSensors>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public int? SensorTypeId { get; set; }
        public int? MeasuringUnitId { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }
        public int? Version { get; set; }

        public virtual MeasuringUnits MeasuringUnit { get; set; }
        public virtual SensorTypes SensorType { get; set; }
        public virtual ICollection<FarmSensors> FarmSensors { get; set; }
    }
}
