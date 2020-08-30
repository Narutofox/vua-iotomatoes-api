using IoTomatoes.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;

namespace IoTomatoes.Domain.Interfaces
{
    public interface IFarmSensorMeasurmentRepository :IGenericRepository<FarmSensor>
    {
        List<FarmSensor> GetByFarmId(int farmId);
        IQueryable<FarmSensor> SelectByWithInclude(Expression<Func<FarmSensor, bool>> expression);
    }
}
