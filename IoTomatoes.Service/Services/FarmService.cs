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

        public FarmDTO Get(int id)
        {
            var farm = _farmRepository.Get(id);

            if(farm != null)
            {
                return _mapper.Map<FarmDTO>(farm);
            }

            return null;
        }
    
        public List<FarmDTO> GetAll()
        {
            var farms = _farmRepository.GetAll();
            return farms.Select(farm => _mapper.Map<FarmDTO>(farm)).ToList();
        }
    }
}
