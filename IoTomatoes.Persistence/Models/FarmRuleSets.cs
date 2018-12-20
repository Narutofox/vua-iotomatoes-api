using System;
using System.Collections.Generic;

namespace IoTomatoes.Persistence.Models
{
    public partial class FarmRuleSets
    {
        public int Id { get; set; }
        public int? FarmId { get; set; }
        public int? RuleSetId { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }

        public virtual Farms Farm { get; set; }
        public virtual RuleSets RuleSet { get; set; }
    }
}
