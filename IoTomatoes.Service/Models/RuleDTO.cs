using System;
namespace IoTomatoes.Application.Models
{
    public class RuleDTO
    {
        public string Code { get; set; }
        public string Conditions { get; set; }
        public int RuleSetId { get; set; }
        public bool Active { get; set; }
    }
}
