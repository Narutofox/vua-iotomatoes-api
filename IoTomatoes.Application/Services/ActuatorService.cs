﻿using AutoMapper;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using IoTomatoes.Domain.Interfaces;
using System.Collections.Generic;
using System.Linq;

namespace IoTomatoes.Application.Services
{
    public class ActuatorService : IActuatorService
    {
        private readonly IActuatorRepository _actuatorRepository;
        private readonly IMapper _mapper;

        public ActuatorService(IActuatorRepository actuatorRepository, IMapper mapper)
        {
            _actuatorRepository = actuatorRepository;
            _mapper = mapper;
        }

        public List<ActuatorDTO> GetAll()
        {
            return _actuatorRepository.GetAll()
                .Select(actuator => _mapper.Map<ActuatorDTO>(actuator))
                .ToList();
        }

        public List<ActuatorDTO> GetByFarm(int id)
        {
            return _actuatorRepository.GetByFarm(id)
                .Select(actuator => _mapper.Map<ActuatorDTO>(actuator))
                .ToList();
        }

        public List<ListItemDTO> GetList()
        {
           return _actuatorRepository.GetAll()
                .Select(actuator => _mapper.Map<ListItemDTO>(actuator))
                .ToList();
        }
    }
}
