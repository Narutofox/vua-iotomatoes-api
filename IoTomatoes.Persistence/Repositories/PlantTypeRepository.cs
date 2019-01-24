using System;
using IoTomatoes.Domain.Models;
using IoTomatoes.Persistence.Commons;

namespace IoTomatoes.Persistence.Repositories
{
    public class PlantTypeRepository : GenericRepository<PlantType>
    {
        public PlantTypeRepository(IoTomatoesContext context) : base(context)
        {
        }
    }
}
