using System;
using System.Collections.Generic;
using IoTomatoes.Application.Models;

namespace IoTomatoes.Application.Interfaces
{
    public interface IFarmService
    {
        FarmDTO Get(int farmId);
        List<FarmDTO> GetAll();
    }
}
