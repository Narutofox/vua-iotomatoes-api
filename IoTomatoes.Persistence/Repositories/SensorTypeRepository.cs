using System;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;
using IoTomatoes.Persistence.Commons;

namespace IoTomatoes.Persistence.Repositories
{
    public class SensorTypeRepository : GenericRepository<SensorType>, ISensorTypeRepository
    {
        public SensorTypeRepository(IoTomatoesContext context) : base(context)
        {
        }
    }
}
