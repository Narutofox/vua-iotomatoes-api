using IoTomatoes.Application.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace IoTomatoes.Application.Interfaces
{
    public interface IPlantService
    {
        List<PlantDTO> GetAll();
        List<ListItemDTO> GetList();
    }
}
