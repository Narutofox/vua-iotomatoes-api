using System;
using System.Collections.Generic;
using System.Text;

namespace IoTomatoes.Application.Models
{
    public class ChartMeasurementDTO
    {
        public int FarmSensorId { get; set; }
        public int SensorTypeId { get; set; }
        public List<string> Labels { get; set; }
        public List<decimal> Data { get; set; }

        public ChartMeasurementDTO()
        {
            Labels = new List<string>();
            Data = new List<decimal>();
        }
    }
}
