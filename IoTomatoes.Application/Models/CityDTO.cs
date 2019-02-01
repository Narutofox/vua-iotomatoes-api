using System;
using System.Collections.Generic;
using System.Text;

namespace IoTomatoes.Application.Models
{
    public class CityDTO
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public string PostalCode { get; set; }
        public string CountryName { get; set; }
        public int CountryId { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime DateModified { get; set; }
        public int Version { get; set; }
    }
}
