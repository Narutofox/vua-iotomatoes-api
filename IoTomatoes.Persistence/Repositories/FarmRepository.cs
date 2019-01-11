using System;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;
using IoTomatoes.Persistence.Commons;

namespace IoTomatoes.Persistence.Repositories
{
    public class FarmRepository : GenericRepository<Farm>, IFarmRepository
    {
        public FarmRepository(AppContext context) : base(context){}
    }
}
