﻿using AutoMapper;
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

        public SensorMeasurementService(IFarmSensorMeasurementRepository farmSensorMeasurementRepository, 
            IFarmRepository farmRepository,
            IMapper mapper)
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

        public void Create(SensorMeasurmentDTO model)
        {
            model.DateCreated = DateTime.Now;
            FarmSensorMeasurement createSensorMeasurement = _mapper.Map<FarmSensorMeasurement>(model);
            _farmSensorMeasurementRepository.Add(createSensorMeasurement);
            _farmSensorMeasurementRepository.Commit();
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

                    foreach (var measurement in measurements)
                    {
                        string label = "";
                        if (measurements
                            .Any(x => x.DateCreated.Value.Date != 
                            measurement.DateCreated.Value.Date) || dateTo.HasValue ||
                            (dateFrom.HasValue && dateFrom.Value.Date != DateTime.Now.Date))
                        {
                            label = measurement.DateCreated.Value.ToString("dd.MM.yyyy HH:mm");
                        }
                        else
                        {
                            label = measurement.DateCreated.Value.ToString("HH:mm");
                        }
                         
                        chartMeasurement.Labels.Add(label);
                        chartMeasurement.Data.Add(measurement.Value);
                    }

                    //if (dateFrom.HasValue && dateTo.HasValue)
                    //{
                    //    var timeSpan = dateTo.Value - dateFrom.Value;

                    //    if (timeSpan.Days % n == 0)
                    //    {
                    //        isOnlyDays = true;
                    //    }

                    //    double hours = Math.Round(timeSpan.TotalHours) / n;
                    //    var dT = (int)hours;

                    //    for (int i = 0; i < n; i++)
                    //    {
                    //        string dateFormat = "dd.MM.yyyy HH:mm";

                    //        if (isOnlyDays)
                    //        {
                    //            dateFormat = "dd.MM.yyyy";
                    //        }

                    //        var dateFromWithAddedHours = dateFrom.Value.AddHours(dT * i);
                    //        string label = dateFromWithAddedHours.ToString(dateFormat);
                    //        chartMeasurement.Labels.Add(label);

                    //        int index = i;
                    //        var decimalMeasurements = measurements
                    //            .Where(m => m.DateCreated != null && m.DateCreated.Value >= dateFromWithAddedHours && (m.DateCreated.Value < dateFrom.Value.AddHours(dT * (index + 1))))
                    //            .Select(m => m.Value)
                    //            .DefaultIfEmpty();

                    //        decimal measurement = decimal.Round(decimalMeasurements.Average(), 2, MidpointRounding.AwayFromZero);
                    //        chartMeasurement.Data.Add(measurement);
                    //    }
                    //}
                    //else if (dateFrom.HasValue)
                    //{
                    //    int dT;

                    //    if (DateTime.Today == dateFrom)
                    //    {
                    //        var timeSpan = DateTime.Now - dateFrom.Value;
                    //        var minutes = timeSpan.TotalMinutes / n;
                    //        dT = (int)minutes;
                    //    }
                    //    else
                    //    {
                    //        dT = 1440 / n;
                    //    }

                    //    for (int i = 0; i < n; i++)
                    //    {
                    //        var dateFromWithAddedMinutes = dateFrom.Value.AddMinutes(dT * i);
                           
                    //        var index = i;
                    //        var decimalMeasurements = measurements
                    //            .Where(m => m.DateCreated != null && m.DateCreated.Value >= dateFromWithAddedMinutes && (m.DateCreated.Value < dateFrom.Value.AddMinutes(dT * (index + 1))))
                    //            .Select(m => m.Value)
                    //            .DefaultIfEmpty();

                    //        decimal measurement = 0;

                    //        string label = dateFromWithAddedMinutes.ToString("HH:mm");
                    //        chartMeasurement.Labels.Add(label);
                    //        measurement = decimal.Round(decimalMeasurements.Average(), 2, MidpointRounding.AwayFromZero);
                    //        chartMeasurement.Data.Add(measurement);
                    //    }
                    //}

                    farmMeasurements.Add(chartMeasurement);
                }

                return farmMeasurements;
            }

            return null;
        }

        public Dictionary<int, decimal> GetLastFarmMeasurements(int farmId)
        {
            var farm = _farmRepository.Get(farmId);
            Dictionary<int, decimal> lastFarmMeasurements = new Dictionary<int, decimal>();
            if (farm != null)
            {
                var farmSensors = farm.FarmSensors;
                foreach(var farmSensor in farmSensors)
                {
                    var measurement = _farmSensorMeasurementRepository.GetLastSensorMeasurement(farmSensor.Id);
                    var sensorTypeId = farmSensor.Sensor.SensorTypeId;

                    if (!lastFarmMeasurements.ContainsKey(sensorTypeId))
                    {
                        lastFarmMeasurements.Add(sensorTypeId, measurement != null ? measurement.Value : 0M);
                    }
                }
            }

            return lastFarmMeasurements;
        }

        public List<ChartMeasurementDTO> GetLastFarmMeasurements2(int farmId)
        {
            var farm = _farmRepository.Get(farmId);

            if (farm != null)
            {
                ICollection<FarmSensor> farmSensors = farm.FarmSensors;
                var farmMeasurements = new List<ChartMeasurementDTO>();

                foreach (var farmSensor in farmSensors)
                {
                    FarmSensorMeasurement measurements = _farmSensorMeasurementRepository.GetLastSensorMeasurement(farmSensor.Id);
                    ChartMeasurementDTO chartMeasurement = new ChartMeasurementDTO
                    {
                        FarmSensorId = farmSensor.Id,
                        SensorTypeId = farmSensor.Sensor.SensorTypeId
                    };

                    string label = measurements.DateCreated.Value.ToString("dd.MM.yyyy HH:mm");
                    chartMeasurement.Labels.Add(label);

                    decimal measurement = decimal.Round(measurements.Value, 2, MidpointRounding.AwayFromZero);
                    chartMeasurement.Data.Add(measurement);
                               
                    farmMeasurements.Add(chartMeasurement);
                }

                return farmMeasurements;
            }

            return null;
        }
    }

}
