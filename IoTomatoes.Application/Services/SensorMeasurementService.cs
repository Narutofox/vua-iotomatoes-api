using AutoMapper;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace IoTomatoes.Application.Services
{
    public class SensorMeasurementService : ISensorMeasurmentService
    {
        private readonly IFarmSensorMeasurementRepository _farmSensorMeasurementRepository;
        private readonly IFarmRepository _farmRepository;
        private readonly IMapper _mapper;

        public SensorMeasurementService(IFarmSensorMeasurementRepository farmSensorMeasurementRepository, IFarmRepository farmRepository,IMapper mapper)
        {
            _farmSensorMeasurementRepository = farmSensorMeasurementRepository;
            _farmRepository = farmRepository;
            _mapper = mapper;
        }

        public List<SensorMeasurmentDTO> GetBySensorId(int sensorId) {
            var sensorMeasurement = _farmSensorMeasurementRepository.GetBySensorId(sensorId);

            if (sensorMeasurement != null)
            {
                return sensorMeasurement.Select(sm => _mapper.Map<SensorMeasurmentDTO>(sm)).ToList();
            }

            return null;
        }

        public void CreateFromDictionary(Dictionary<int, decimal> sensorMeasurementsDictionary)
        {
            foreach (var key in sensorMeasurementsDictionary.Keys)
            {
                var sensorMeasurement = new SensorMeasurmentDTO
                {
                    FarmSensorId = key,
                    Value = sensorMeasurementsDictionary[key],
                    DateCreated = DateTime.Now
                };

                var createSensorMeasurement = _mapper.Map<FarmSensorMeasurement>(sensorMeasurement);
                _farmSensorMeasurementRepository.Add(createSensorMeasurement);
            }

            _farmSensorMeasurementRepository.Commit();
        }

        public Dictionary<int, ChartMeasurementDTO> GetFarmMeasurements(int farmId, DateTime? dateFrom = null, DateTime? dateTo = null)
        {
            var farm = _farmRepository.Get(farmId);

            if(farm != null)
            {
                var farmSensors = farm.FarmSensors;
                var farmMeasurements = new Dictionary<int, ChartMeasurementDTO>();

                foreach (var farmSensor in farmSensors)
                {
                    var measurements = _farmSensorMeasurementRepository.GetSensorMeasurements(farmSensor.Id, dateFrom, dateTo);
                    ChartMeasurementDTO chartMeasurement = new ChartMeasurementDTO();

                    if(dateFrom.HasValue && dateTo.HasValue)
                    {
                        var timeSpan = dateTo.Value - dateFrom.Value;

                        if(timeSpan.Days <= 4)
                        {

                        }
                        else
                        {

                        }
                    } 
                    else if(dateTo.HasValue && !dateFrom.HasValue)
                    {

                    }

                    farmMeasurements.Add(farmSensor.Sensor.SensorTypeId, chartMeasurement);
                }

                return farmMeasurements;
            }

            return null;
        }
    }
}
