﻿using IoTomatoes.Application.Models;
using System.Collections.Generic;

namespace IoTomatoes.Application.Interfaces
{
    public interface ICityService
    {
        CityDTO Get(int id);
        List<CityDTO> GetAll();
        List<ListItemDTO> GetList();
        void Remove(int id);
        void Update(CityDTO city);
        void Create(CityDTO city);
    }
}
