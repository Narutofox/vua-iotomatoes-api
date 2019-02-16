using System;
using System.Collections.Generic;
using System.Linq;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;
using IoTomatoes.Persistence.Commons;
using Microsoft.EntityFrameworkCore;

namespace IoTomatoes.Persistence.Repositories
{
    public class RuleSetRepository : GenericRepository<RuleSet>, IRuleSetRepository
    {
        private IoTomatoesContext Context => (IoTomatoesContext) _context;

        public RuleSetRepository(IoTomatoesContext context) : base(context){}

        public RuleSet GetByFarm(int farmId)
        {
            var farm = Context.Farms
                .Include(x => x.RuleSet)
                .ThenInclude(x => x.Rules)
                .FirstOrDefault(x => x.Id.Equals(farmId));

            if(farm != null)
            {
                return farm.RuleSet;
            }

            return null;
        }

        public override RuleSet Get(int id)
        {
            var ruleSet = Context.RuleSets
                .Include(x => x.Rules)
                .FirstOrDefault(x => x.Id.Equals(id));

            return ruleSet;
        }
    }
}
