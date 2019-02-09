using IoTomatoes.Domain.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace IoTomatoes.Domain.Interfaces
{
    public interface IFarmSensorMeasurementRepository:IGenericRepository<FarmSensorMeasurement>
    {
        List<FarmSensorMeasurement> GetBySensorId(int sensorId);
    }
}
