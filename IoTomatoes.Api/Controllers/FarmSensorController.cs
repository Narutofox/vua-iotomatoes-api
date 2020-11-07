using System.Collections.Generic;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using Microsoft.AspNetCore.Mvc;

namespace IoTomatoes.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FarmSensorController : ControllerBase
    {
        private readonly IFarmSensorService _farmSensorService;

        public FarmSensorController(IFarmSensorService farmSensorService)
        {
            _farmSensorService = farmSensorService;
        }

        [HttpGet]
        public IList<FarmSensorDTO> FarmSensors(int farmId)
        {
            IList<FarmSensorDTO> farmSensors = _farmSensorService.GetFarmSensors(farmId);
            return farmSensors;
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] IList<FarmSensorDTO> value)
        {
            _farmSensorService.Update(id, value);
            return Ok();
        }
    }
}
