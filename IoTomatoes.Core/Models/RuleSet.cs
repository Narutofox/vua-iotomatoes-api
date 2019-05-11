using System;
using System.Collections.Generic;

namespace IoTomatoes.Domain.Models
{
    public class RuleSet
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public int? Active { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }

        public virtual ICollection<Farm> Farms { get; set; } = new HashSet<Farm>();
        public virtual ICollection<Rule> Rules { get; set; } = new HashSet<Rule>();
    }
}
