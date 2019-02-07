using System;
using System.Collections.Generic;

namespace IoTomatoes.Domain.Models
{
    public class City
    {
        public City()
        {
            Farms = new HashSet<Farm>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public string PostalCode { get; set; }
        public int CountryId { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }
        public int? Version { get; set; }

        public virtual Country Country { get; set; }
        public virtual ICollection<Farm> Farms { get; set; }
    }
}
