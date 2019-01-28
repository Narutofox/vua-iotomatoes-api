using System;
using System.Collections.Generic;
using IoTomatoes.Domain.Models;

namespace IoTomatoes.Domain.Interfaces
{
    public interface IRuleRepository : IGenericRepository<Rule>
    {
        List<Rule> GetByRuleSet(int ruleSetId);
    }
}
