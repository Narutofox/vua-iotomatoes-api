using System;
using System.Collections.Generic;
using System.Linq;
using AutoMapper;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;

namespace IoTomatoes.Application.Services
{
    public class FarmService : IFarmService
    {
        private readonly IFarmRepository _farmRepository;
        private readonly IMapper _mapper;

        public FarmService(IFarmRepository farmRepository, IMapper mapper)
        {
            _farmRepository = farmRepository;
            _mapper = mapper;
        }

        public FarmDTO Get(int farmId)
        {
            var farm = _farmRepository.Get(farmId);

            if(farm != null)
            {
                return MapFarm(farm);
            }

            return null;
        }
    
        public List<FarmDTO> GetAll()
        {
            var farms = _farmRepository.GetAll();
            return farms.Select(MapFarm).ToList();
        }

        private FarmDTO MapFarm(Farm farm)
        {
            return new FarmDTO
            {
                Id = farm.Id,
                Name = farm.Name,
                Address = farm.Address,
                Description = farm.Description,
                Latitude = farm.Latitude.Value,
                Longitude = farm.Longitude.Value,
                DateCreated = farm.DateCreated.Value
            };
        }
    }
}
