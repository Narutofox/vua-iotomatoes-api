using System;
using System.Collections.Generic;

namespace IoTomatoes.Persistence.Models
{
    public partial class Cities
    {
        public Cities()
        {
            Farms = new HashSet<Farms>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public string PostalCode { get; set; }
        public int? CountryId { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }
        public int? Version { get; set; }

        public virtual Countries Country { get; set; }
        public virtual ICollection<Farms> Farms { get; set; }
    }
}
