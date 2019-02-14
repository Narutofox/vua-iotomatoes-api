using AutoMapper;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using IoTomatoes.Domain.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace IoTomatoes.Application.Services
{
    public class PlantService : IPlantService
    {
        private readonly IPlantRepository _plantRepository;
        private readonly IMapper _mapper;

        public PlantService(IPlantRepository plantRepository, IMapper mapper)
        {
            _plantRepository = plantRepository;
            _mapper = mapper;
        }

        public List<PlantDTO> GetAll()
        {
            return _plantRepository.GetAll()
                .Select(plant => _mapper.Map<PlantDTO>(plant))
                .ToList();
        }

        public List<ListItemDTO> GetList()
        {
            return _plantRepository.GetAll()
                .Select(plant => _mapper.Map<ListItemDTO>(plant))
                .ToList();
        }
    }
}
