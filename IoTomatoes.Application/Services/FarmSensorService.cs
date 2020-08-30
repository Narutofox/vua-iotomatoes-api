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
    public class FarmSensorService : IFarmSensorService
    {
        private readonly IFarmSensorMeasurmentRepository _farmSensorRepository;
        private readonly IMapper _mapper;

        public FarmSensorService
            (IFarmSensorMeasurmentRepository farmSensorRepository,
            IMapper mapper)
        {
            _farmSensorRepository = farmSensorRepository;
            _mapper = mapper;
        }

        public List<FarmSensorDTO> GetFarmSensors(int farmId)
        {
            List<FarmSensor> farmSensors = 
                _farmSensorRepository.
                SelectBy(x=>x.FarmId == farmId)
                .ToList();

                return _mapper.Map<List<FarmSensorDTO>>(farmSensors);
        }

        public void Update(int farmId, IList<FarmSensorDTO> farmSensorsDTO)
        {
            IList<FarmSensor> farmSensors = _farmSensorRepository.SelectBy(x => x.FarmId == farmId).ToList();
            foreach (FarmSensorDTO farmSensorDTO in farmSensorsDTO)
            {
                if (!farmSensors.Any(x => x.SensorId == farmSensorDTO.SensorId))
                {
                    FarmSensor farmSensor = new FarmSensor() { FarmId = farmId };
                    _mapper.Map(farmSensorDTO, farmSensor);
                    farmSensor.DateCreated = DateTime.Now;
                    farmSensor.DateModified = DateTime.Now;
                    _farmSensorRepository.Add(farmSensor);
                }
            }

            _farmSensorRepository.Commit();
        }
    }
}
