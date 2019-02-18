using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace IoTomatoes.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SensorMeasurementsController : ControllerBase
    {
        private readonly ISensorMeasurmentService _sensorMeasurementService;

        public SensorMeasurementsController(ISensorMeasurmentService sensorMeasurementService)
        {
            _sensorMeasurementService = sensorMeasurementService;
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
        public Dictionary<int, decimal> GetLastFarmMeasurements(int farmId)
        {
            return _sensorMeasurementService.GetLastFarmMeasurements(farmId);
        }

        [HttpPost]
        public IActionResult Post([FromBody] Dictionary<int, decimal> farmSensorsMeasurements) {
            _sensorMeasurementService.CreateFromDictionary(farmSensorsMeasurements);
            return Ok();
        }

    }
}