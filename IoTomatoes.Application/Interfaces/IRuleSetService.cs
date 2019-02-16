using System;
using System.Collections.Generic;
using IoTomatoes.Application.Models;
using IoTomatoes.Application.Models.RuleSet;

namespace IoTomatoes.Application.Interfaces
{
    public interface IRuleSetService
    {
        RuleSetDTO GetByFarm(int farmId);
        List<ListItemDTO> GetList();
        List<RuleSetDTO> GetAll();
        RuleSetDTO Get(int id);
        void Create(CreateRuleSetDTO ruleSet);
        void Update(UpdateRuleSetDTO ruleSet);
        void Remove(int id);
    }
}
