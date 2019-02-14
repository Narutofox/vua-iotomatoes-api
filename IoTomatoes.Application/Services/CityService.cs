using System.Collections.Generic;
using System.Linq;
using AutoMapper;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;

namespace IoTomatoes.Application.Services
{
    public class CityService : ICityService
    {
        private readonly ICityRepository _cityRepository;
        private readonly IMapper _mapper;

        public CityService(ICityRepository cityRepository, IMapper mapper)
        {
            _cityRepository = cityRepository;
            _mapper = mapper;
        }

        public void Create(CityDTO city)
        {
            var createCity = _mapper.Map<City>(city);

            _cityRepository.Add(createCity);
            _cityRepository.Commit();
        }

        public CityDTO Get(int id)
        {
            var city = _cityRepository.Get(id);

            if (city != null)
            {
                return _mapper.Map<CityDTO>(city);
            }

            return null;
        }

        public List<CityDTO> GetAll()
        {
            return _cityRepository.GetAll()
                .Select(city => _mapper.Map<CityDTO>(city))
                .ToList();
        }

        public List<ListItemDTO> GetList()
        {
            return _cityRepository.GetAll()
                .Select(city => _mapper.Map<ListItemDTO>(city))
                .ToList();
        }

        public void Update(CityDTO city)
        {
            var updateCity = _mapper.Map<City>(city);

            _cityRepository.Update(updateCity);
            _cityRepository.Commit();
        }

        public void Remove(int id)
        {
            var removeCity = _cityRepository.Get(id);
            _cityRepository.Remove(removeCity);
            _cityRepository.Commit();
        }
    }
}
