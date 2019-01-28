using System;
using System.Collections.Generic;
using System.Linq;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;
using IoTomatoes.Persistence.Commons;

namespace IoTomatoes.Persistence.Repositories
{
    public class RuleRepository : GenericRepository<Rule>, IRuleRepository
    {
        private IoTomatoesContext Context => (IoTomatoesContext)_context;
        public RuleRepository(IoTomatoesContext context) : base(context) {}

        public List<Rule> GetByRuleSet(int ruleSetId)
        {
            return Context.Rules.Where(x => x.RuleSetId.Equals(ruleSetId)).ToList();
        }
    }
}
