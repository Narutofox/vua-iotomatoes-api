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
    public class SensorService : ISensorService
    {
        private readonly ISensorRepository _sensorRepository;
        private readonly IMapper _mapper;
        public SensorService(ISensorRepository sensorRepository, IMapper mapper)
        {
            _sensorRepository = sensorRepository;
            _mapper = mapper;
        }

        public void Create(SensorDTO sensor)
        {
            var createSensor = _mapper.Map<Sensor>(sensor);
            createSensor.DateCreated = DateTime.Now;
            createSensor.DateModified = DateTime.Now;

            _sensorRepository.Add(createSensor);
            _sensorRepository.Commit();
        }

        public SensorDTO Get(int id)
        {
            var sensor = _sensorRepository.Get(id);

            if (sensor != null)
            {
                return _mapper.Map<SensorDTO>(sensor);
            }

            return null;
        }

        public List<SensorDTO> GetAll()
        {
            return _sensorRepository.GetAll()
                .Select(sensor => _mapper.Map<SensorDTO>(sensor))
                .ToList();
        }

        public void Update(SensorDTO sensor)
        {
            var updateSensor = _mapper.Map<Sensor>(sensor);

            _sensorRepository.Update(updateSensor);
            _sensorRepository.Commit();
        }

        public void Remove(int id)
        {
            var removeSensor = _sensorRepository.Get(id);
            _sensorRepository.Remove(removeSensor);
            _sensorRepository.Commit();
        }

        public List<ListItemDTO> GetList()
        {
            return _sensorRepository.GetAll()
                .Select(sensor => _mapper.Map<ListItemDTO>(sensor))
                .ToList();
        }
    }
}
