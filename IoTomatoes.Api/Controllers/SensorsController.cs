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
        private readonly ISensorTypeService _sensorTypeService;

        public SensorsController(ISensorService sensorService, ISensorTypeService sensorTypeService)
        {
            _sensorService = sensorService;
            _sensorTypeService = sensorTypeService;
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

        [HttpGet("sensorType/{name}")]
        public SensorType GetSensorType(string name)
        {
            return _sensorTypeService.Get(name);
        }

        [HttpGet("sensorTypes")]
        public List<SensorType> GetSensorTypes()
        {
            return _sensorTypeService.GetAll();
        }

        [HttpGet("{id}")]
        public SensorDTO GetSensor(int id) {
            return _sensorService.Get(id);
        }


    }
}