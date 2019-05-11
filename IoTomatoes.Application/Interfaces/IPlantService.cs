using IoTomatoes.Application.Models;
using System.Collections.Generic;

namespace IoTomatoes.Application.Interfaces
{
    public interface IPlantService
    {
        List<PlantDTO> GetAll();
        List<ListItemDTO> GetList();
    }
}
