﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using IoTomatoes.Api.Hubs;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;

namespace IoTomatoes.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SensorMeasurementsController : ControllerBase
    {
        private readonly IFarmService _farmService;
        private readonly ISensorMeasurmentService _sensorMeasurementService;
        private readonly IFarmSensorService _farmSensorService;
        private readonly ISensorService _sensorService;
        private readonly IHubContext<SensorMeasurementHub> _sensorMeasurementHubContext;
        private readonly IHttpContextAccessor _httpContextAccessor;
        public SensorMeasurementsController(
            ISensorMeasurmentService sensorMeasurementService,
            IHubContext<SensorMeasurementHub> sensorMeasurementHub,
            IFarmSensorService farmSensorService,
            ISensorService sensorService,
            IFarmService farmService,
            IHttpContextAccessor httpContextAccessor)
        {
            _sensorMeasurementService = sensorMeasurementService;
            _sensorMeasurementHubContext = sensorMeasurementHub;
            _farmSensorService = farmSensorService;
            _sensorService = sensorService;
            _farmService = farmService;
            _httpContextAccessor = httpContextAccessor;
        }

        [HttpGet("{sensorId}")]
        public List<SensorMeasurmentDTO> GetBySensorId(int sensorId)
        {
            return _sensorMeasurementService.GetBySensorId(sensorId);
        }

        [HttpGet]
        public List<ChartMeasurementDTO> GetFarmMeasurements(int farmId, DateTime? dateFrom, DateTime? dateTo)
        {
            return _sensorMeasurementService.GetFarmMeasurements(farmId, dateFrom, dateTo);
        }

        [HttpGet("current")]
        public List<ChartMeasurementDTO> GetLastFarmMeasurements(int farmId)
        {
            return _sensorMeasurementService.GetLastFarmMeasurements2(farmId);
        }

        [HttpPost]
        public IActionResult Post([FromBody] FarmaSensorMeasurmentDTO model) 
        {
            List<FarmSensorDTO> farmSensors = _farmSensorService.GetFarmSensors(model.FarmId);
            _sensorMeasurementHubContext.Clients.Group("FarmId:" + model.FarmId)
                .SendAsync("SensorMeasurementNotification", model.FarmId);
            IList<SensorDTO> sensors = _sensorService.GetBy(farmSensors.Select(x=>x.SensorId));

            if (model.Light.HasValue &&
                sensors.Any(x=>x.SensorTypeCode.Trim().StartsWith("LGT")))
            {
                SensorDTO sensorDTO = sensors.First(x => x.Code.Trim().StartsWith("LGT"));
                _sensorMeasurementService.Create(new SensorMeasurmentDTO 
                { 
                    FarmSensorId = farmSensors.First(x => x.SensorId == sensorDTO.Id).Id,
                    Value = model.Light.Value
                });
            }
            if (model.Temperature.HasValue &&
                sensors.Any(x => x.SensorTypeCode.Trim().StartsWith("TMP")))
            {
                SensorDTO sensorDTO = sensors.First(x => x.Code.Trim().StartsWith("TMP"));
                _sensorMeasurementService.Create(new SensorMeasurmentDTO
                {
                    FarmSensorId = farmSensors.First(x => x.SensorId == sensorDTO.Id).Id,
                    Value = model.Temperature.Value
                });
            }
            if (model.AirHumidity.HasValue &&
                    sensors.Any(x => x.SensorTypeCode.Trim().StartsWith("AHY")))
            {
                SensorDTO sensorDTO = sensors.First(x => x.Code.Trim().StartsWith("AHY"));
                _sensorMeasurementService.Create(new SensorMeasurmentDTO
                {
                    FarmSensorId = farmSensors.First(x => x.SensorId == sensorDTO.Id).Id,
                    Value = model.AirHumidity.Value
                });
            }
            if (model.SoilHumidity.HasValue &&
                    sensors.Any(x => x.SensorTypeCode.Trim().StartsWith("SHY")))
            {
                SensorDTO sensorDTO = sensors.First(x => x.Code.Trim().StartsWith("SHY"));
                _sensorMeasurementService.Create(new SensorMeasurmentDTO
                {
                    FarmSensorId = farmSensors.First(x => x.SensorId == sensorDTO.Id).Id,
                    Value = model.SoilHumidity.Value
                });
            }

           FarmDTO farmDTO = _farmService.Get(model.FarmId);
           farmDTO.IpAddress = GetClientIpv4();
            _farmService.Update(farmDTO);
            return Ok();
        }

        private string GetClientIpv4()
        {
             return _httpContextAccessor.HttpContext.Connection.RemoteIpAddress.MapToIPv4().ToString();
        }

    }
}


/*
 TODO ovo je ok s obzirm da je trenutno jedna farma(kutija)= jedna biljka, 
    ali ako se to promjeni onda se mora kao parametar modela prosljediti točan id senzora 
    i u bazi negdje zapisati koji senzor je za koju biljku
*/