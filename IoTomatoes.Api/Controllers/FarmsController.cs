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
        private readonly IRuleSetService _ruleSetService;
        private readonly IRuleService _ruleService;

        private readonly ISensorService sensor;
        private readonly ICityService city;
        private readonly ICountryService country;

        public FarmsController(
            IFarmService farmService, ISensorService sensor, ICityService city, ICountryService country,
            IRuleSetService ruleSetService, 
            IRuleService ruleService)
        {
            _farmService = farmService;
            _ruleSetService = ruleSetService;
            _ruleService = ruleService;

            this.sensor = sensor;
            this.country = country;
            this.city = city;
        }

        // GET api/farms
        [HttpGet]
        public IEnumerable<FarmDTO> Get()
        {
            CityDTO c = new CityDTO
            {
                Name = "Test city",
                Code = "TC",
                CountryId = 1
            };

            city.Create(c);
            var ci = city.GetAll();

            return _farmService.GetAll();
        }

        // GET: api/farms/4
        [HttpGet("{id}")]
        public FarmDTO Get(int id)
        {
            return _farmService.Get(id);
        }

        // GET: api/farms/4/ruleset
        [HttpGet("{id}/ruleset")]
        public Dictionary<string, string> GetRuleSet(int id)
        {
            var ruleSet = _ruleSetService.GetByFarm(id);

            if(ruleSet != null)
            {
                return _ruleService.GetDictionary(ruleSet.Rules);
            }

            return null;
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
