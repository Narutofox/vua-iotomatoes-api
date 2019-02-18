using IoTomatoes.Domain.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace IoTomatoes.Domain.Interfaces
{
    public interface IFarmSensorMeasurementRepository : IGenericRepository<FarmSensorMeasurement>
    {
        List<FarmSensorMeasurement> GetBySensorId(int sensorId);
        List<FarmSensorMeasurement> GetSensorMeasurements(int farmSensorId, DateTime? dateFrom, DateTime? dateTo);
        FarmSensorMeasurement GetLastSensorMeasurement(int farmSensorId);
    }
}
