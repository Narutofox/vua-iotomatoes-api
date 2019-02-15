using System;
using System.Collections.Generic;
using System.Text;

namespace IoTomatoes.Application.Models
{
    public class ChartMeasurementDTO
    {
        public List<string> Labels { get; set; }
        public List<decimal> Data { get; set; }
    }
}
