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
        public IoTomatoesContext Context => (IoTomatoesContext) _context;

        public RuleSetRepository(IoTomatoesContext context) : base(context)
        {
        }

        public List<Rule> GetRules(int ruleSetId)
        {
            return Context.Rules.Where(x => x.RuleSetId.Equals(ruleSetId)).ToList();
        }
    }
}
