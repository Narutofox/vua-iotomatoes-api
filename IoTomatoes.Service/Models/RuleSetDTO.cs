using System;
using System.Collections.Generic;

namespace IoTomatoes.Application.Models
{
    public class RuleSetDTO
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public List<RuleDTO> Rules { get; set; }
    }

    public class RuleDTO
    {
        public string Code { get; set; }
        public string Conditions { get; set; }
        public int RuleSetId { get; set; }
        public bool Active { get; set; }
    }
}
