using AutoMapper;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace IoTomatoes.Application.Services
{
    public class FarmActuatorService : IFarmActuatorService
    {
        private readonly IFarmActuatorRepository _farmActuatorRepository;
        private readonly IMapper _mapper;

        public FarmActuatorService(IFarmActuatorRepository farmActuatorRepository, IMapper mapper)
        {
            _farmActuatorRepository = farmActuatorRepository;
            _mapper = mapper;
        }
        public void Update(int farmId, IList<FarmActuatorDTO> farmActuatorsDTOs)
        {
            IList<FarmActuator> farmActuators = _farmActuatorRepository.SelectBy(x=>x.FarmId == farmId).ToList();
            IEnumerable<FarmActuator> farmActuatorsToDelete = farmActuators.Where(x=> !farmActuatorsDTOs.Select(y=>y.ActuatorId).Contains(x.ActuatorId)).AsEnumerable();
            foreach (FarmActuatorDTO farmActuatorDTO in farmActuatorsDTOs)
            {
                if (!farmActuators.Any(x=>x.ActuatorId == farmActuatorDTO.ActuatorId))
                {
                    FarmActuator farmActuator = new FarmActuator() { FarmId = farmId };
                    _mapper.Map(farmActuatorDTO, farmActuator);
                    farmActuator.DateCreated = DateTime.Now;
                    farmActuator.DateModified = DateTime.Now;
                    _farmActuatorRepository.Add(farmActuator);
                }
            }
            if (farmActuatorsToDelete.Any())
            {
                _farmActuatorRepository.RemoveRange(farmActuatorsToDelete);
            }
            
            _farmActuatorRepository.Commit();
        }
    }
}
