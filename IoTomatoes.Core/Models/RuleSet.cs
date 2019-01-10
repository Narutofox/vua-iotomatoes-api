using System;
using System.Collections.Generic;

namespace IoTomatoes.Domain.Models
{
    public class RuleSet
    {
        public RuleSet()
        {
            FarmRuleSets = new HashSet<FarmRuleSet>();
            Rules = new HashSet<Rule>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public int? Active { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }

        public virtual ICollection<FarmRuleSet> FarmRuleSets { get; set; }
        public virtual ICollection<Rule> Rules { get; set; }
    }
}
