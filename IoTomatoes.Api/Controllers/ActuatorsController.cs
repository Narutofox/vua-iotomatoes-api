using System.Collections.Generic;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using Microsoft.AspNetCore.Mvc;

namespace IoTomatoes.Api.Controllers
{
    [Route("api/[controller]")]
    public class ActuatorsController : Controller
    {
        private readonly IActuatorService _actuatorService;

        public ActuatorsController(IActuatorService actuatorService)
        {
            _actuatorService = actuatorService;
        }

        // GET: api/<controller>
        [HttpGet]
        public List<ActuatorDTO> Get()
        {
            return _actuatorService.GetAll();
        }

        [HttpGet("list")]
        public List<ListItemDTO> GetList()
        {
            return _actuatorService.GetList();
        }

        //// GET api/<controller>/5
        //[HttpGet("{id}")]
        //public string Get(int id)
        //{
        //    return "value";
        //}

        //// POST api/<controller>
        //[HttpPost]
        //public void Post([FromBody]string value)
        //{
        //}


        //[HttpPut("{id}")]
        //public void Put(int id, [FromBody] List<ActuatorDTO> actuators)
        //{
        //    _actuatorService
        //}

        //// DELETE api/<controller>/5
        //[HttpDelete("{id}")]
        //public void Delete(int id)
        //{
        //}
    }
}
