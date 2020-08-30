using System.Collections.Generic;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using Microsoft.AspNetCore.Mvc;

namespace IoTomatoes.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MeasuringUnitController : ControllerBase
    {
        private readonly IMeasuringUnitService _measuringUnitService;

        public MeasuringUnitController(IMeasuringUnitService measuringUnitService)
        {
            _measuringUnitService = measuringUnitService;
        }

        [HttpGet("{id}")]
        public MeasuringUnitDTO GetMeasuringUnit(int id)
        {
            return _measuringUnitService.Get(id);
        }

        // GET: api/<controller>
        [HttpGet]
        public List<MeasuringUnitDTO> Get()
        {
            return _measuringUnitService.GetAll();
        }

        [HttpGet("list")]
        public List<ListItemDTO> GetList()
        {
            return _measuringUnitService.GetList();
        }

        [HttpPost]
        public IActionResult Post([FromBody] MeasuringUnitDTO model)
        {
            _measuringUnitService.Create(model);
            return Ok();
        }

        [HttpPut]
        public IActionResult Put([FromBody] MeasuringUnitDTO model)
        {
            _measuringUnitService.Update(model);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            _measuringUnitService.Delete(id);
            return Ok();
        }
    }
}
