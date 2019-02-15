using System;
using System.Collections.Generic;
using IoTomatoes.Application.Models;
using IoTomatoes.Application.Models.Farm;

namespace IoTomatoes.Application.Interfaces
{
    public interface IFarmService
    {
        FarmDTO Get(int id);
        List<FarmDTO> GetAll();
        void Remove(int id);
        void Update(UpdateFarmDTO farm);
        void Create(CreateFarmDTO farm);
        List<FarmDTO> GetByUserId(int userId);
    }
}
