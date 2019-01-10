using System;
using System.Collections.Generic;

namespace IoTomatoes.Domain.Models
{
    public class FarmRuleSet
    {
        public int Id { get; set; }
        public int? FarmId { get; set; }
        public int? RuleSetId { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }

        public virtual Farm Farm { get; set; }
        public virtual RuleSet RuleSet { get; set; }
    }
}
