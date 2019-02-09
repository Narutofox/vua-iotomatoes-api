using System;
using System.Collections.Generic;
using System.Text;

namespace IoTomatoes.Application.Models
{
    public class SensorMeasurmentDTO
    {
        public int FarmSensorId { get; set; }
        public decimal Value { get; set; }
        public DateTime? DateCreated { get; set; }

    }
}
