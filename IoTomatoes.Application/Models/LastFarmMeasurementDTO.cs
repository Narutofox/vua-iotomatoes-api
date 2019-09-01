using System;

namespace IoTomatoes.Application.Models
{
    public class LastFarmMeasurementDTO
    {
        public decimal Value { get; set; }
        public DateTime DateCreated { get; set; }
        public string MeasuringUnitCode { get; set; }
        public string SensorName { get; set; }
    }
}
