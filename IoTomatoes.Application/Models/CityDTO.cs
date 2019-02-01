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
        public int CountryId { get; set; }
        public int Version { get; set; }
    }
}
