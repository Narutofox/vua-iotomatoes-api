using IoTomatoes.Application.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace IoTomatoes.Application.Interfaces
{
    public interface ISensorMeasurmentService
    {
        List<SensorMeasurmentDTO> GetBySensorId(int sensorId);
        void CreateFromDictionary(Dictionary<int, decimal> sensorMeasurementsDictionary);
        List<ChartMeasurementDTO> GetFarmMeasurements(int farmId, DateTime? dateFrom, DateTime? dateTo);
        Dictionary<int, decimal> GetLastFarmMeasurements(int farmId);
    }
}
