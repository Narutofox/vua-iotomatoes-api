using System;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;
using IoTomatoes.Persistence.Commons;

namespace IoTomatoes.Persistence.Repositories
{
    public class SensorRepository : GenericRepository<Sensor>, ISensorRepository
    {
        public SensorRepository(AppContext context) : base(context)
        {
        }
    }
}
