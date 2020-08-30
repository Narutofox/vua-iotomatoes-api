using IoTomatoes.Application.Models;
using System.Collections.Generic;

namespace IoTomatoes.Application.Interfaces
{
    public interface IFarmActuatorService
    {
        void Update(int farmId,IList<FarmActuatorDTO> farmActuators);
    }
}
