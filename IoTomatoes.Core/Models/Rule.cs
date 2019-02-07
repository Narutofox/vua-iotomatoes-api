using System;
using System.Collections.Generic;

namespace IoTomatoes.Domain.Models
{
    public class Rule
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public string Conditions { get; set; }
        public int? Active { get; set; }
        public int RuleSetId { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }

        public virtual RuleSet RuleSet { get; set; }
    }
}
