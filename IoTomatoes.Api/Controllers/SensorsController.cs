using System.Collections.Generic;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using IoTomatoes.Domain.Models;
using Microsoft.AspNetCore.Mvc;

namespace IoTomatoes.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SensorsController : ControllerBase
    {
        private readonly ISensorService _sensorService;

        public SensorsController(ISensorService sensorService)
        {
            _sensorService = sensorService;
        }

        [HttpGet]
        public List<SensorDTO> Get()
        {
            return _sensorService.GetAll();
        }

        [HttpGet("list")]
        public List<ListItemDTO> GetList()
        {
            return _sensorService.GetList();
        }



        [HttpGet("{id}")]
        public SensorDTO GetSensor(int id) {
            return _sensorService.Get(id);
        }
        [HttpPost]
        public IActionResult Post([FromBody] SensorDTO model)
        {
            _sensorService.Create(model);
            return Ok();
        }

        [HttpPut]
        public IActionResult Put([FromBody] SensorDTO model)
        {
            _sensorService.Update(model);
            return Ok();
        }

    }
}