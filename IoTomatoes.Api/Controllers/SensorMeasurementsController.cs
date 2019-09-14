using System;
using System.Collections.Generic;
using System.Linq;
using IoTomatoes.Api.Hubs;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;

namespace IoTomatoes.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SensorMeasurementsController : ControllerBase
    {
        private readonly ISensorMeasurmentService _sensorMeasurementService;
        private readonly IHubContext<SensorMeasurementHub> _sensorMeasurementHubContext;
        private readonly IFarmService _farmService;

        public SensorMeasurementsController(ISensorMeasurmentService sensorMeasurementService,
            IHubContext<SensorMeasurementHub> sensorMeasurementHub,
            IFarmService farmService)
        {
            _sensorMeasurementService = sensorMeasurementService;
            _sensorMeasurementHubContext = sensorMeasurementHub;
            _farmService = farmService;
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
        public IActionResult Post([FromBody] Dictionary<int, decimal> farmSensorsMeasurements) {
            _sensorMeasurementService.CreateFromDictionary(farmSensorsMeasurements);

            int[] farmIds =_farmService.GetFarmIdsByFarmSensoreIds(farmSensorsMeasurements.Select(x=>x.Key).ToArray());

            foreach (int farmId in farmIds)
            {
                _sensorMeasurementHubContext.Clients.Group("FarmId:" + farmId).SendAsync("SensorMeasurementNotification", farmId);
            }
            return Ok();
        }

    }
}