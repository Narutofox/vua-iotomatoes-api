using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using IoTomatoes.Application.Models.RuleSet;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace IoTomatoes.Api.Controllers
{
    [Route("api/[controller]")]
    public class RuleSetsController : Controller
    {
        private readonly IRuleSetService _ruleSetService;

        public RuleSetsController(IRuleSetService ruleSetService)
        {
            _ruleSetService = ruleSetService;
        }

        // GET: api/<controller>
        [HttpGet]
        public List<RuleSetDTO> Get()
        {
            return _ruleSetService.GetAll();
        }

        [HttpGet("list")]
        public List<ListItemDTO> GetList()
        {
            return _ruleSetService.GetList();
        }

        [HttpGet("{id}")]
        public RuleSetDTO Get(int id)
        {
            return _ruleSetService.Get(id);
        }

        // POST api/<controller>
        [HttpPost]
        public IActionResult Post([FromBody] CreateRuleSetDTO ruleSet)
        {
            _ruleSetService.Create(ruleSet);
            return Ok();
        }

        // PUT api/<controller>/5
        [HttpPut]
        public IActionResult Put([FromBody] UpdateRuleSetDTO ruleSet)
        {
            _ruleSetService.Update(ruleSet);
            return Ok();
        }

        // DELETE api/<controller>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            _ruleSetService.Remove(id);
            return NoContent();
        }
    }
}
