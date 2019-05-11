using System;

namespace IoTomatoes.Domain.Models
{
    public class FarmSensorMeasurement
    {
        public int Id { get; set; }
        public int FarmSensorId { get; set; }
        public decimal Value { get; set; }
        public DateTime? DateCreated { get; set; }

        public virtual FarmSensor FarmSensor { get; set; }
    }
}
