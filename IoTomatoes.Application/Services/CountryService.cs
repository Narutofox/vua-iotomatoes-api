using System.Collections.Generic;
using System.Linq;
using AutoMapper;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;
namespace IoTomatoes.Application.Services
{
    public class CountryService : ICountryService
    {
        private readonly ICountryRepository _countryRepository;
        private readonly IMapper _mapper;
        public CountryService(ICountryRepository countryRepository, IMapper mapper)
        {
            _countryRepository = countryRepository;
            _mapper = mapper;
        }

        public void Create(CountryDTO country)
        {
            var createCountry = _mapper.Map<Country>(country);

            _countryRepository.Add(createCountry);
            _countryRepository.Commit();
        }

        public CountryDTO Get(int id)
        {
            var city = _countryRepository.Get(id);

            if (city != null)
            {
                return _mapper.Map<CountryDTO>(city);
            }

            return null;
        }

        public List<CountryDTO> GetAll()
        {
            var cities = _countryRepository.GetAll();
            return cities.Select(country => _mapper.Map<CountryDTO>(country)).ToList();
        }

        public void Update(CountryDTO country)
        {
            var updateCity = _mapper.Map<Country>(country);

            _countryRepository.Update(updateCity);
            _countryRepository.Commit();
        }

        public void Remove(int id)
        {
            var removeCountry = _countryRepository.Get(id);
            _countryRepository.Remove(removeCountry);
            _countryRepository.Commit();
        }
    }
}
