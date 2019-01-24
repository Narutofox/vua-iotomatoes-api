using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace IoTomatoes.Api.Controllers
{
    [Route("api/[controller]")]
    public class FarmsController : Controller
    {
        private readonly IFarmService _farmService;

        public FarmsController(IFarmService farmService)
        {
            _farmService = farmService;
        }

        // GET api/farms
        [HttpGet]
        public IEnumerable<FarmDTO> Get()
        {
            return _farmService.GetAll();
        }

        // GET: api/farms/id
        [HttpGet("{id}")]
        public FarmDTO Get(int id)
        {
            return _farmService.Get(id);
        }

        // POST api/farms
        [HttpPost]
        public void Post([FromBody]string value)
        {
        }

        // PUT api/farms/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/farms/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
