using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using IoTomatoes.Domain.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace IoTomatoes.Api.Controllers
{
    [Route("api/[controller]")]
    public class SensorMeasurmentsController : Controller
    {
        private readonly Persistence.AppContext _db;

        public SensorMeasurmentsController(Persistence.AppContext db)
        {
            _db = db;
        }
        // GET: api/<controller>
        [HttpGet]
        public async Task<IActionResult> Get(string farmSensorId)
        {
            int _farmSensorId;
            if (int.TryParse(farmSensorId, out _farmSensorId))
            {
                if (_db.FarmSensors.FirstOrDefault(fs => fs.Id == _farmSensorId) == null)
                {
                    return NotFound();
                }
                return Ok(JsonConvert.SerializeObject(_db.FarmSensors.FirstOrDefault(fs => fs.Id == _farmSensorId).FarmSensorMeasurements));
            }

            return Ok(JsonConvert.SerializeObject(_db.FarmSensorMeasurements.ToList()));
        }

        // GET api/<controller>/5
        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            return Ok(JsonConvert.SerializeObject(_db.FarmSensorMeasurements.FirstOrDefault(fsm => fsm.Id == id)));              

        }

        // POST api/<controller>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody]string value)
        {
            FarmSensorMeasurement fsm = Newtonsoft.Json.JsonConvert.DeserializeObject<FarmSensorMeasurement>(value);
            _db.FarmSensorMeasurements.Add(fsm);
            await _db.SaveChangesAsync();
            return CreatedAtAction("Get", new { id =fsm.Id},JsonConvert.SerializeObject(fsm));
        }

        // PUT api/<controller>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
