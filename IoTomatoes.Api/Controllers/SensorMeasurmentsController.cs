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
    public class SensorMeasurmentsController : ControllerBase
    {
        private readonly ISensorMeasurmentService _sensorMeasurmentService;

        public SensorMeasurmentsController(ISensorMeasurmentService sensorMeasurmentService)
        {
            _sensorMeasurmentService = sensorMeasurmentService;
        }


        [HttpGet("{sensorId}")]
        public IEnumerable<SensorMeasurmentDTO> GetBySensorId(int sensorId) {

            return _sensorMeasurmentService.GetBySensorId(sensorId);
        }

        [HttpPost]
        public void Post([FromBody] Dictionary<int, decimal> farmSensorsMeasurements) {
            if (farmSensorsMeasurements == null)
            {
                throw new ArgumentNullException(nameof(farmSensorsMeasurements));
            }

            _sensorMeasurmentService.CreateFromDictionary(farmSensorsMeasurements);
        }

    }
}