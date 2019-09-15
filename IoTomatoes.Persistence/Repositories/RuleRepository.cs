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

        public bool Exists(Rule rule)
        {
            if (rule.Id > 0)
            {
                return Context.Rules.Any(x => x.Id == rule.Id);
            }
            else if (!String.IsNullOrEmpty(rule.Code) && rule.RuleSetId > 0)
            {
                return Context.Rules.Any(x => x.Code == rule.Code && x.RuleSetId == rule.RuleSetId);
            }
            return false;
        }
    }
}
