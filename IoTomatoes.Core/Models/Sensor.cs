using System;
using System.Collections.Generic;

namespace IoTomatoes.Domain.Models
{
    public class Sensor
    {
        public Sensor()
        {
            FarmSensors = new HashSet<FarmSensor>();
        }

        public int Id { get; set; }
        public string Code { get; set; }
        public int SensorTypeId { get; set; }
        public int MeasuringUnitId { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }
        public int? Version { get; set; }

        public virtual MeasuringUnit MeasuringUnit { get; set; }
        public virtual SensorType SensorType { get; set; }
        public virtual ICollection<FarmSensor> FarmSensors { get; set; }
    }
}
