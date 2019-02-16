using System;
using System.Collections.Generic;

namespace IoTomatoes.Application.Models.RuleSet
{
    public abstract class BaseRuleSetDTO
    {
        public string Name { get; set; }
        public string Code { get; set; }
        public bool Active { get; set; }
        public List<RuleDTO> Rules { get; set; }
    }
}
