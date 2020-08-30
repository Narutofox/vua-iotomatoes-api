using System.Collections.Generic;
using System.Linq;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using IoTomatoes.Application.Models.Farm;
using IoTomatoes.Application.Models.RuleSet;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace IoTomatoes.Api.Controllers
{
    [Route("api/[controller]")]
    public class FarmsController : Controller
    {
        private readonly IFarmService _farmService;
        private readonly IRuleSetService _ruleSetService;
        private readonly IRuleService _ruleService;
        private readonly IActuatorService _actuatorService;

        public FarmsController(
            IFarmService farmService,
            IRuleSetService ruleSetService,
            IRuleService ruleService,
            IActuatorService actuatorService)
        {
            _farmService = farmService;
            _ruleSetService = ruleSetService;
            _ruleService = ruleService;
            _actuatorService = actuatorService;
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
        public IActionResult CreateOrUpdateRules(int id, [FromBody] List<ConditionsForRules> conditions)
        {
            RuleSetDTO ruleSet = _ruleSetService.GetByFarm(id);
            List<ActuatorDTO> actuators = _actuatorService.GetByFarm(id);
            ConditionsForRules condition = new ConditionsForRules();
            condition.SetModelFromList(conditions);

            if (ruleSet != null && conditions.Any())
            {
                string code = "ALL";


                if (ruleSet.Rules.Any(x => x.Code == code))
                {
                    RuleDTO rule = ruleSet.Rules.First(x => x.Code == code);
                    ConditionsForRules existingConditions = JsonConvert.DeserializeObject<ConditionsForRules>(rule.Conditions);
                    existingConditions.SetModelFromList(conditions);
                    rule.Conditions = JsonConvert.SerializeObject(existingConditions);
                    _ruleService.Update(rule);
                }
                else
                {
                    RuleDTO rule = new RuleDTO
                    {
                        Code = "ALL",
                        Conditions = JsonConvert.SerializeObject(condition),
                        RuleSetId = ruleSet.Id,
                        Active = true
                    };
                    _ruleService.Create(rule);
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
