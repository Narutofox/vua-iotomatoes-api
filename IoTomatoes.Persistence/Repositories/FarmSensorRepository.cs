using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;
using IoTomatoes.Persistence.Commons;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;

namespace IoTomatoes.Persistence.Repositories
{
    public class FarmSensorRepository : GenericRepository<FarmSensor>, IFarmSensorMeasurmentRepository
    {
        private IoTomatoesContext Context => (IoTomatoesContext)_context;

        public FarmSensorRepository(IoTomatoesContext context) : base(context)
        {
        }

        public List<FarmSensor> GetByFarmId(int farmId)
        {
            return Context.FarmSensors
                .Include(fs => fs.Sensor)
                .Where(fs => fs.FarmId == farmId)
                .ToList();
        }

        public IQueryable<FarmSensor> SelectByWithInclude(Expression<Func<FarmSensor, bool>> expression)
        {
            return _dbSet.Where(expression).Include(x=>x.Sensor).Include(x=>x.Sensor.SensorType);
        }
    }
}
