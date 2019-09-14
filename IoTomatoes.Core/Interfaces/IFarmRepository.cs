using System.Collections.Generic;
using System.Linq;
using IoTomatoes.Domain.Models;

namespace IoTomatoes.Domain.Interfaces
{
    public interface IFarmRepository : IGenericRepository<Farm>
    {
        List<Farm> GetByUserId(int userId);
        IQueryable<Farm> SelectFarms();
        IQueryable<FarmSensor> SelectFarmSensors();
    }
}
