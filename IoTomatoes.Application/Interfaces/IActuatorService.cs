using IoTomatoes.Application.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace IoTomatoes.Application.Interfaces
{
    public interface IActuatorService
    {
        List<ActuatorDTO> GetAll();
        List<ListItemDTO> GetList();
    }
}
