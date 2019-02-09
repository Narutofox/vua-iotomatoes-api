using IoTomatoes.Domain.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace IoTomatoes.Domain.Interfaces
{
    public interface IFarmSensorMeasurmentRepository :IGenericRepository<FarmSensor>
    {
        List<FarmSensor> GetByFarmId(int farmId);
    }
}
