using System;
using System.Collections.Generic;

namespace IoTomatoes.Application.Models
{
    public class RuleSetDTO
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public Dictionary<string, string> Rules { get; set; }
    }
}
