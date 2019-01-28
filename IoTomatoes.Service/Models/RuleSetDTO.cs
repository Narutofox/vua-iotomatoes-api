using System;
using System.Collections.Generic;

namespace IoTomatoes.Application.Models
{
    public class RuleSetDTO
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public bool Active { get; set; }
        public List<RuleDTO> Rules { get; set; }
    }
}
