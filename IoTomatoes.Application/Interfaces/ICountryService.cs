﻿using IoTomatoes.Application.Models;
using System.Collections.Generic;

namespace IoTomatoes.Application.Interfaces
{
    public interface ICountryService
    {
        CountryDTO Get(int id);
        List<CountryDTO> GetAll();
        void Remove(int id);
        void Update(CountryDTO country);
        void Create(CountryDTO country);
    }
}
