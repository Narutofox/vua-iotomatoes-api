using IoTomatoes.Domain.Models;
using System.Collections.Generic;

namespace IoTomatoes.Domain.Interfaces
{
    public interface IActuatorRepository : IGenericRepository<Actuator>
    {
        List<Actuator> GetByFarm(int farmId);
    }
}
