using System.Collections.Generic;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using Microsoft.AspNetCore.Mvc;

namespace IoTomatoes.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FarmPlantController : ControllerBase
    {
        private readonly IFarmPlantService _service;

        public FarmPlantController(IFarmPlantService service)
        {
            _service = service;
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] IList<FarmPlantDTO> value)
        {
            _service.Update(id, value);
            return Ok();
        }
    }
}
