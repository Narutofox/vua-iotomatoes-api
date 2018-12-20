using System;
using System.Collections.Generic;

namespace IoTomatoes.Persistence.Models
{
    public partial class FarmSensors
    {
        public FarmSensors()
        {
            FarmSensorMeasurements = new HashSet<FarmSensorMeasurements>();
        }

        public int Id { get; set; }
        public int? FarmId { get; set; }
        public int? SensorId { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }

        public virtual Farms Farm { get; set; }
        public virtual Sensors Sensor { get; set; }
        public virtual ICollection<FarmSensorMeasurements> FarmSensorMeasurements { get; set; }
    }
}
