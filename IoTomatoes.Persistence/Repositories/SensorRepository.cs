using System;
using System.Collections.Generic;
using System.Linq;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;
using IoTomatoes.Persistence.Commons;
using Microsoft.EntityFrameworkCore;

namespace IoTomatoes.Persistence.Repositories
{
    public class SensorRepository : GenericRepository<Sensor>, ISensorRepository
    {
        private IoTomatoesContext Context => (IoTomatoesContext)_context;
        public SensorRepository(IoTomatoesContext context) : base(context)
        {
        }
        public override Sensor Get(int id)
        {
            return Context.Sensors
                .Include(x => x.MeasuringUnit)
                .Include(x => x.SensorType)
                .FirstOrDefault(x => x.Id.Equals(id));
        }
        public override List<Sensor> GetAll()
        {
            return Context.Sensors
                .Include(x => x.MeasuringUnit)
                .Include(x => x.SensorType)
                .ToList();
        }
    }
}
