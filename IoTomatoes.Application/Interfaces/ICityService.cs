using IoTomatoes.Application.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace IoTomatoes.Application.Interfaces
{
    public interface ICityService
    {
        CityDTO Get(int id);
        List<CityDTO> GetAll();
        void Remove(int id);
        void Update(CityDTO city);
        void Create(CityDTO city);
    }
}
