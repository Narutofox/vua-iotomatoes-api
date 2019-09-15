using System;
using System.Linq;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;
using IoTomatoes.Persistence.Commons;

namespace IoTomatoes.Persistence.Repositories
{
    public class SensorTypeRepository : GenericRepository<SensorType>, ISensorTypeRepository
    {
        private IoTomatoesContext Context => (IoTomatoesContext)_context;
        public SensorTypeRepository(IoTomatoesContext context) : base(context)
        {
        }
    }
}
