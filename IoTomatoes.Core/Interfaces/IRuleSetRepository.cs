using System;
using System.Collections.Generic;
using IoTomatoes.Domain.Models;

namespace IoTomatoes.Domain.Interfaces
{
    public interface IRuleSetRepository : IGenericRepository<RuleSet>
    {
        List<Rule> GetRules(int ruleSetId);
    }
}
