using IoTomatoes.Application.Models;
using System;
using System.Collections.Generic;
using System.Text;

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
