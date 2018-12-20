using System;
using System.Collections.Generic;

namespace IoTomatoes.Persistence.Models
{
    public partial class RuleSets
    {
        public RuleSets()
        {
            FarmRuleSets = new HashSet<FarmRuleSets>();
            Rules = new HashSet<Rules>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public int? Active { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }

        public virtual ICollection<FarmRuleSets> FarmRuleSets { get; set; }
        public virtual ICollection<Rules> Rules { get; set; }
    }
}
