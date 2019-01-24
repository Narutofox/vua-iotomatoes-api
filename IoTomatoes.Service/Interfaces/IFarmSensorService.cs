using System;
using System.Collections.Generic;
using IoTomatoes.Application.Models;

namespace IoTomatoes.Application.Interfaces
{
    public interface IFarmSensorService
    {
        List<FarmSensorDTO> GetFarmSensors(int farmId);
    }
}
