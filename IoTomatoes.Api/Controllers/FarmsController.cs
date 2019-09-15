using System.Collections.Generic;
using System.Linq;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using IoTomatoes.Application.Models.Farm;
using IoTomatoes.Application.Models.RuleSet;
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

        [HttpGet("{id}/rules")]
        public List<RuleDTO> GetRules(int id)
        {
            RuleSetDTO ruleSet = _ruleSetService.GetByFarm(id);

            if (ruleSet != null)
            {
                return ruleSet.Rules;
            }

            return new List<RuleDTO>();
        }

        [HttpPost("{id}/createOrUpdateRules")]
        public IActionResult CreateOrUpdateRules(int id, [FromBody] List<RuleDTO> rules)
        {
            RuleSetDTO ruleSet = _ruleSetService.GetByFarm(id);

            if (ruleSet != null && rules.TrueForAll(x=>!string.IsNullOrEmpty(x.Code)))
            {
                
                foreach (var rule in rules)
                {
                    rule.RuleSetId = ruleSet.Id;
                    rule.Active = !string.IsNullOrEmpty(rule.Conditions);
                    if (ruleSet.Rules.Any(x=>x.Code == rule.Code))
                    {
                        _ruleService.Update(rule);
                    }
                    else
                    {
                        _ruleService.Create(rule);
                    }
                }
            }

            return Ok();
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
