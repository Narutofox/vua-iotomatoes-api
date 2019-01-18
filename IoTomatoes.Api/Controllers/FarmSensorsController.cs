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
    public class FarmSensorsController : Controller
    {

        private readonly Persistence.AppContext _db;

        public FarmSensorsController(Persistence.AppContext db)
        {
            _db = db;
        }

        // GET: api/<controller>
        [HttpGet]
        public async Task<IActionResult> Get(string farmId)
        {
            int _farmId;
            if (int.TryParse(farmId, out _farmId))
            {
                if (_db.Farms.FirstOrDefault(f => f.Id == _farmId) == null)
                {
                    return NotFound();
                }
                return Ok(JsonConvert.SerializeObject(_db.Farms.FirstOrDefault(f => f.Id == _farmId).FarmSensors));
            }
            return Ok(JsonConvert.SerializeObject(_db.FarmSensors.ToList()));
        }

        // GET api/<controller>/5
        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            return Ok(JsonConvert.SerializeObject(_db.FarmSensors.FirstOrDefault(fs=>fs.Id == id)));
        }

        // POST api/<controller>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody]string farmSensor)
        {
            FarmSensor fs = JsonConvert.DeserializeObject<FarmSensor>(farmSensor);
            if (fs.FarmId == null
                || _db.Farms.FirstOrDefault(f=>f.Id == fs.FarmId) == null)
            {
                return NotFound("Farm id invalid");
            }
            _db.FarmSensors.Add(fs);
            await _db.SaveChangesAsync();
            return CreatedAtAction("Get",new {id = fs.Id}, JsonConvert.SerializeObject(fs));
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
