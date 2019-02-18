using System;
using System.Collections.Generic;
using System.Linq;
using AutoMapper;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using IoTomatoes.Application.Models.Farm;
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

        public List<FarmDTO> GetByUserId(int userId)
        {
            return _farmRepository.GetByUserId(userId)
                    .Select(farm => _mapper.Map<FarmDTO>(farm))
                    .ToList();
        }

        public void Create(CreateFarmDTO farm)
        {
            var createFarm = _mapper.Map<Farm>(farm);
            createFarm.DateCreated = DateTime.Now;
            createFarm.DateModified = DateTime.Now;
            _farmRepository.Add(createFarm);

            foreach (var actuatorId in farm.ActuatorIds)
            {
                createFarm.FarmActuators.Add(new FarmActuator
                {
                    FarmId = createFarm.Id,
                    ActuatorId = actuatorId
                });
            }

            foreach(var sensorId in farm.SensorIds)
            {
                createFarm.FarmSensors.Add(new FarmSensor
                {
                    FarmId = createFarm.Id,
                    SensorId = sensorId
                });
            }

            foreach(var plantId in farm.PlantIds)
            {
                createFarm.FarmPlants.Add(new FarmPlant
                {
                    FarmId = createFarm.Id,
                    PlantId = plantId
                });
            }

            _farmRepository.Commit();
        }
        public void Update(UpdateFarmDTO farm)
        {
            var dbFarm = _farmRepository.Get(farm.Id);
            _mapper.Map(farm, dbFarm);
            dbFarm.DateModified = DateTime.Now;

            _farmRepository.Update(dbFarm);
            _farmRepository.Commit();
        }

        public void Remove(int id)
        {
            var removeFarm = _farmRepository.Get(id);
            _farmRepository.Remove(removeFarm);
            _farmRepository.Commit();
        }

        public List<ListItemDTO> GetList()
        {
            return _farmRepository.GetAll()
                .Select(farm => _mapper.Map<ListItemDTO>(farm))
                .ToList();
        }

        public List<ListItemDTO> GetListByUserId(int userId)
        {
            return _farmRepository.GetByUserId(userId)
                    .Select(farm => _mapper.Map<ListItemDTO>(farm))
                    .ToList();
        }
    }
}
