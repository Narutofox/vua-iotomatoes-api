using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using IoTomatoes.Domain.Models;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace IoTomatoes.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SensorTypeController : ControllerBase
    {
        private readonly ISensorTypeService _sensorTypeService;
        public SensorTypeController(ISensorTypeService sensorTypeService)
        {
            _sensorTypeService = sensorTypeService;
        }
        // GET: api/<SensorTypeController>
        [HttpGet]
        public IList<SensorTypeDTO> Get()
        {
            return _sensorTypeService.GetAll();
        }

        [HttpGet("list")]
        public List<ListItemDTO> GetSensorTypesList()
        {
            return _sensorTypeService.GetList();
        }

        // GET api/<SensorTypeController>/5
        [HttpGet("{id}")]
        public SensorTypeDTO Get(int id)
        {
            return _sensorTypeService.Get(id);
        }

        // POST api/<SensorTypeController>
        [HttpPost]
        public void Post([FromBody] SensorTypeDTO value)
        {
        }

        // PUT api/<SensorTypeController>/5
        [HttpPut]
        public void Put([FromBody] SensorTypeDTO value)
        {
        }

        // DELETE api/<SensorTypeController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
