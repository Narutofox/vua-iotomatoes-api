using IoTomatoes.Domain.Models;
using System.Collections.Generic;

namespace IoTomatoes.Domain.Interfaces
{
    public interface IFarmSensorMeasurmentRepository :IGenericRepository<FarmSensor>
    {
        List<FarmSensor> GetByFarmId(int farmId);
    }
}
