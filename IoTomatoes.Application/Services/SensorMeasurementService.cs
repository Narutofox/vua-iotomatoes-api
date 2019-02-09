using AutoMapper;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace IoTomatoes.Application.Services
{
    public class SensorMeasurementService:ISensorMeasurmentService
    {
        private readonly IFarmSensorMeasurementRepository _farmSensorMeasurementRepository;
        private readonly IMapper _mapper;
        public SensorMeasurementService(IFarmSensorMeasurementRepository farmSensorMeasurementRepository, IMapper mapper)
        {
            _mapper = mapper;
            _farmSensorMeasurementRepository = farmSensorMeasurementRepository;
        }


        public IEnumerable<SensorMeasurmentDTO> GetBySensorId(int sensorId) {
            var sensorMeasurement = _farmSensorMeasurementRepository.GetBySensorId(sensorId);

            if (sensorMeasurement != null)
            {
                return _mapper.Map<IEnumerable<SensorMeasurmentDTO>>(sensorMeasurement);
            }

            return null;
        }

        public void Create(SensorMeasurmentDTO sensorMeasurement)
        {
            var createSensorMeasurement = _mapper.Map<FarmSensorMeasurement>(sensorMeasurement);

            _farmSensorMeasurementRepository.Add(createSensorMeasurement);
            _farmSensorMeasurementRepository.Commit();
        }

    }
}
