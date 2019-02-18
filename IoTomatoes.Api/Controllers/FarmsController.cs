using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using IoTomatoes.Application.Models.Farm;
using Microsoft.AspNetCore.Mvc;

namespace IoTomatoes.Api.Controllers
{
    [Route("api/[controller]")]
    public class FarmsController : Controller
    {
        private readonly IFarmService _farmService;
        private readonly IRuleSetService _ruleSetService;
        private readonly IRuleService _ruleService;

        public FarmsController(
            IFarmService farmService,
            IRuleSetService ruleSetService,
            IRuleService ruleService)
        {
            _farmService = farmService;
            _ruleSetService = ruleSetService;
            _ruleService = ruleService;
        }

        // GET api/farms
        [HttpGet]
        public List<FarmDTO> Get()
        {
            return _farmService.GetAll();
        }

        [HttpGet("list")]
        public List<ListItemDTO> GetList()
        {
            return _farmService.GetList();
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

            return new Dictionary<string, string>();
        }

        // POST api/farms
        [HttpPost]
        public IActionResult Post([FromBody] CreateFarmDTO farm)
        {
            _farmService.Create(farm);
            return Ok();
        }

        // PUT api/farms
        [HttpPut]
        public IActionResult Put([FromBody] UpdateFarmDTO farm)
        {
            _farmService.Update(farm);
            return Ok();
        }

        // DELETE api/farms/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            _farmService.Remove(id);
            return Ok();
        }
    }
}
