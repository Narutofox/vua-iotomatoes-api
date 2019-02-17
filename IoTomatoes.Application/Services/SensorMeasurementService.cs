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
    public class SensorMeasurementService : ISensorMeasurmentService
    {
        private readonly IFarmSensorMeasurementRepository _farmSensorMeasurementRepository;
        private readonly IFarmRepository _farmRepository;
        private readonly IMapper _mapper;

        public SensorMeasurementService(IFarmSensorMeasurementRepository farmSensorMeasurementRepository, IFarmRepository farmRepository, IMapper mapper)
        {
            _farmSensorMeasurementRepository = farmSensorMeasurementRepository;
            _farmRepository = farmRepository;
            _mapper = mapper;
        }

        public List<SensorMeasurmentDTO> GetBySensorId(int sensorId)
        {
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

        public List<ChartMeasurementDTO> GetFarmMeasurements(int farmId, DateTime? dateFrom = null, DateTime? dateTo = null)
        {
            int n = 10;
            bool isOnlyDays = false;

            var farm = _farmRepository.Get(farmId);

            if (farm != null)
            {
                var farmSensors = farm.FarmSensors;
                var farmMeasurements = new List<ChartMeasurementDTO>();

                foreach (var farmSensor in farmSensors)
                {
                    var measurements = _farmSensorMeasurementRepository.GetSensorMeasurements(farmSensor.Id, dateFrom, dateTo);
                    ChartMeasurementDTO chartMeasurement = new ChartMeasurementDTO
                    {
                        FarmSensorId = farmSensor.Id,
                        SensorTypeId = farmSensor.Sensor.SensorTypeId
                    };


                    if (dateFrom.HasValue && dateTo.HasValue)
                    {
                        var timeSpan = dateTo.Value - dateFrom.Value;

                        if (timeSpan.Days % n == 0)
                        {
                            isOnlyDays = true;
                        }

                        var dT = (int)(Math.Round(timeSpan.TotalHours) / n);

                        for (int i = 0; i < n; i++)
                        {
                            if (isOnlyDays)
                            {
                                chartMeasurement.Labels.Add(dateFrom.Value.AddHours(dT * i).ToString("dd.MM.yy"));
                            }
                            else
                            {
                                chartMeasurement.Labels.Add(dateFrom.Value.AddHours(dT * i).ToString("dd.MM.yy HH:mm"));
                            }
                            chartMeasurement.Data.Add(decimal.Round(measurements
                            .Where(m => (m.DateCreated.Value >= dateFrom.Value.AddHours(dT * i)) && (m.DateCreated.Value < dateFrom.Value.AddHours(dT * (i + 1))))
                            .ToList()
                            .Select(m => m.Value)
                            .DefaultIfEmpty()
                            .Average(), 2, MidpointRounding.AwayFromZero));
                        }


                    }
                    else if (dateFrom.HasValue && !dateTo.HasValue)
                    {
                        int dT = 0;
                        if (DateTime.Today == dateFrom)
                        {
                            var timeSpan = DateTime.Now - dateFrom.Value;
                            dT = (int)((timeSpan.TotalMinutes) / n);


                        }
                        else
                        {
                            dT = 1440 / n;
                        }

                        for (int i = 0; i < n; i++)
                        {

                            chartMeasurement.Labels.Add(dateFrom.Value.AddMinutes(dT * i).ToString("HH:mm"));
                            chartMeasurement.Data.Add(decimal.Round(measurements
                                .Where(m => (m.DateCreated.Value >= dateFrom.Value.AddMinutes(dT * i)) && (m.DateCreated.Value < dateFrom.Value.AddMinutes(dT * (i + 1))))
                                .Select(m => m.Value)
                                .DefaultIfEmpty()
                                .Average(),2, MidpointRounding.AwayFromZero));
                        }
                    }

                    farmMeasurements.Add(chartMeasurement);
                }

                return farmMeasurements;
            }

            return null;
        }
    }

}
