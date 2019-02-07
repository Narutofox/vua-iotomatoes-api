using System;
using System.Collections.Generic;

namespace IoTomatoes.Domain.Models
{
    public class FarmPlant
    {
        public int Id { get; set; }
        public int FarmId { get; set; }
        public int PlantId { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }

        public virtual Farm Farm { get; set; }
        public virtual Plant Plant { get; set; }
    }
}
