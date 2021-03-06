﻿using System.Collections.Generic;
using IoTomatoes.Application.Models;

namespace IoTomatoes.Application.Interfaces
{
    public interface IRuleService
    {
        Dictionary<string, string> GetDictionary(List<RuleDTO> rules);
        List<ListItemDTO> GetList();
        bool Create(RuleDTO ruleDTO);
        bool Update(RuleDTO ruleDTO);
    }
}
