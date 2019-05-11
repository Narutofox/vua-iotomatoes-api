using IoTomatoes.Application.Models;
using System.Collections.Generic;

namespace IoTomatoes.Application.Interfaces
{
    public interface IActuatorService
    {
        List<ActuatorDTO> GetAll();
        List<ListItemDTO> GetList();
    }
}
