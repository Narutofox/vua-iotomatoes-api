using System;
using IoTomatoes.Domain.Models;
using IoTomatoes.Persistence.Commons;

namespace IoTomatoes.Persistence.Repositories
{
    public class PlantRepository : GenericRepository<Plant>
    {
        public PlantRepository(IoTomatoesContext context) : base(context)
        {
        }
    }
}
