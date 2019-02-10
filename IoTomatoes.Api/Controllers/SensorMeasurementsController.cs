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
        public IEnumerable<SensorMeasurmentDTO> GetBySensorId(int sensorId) {

            return _sensorMeasurementService.GetBySensorId(sensorId);
        }

        [HttpPost]
        public void Post([FromBody] Dictionary<int, decimal> farmSensorsMeasurements) {
            if (farmSensorsMeasurements == null)
            {
                throw new ArgumentNullException(nameof(farmSensorsMeasurements));
            }

            _sensorMeasurementService.CreateFromDictionary(farmSensorsMeasurements);
        }

    }
}