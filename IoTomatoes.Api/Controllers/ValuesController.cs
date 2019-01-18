using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace IoTomatoes.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {

        private readonly Persistence.AppContext _db;


        public ValuesController(Persistence.AppContext db)
        {
            _db = db;
        }
        // GET api/values
        [HttpGet]
        public ActionResult<string> Get()
        {
            return  Newtonsoft.Json.JsonConvert.SerializeObject(_db.Farms
                .Include(f=>f.City).ThenInclude(c=>c.Country)
                .Include(f => f.FarmRuleSets).ThenInclude(frs=>frs.RuleSet).ThenInclude(rs=>rs.Rules)
                .Include(f => f.FarmSensors).ThenInclude(fs=>fs.Sensor)
                .ToList()
                //, Newtonsoft.Json.Formatting.Indented, new Newtonsoft.Json.JsonSerializerSettings{
                //    ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
                //}
                ) ;

            return new JsonResult(_db.Farms
                .Include(f=>f.FarmRuleSets)
                .Include(f=>f.FarmSensors)
                .ToList());
            //return new string[] { "value1", "value2" };
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            return "value";
        }

        // POST api/values
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
