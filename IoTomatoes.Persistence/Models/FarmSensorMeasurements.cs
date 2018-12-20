using System;
using System.Collections.Generic;

namespace IoTomatoes.Persistence.Models
{
    public partial class FarmSensorMeasurements
    {
        public int Id { get; set; }
        public int? FarmSensorId { get; set; }
        public decimal? Value { get; set; }
        public DateTime? DateCreated { get; set; }

        public virtual FarmSensors FarmSensor { get; set; }
    }
}
