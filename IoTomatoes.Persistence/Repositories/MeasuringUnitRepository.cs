using System;
using IoTomatoes.Domain.Models;
using IoTomatoes.Persistence.Commons;

namespace IoTomatoes.Persistence.Repositories
{
    public class MeasuringUnitRepository : GenericRepository<MeasuringUnit>
    {
        public MeasuringUnitRepository(IoTomatoesContext context) : base(context)
        {
        }
    }
}
