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
    public class RulesController : Controller
    {
        private readonly Persistence.AppContext _db;
        public RulesController(Persistence.AppContext db)
        {
            _db = db;
        }

        // GET: api/<controller>
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            return Ok(JsonConvert.SerializeObject(_db.Rules.ToList()));
        }

        // GET api/<controller>/5
        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            return Ok(JsonConvert.SerializeObject(_db.Rules.FirstOrDefault(r=>r.Id == id)));
        }

        // POST api/<controller>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody]string rule)
        {
            Rule _rule = JsonConvert.DeserializeObject<Rule>(rule);
            _db.Rules.Add(_rule);
            await _db.SaveChangesAsync();
            return CreatedAtAction("Get", new { id = _rule.Id }, _rule);
        }

        // PUT api/<controller>/5
        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody]string rule)
        {
            Rule _rule = JsonConvert.DeserializeObject<Rule>(rule);
            if (_db.Rules.FirstOrDefault(r=>r.Id == id) == null)
            {
                return NotFound();
            }
            _db.Rules.Update(_rule);
            await _db.SaveChangesAsync();
            return Ok(_rule);
        }

        // DELETE api/<controller>/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            Rule _rule = _db.Rules.FirstOrDefault(r => r.Id == id);
            if (_rule == null)
            {
                return NotFound();
            }
            _db.Rules.Remove(_rule);
            await _db.SaveChangesAsync();
            return Ok(_rule);
        }
    }
}
