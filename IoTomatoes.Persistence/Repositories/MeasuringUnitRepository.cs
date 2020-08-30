using System;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;
using IoTomatoes.Persistence.Commons;

namespace IoTomatoes.Persistence.Repositories
{
    public class MeasuringUnitRepository : GenericRepository<MeasuringUnit>, IMeasuringUnitRepository
    {
        public MeasuringUnitRepository(IoTomatoesContext context) : base(context)
        {
        }
    }
}
