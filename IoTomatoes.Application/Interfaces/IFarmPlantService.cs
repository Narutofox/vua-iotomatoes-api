using IoTomatoes.Application.Models;
using System.Collections.Generic;

namespace IoTomatoes.Application.Interfaces
{
    public interface IFarmPlantService 
    {
        void Update(int farmId, IList<FarmPlantDTO> farmPlantDTOs);
    }
}
