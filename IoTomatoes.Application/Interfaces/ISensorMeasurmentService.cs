using IoTomatoes.Application.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace IoTomatoes.Application.Interfaces
{
    public interface ISensorMeasurmentService
    {
        IEnumerable<SensorMeasurmentDTO> GetBySensorId(int sensorId);
        void CreateFromDictionary(Dictionary<int, decimal> sensorMeasurementsDictionary);
    }
}
