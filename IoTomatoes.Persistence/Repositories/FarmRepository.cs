using System;
using System.Collections.Generic;
using System.Linq;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;
using IoTomatoes.Persistence.Commons;
using Microsoft.EntityFrameworkCore;

namespace IoTomatoes.Persistence.Repositories
{
    public class FarmRepository : GenericRepository<Farm>, IFarmRepository
    {
        private IoTomatoesContext Context => (IoTomatoesContext) _context;
        public FarmRepository(IoTomatoesContext context) : base(context){}

        public override Farm Get(int id)
        {
            return Context.Farms
                .Include(x => x.User)
                .Include(x => x.City)
                .Include(x => x.FarmSensors)
                    .ThenInclude(x => x.Sensor)
                .Include(x => x.RuleSet)
                    .ThenInclude(x => x.Rules)
                .Include(x => x.FarmPlants)
                .Include(x => x.FarmActuators)
                .FirstOrDefault(x => x.Id.Equals(id));
        }

        public override List<Farm> GetAll()
        {
            return Context.Farms
                .Include(x => x.User)
                .Include(x => x.City)
                .Include(x => x.RuleSet)
                .ToList();
        }

        public List<Farm> GetByUserId(int userId)
        {
            return Context.Farms
                .Include(x => x.City)
                .Include(x => x.RuleSet)
                .Where(x => x.UserId.Equals(userId))
                .ToList();
        }
    }
}
