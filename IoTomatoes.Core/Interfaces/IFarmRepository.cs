using System;
using System.Collections.Generic;
using IoTomatoes.Domain.Models;

namespace IoTomatoes.Domain.Interfaces
{
    public interface IFarmRepository : IGenericRepository<Farm>
    {
        List<Farm> GetByUserId(int userId); 
    }
}
