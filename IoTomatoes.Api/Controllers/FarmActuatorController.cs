using System.Collections.Generic;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace IoTomatoes.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FarmActuatorController : ControllerBase
    {
        private readonly IFarmActuatorService _farmActuatorService;

        public FarmActuatorController(IFarmActuatorService farmActuatorService)
        {
            _farmActuatorService = farmActuatorService;
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] IList<FarmActuatorDTO> value)
        {
            _farmActuatorService.Update(id, value);
            return Ok();
        }
    }
}
