using System;
using System.Collections.Generic;
using System.Linq;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;
using IoTomatoes.Persistence.Commons;
using Microsoft.EntityFrameworkCore;

namespace IoTomatoes.Persistence.Repositories
{
    public class CityRepository : GenericRepository<City>, ICityRepository
    {
        private IoTomatoesContext Context => (IoTomatoesContext)_context;
        public CityRepository(IoTomatoesContext context) : base(context) { }

        public override City Get(int id)
        {
            return Context.Cities
                .Include(x => x.Country)
                .FirstOrDefault(x => x.Id.Equals(id));
        }
        public override List<City> GetAll()
        {
            return Context.Cities
                .Include(x => x.Country)
                .ToList();
        }
    }
}
