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

        //// GET api/<controller>/5
        //[HttpGet("{id}")]
        //public string Get(int id)
        //{
        //    return "value";
        //}

        //// POST api/<controller>
        //[HttpPost]
        //public void Post([FromBody]string value)
        //{
        //}

        //// PUT api/<controller>/5
        //[HttpPut("{id}")]
        //public void Put(int id, [FromBody]string value)
        //{
        //}

        //// DELETE api/<controller>/5
        //[HttpDelete("{id}")]
        //public void Delete(int id)
        //{
        //}
    }
}
