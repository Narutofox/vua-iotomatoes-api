using System;
using System.Collections.Generic;
using System.Text;

namespace IoTomatoes.Application.Models
{
    public class ActuatorDTO
    {
        public int Id { get; set; }
        public string Code { get; set; }
        public string ActuatorTypeName { get; set; }
        public string ActuatorTypeCode { get; set; }
    }
}
