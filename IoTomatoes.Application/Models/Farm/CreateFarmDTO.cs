using System;
using System.Collections.Generic;
using System.Text;

namespace IoTomatoes.Application.Models.Farm
{
    public class CreateFarmDTO : BaseFarmDTO
    {
        public CreateFarmDTO()
        {
            ActuatorIds = new List<int>();
            PlantIds = new List<int>();
            SensorIds = new List<int>();
        }
    }
}
