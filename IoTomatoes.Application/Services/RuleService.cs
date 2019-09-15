using System;
using System.Collections.Generic;
using System.Linq;
using AutoMapper;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;

namespace IoTomatoes.Application.Services
{
    public class RuleService : IRuleService
    {
        private readonly IRuleRepository _ruleRepository;
        private readonly ISensorTypeRepository _sensorTypeRepository;
        private readonly IMapper _mapper;

        public RuleService(IRuleRepository ruleRepository, IMapper mapper, ISensorTypeRepository sensorTypeRepository)
        {
            _ruleRepository = ruleRepository;
            _mapper = mapper;
            _sensorTypeRepository = sensorTypeRepository;
        }

        public bool Create(RuleDTO ruleDTO)
        {
            Rule rule = new Rule();
            _mapper.Map(ruleDTO, rule);
            if (!Exists(rule))
            {
                rule.DateCreated = DateTime.Now;
                rule.DateModified = DateTime.Now;
                rule.Name = _sensorTypeRepository.FindBy(x => x.Code.ToUpper().Trim() == rule.Code.ToUpper().Trim()).Name;

                _ruleRepository.Add(rule);
                _ruleRepository.Commit();
                return true;
            }
            return false;
        }

        public Dictionary<string, string> GetDictionary(List<RuleDTO> rules)
        {          
            return rules.ToDictionary(rule => rule.Code.Trim(), rule => rule.Conditions);
           /* var _rules = new Dictionary<string, string>();
            foreach(RuleDTO rule in rules)
            {
                _rules.Add(rule.Code.Trim(), rule.Conditions);
            }

            return _rules;*/
        }

        public List<ListItemDTO> GetList()
        {
            return _ruleRepository.GetAll()
                .Select(rule => _mapper.Map<ListItemDTO>(rule))
                .ToList();
        }



        public bool Update(RuleDTO ruleDTO)
        {           
            if (Exists(new Rule{ Id = ruleDTO.Id, RuleSetId = ruleDTO.RuleSetId, Code = ruleDTO.Code }))
            {
                Rule rule;
                if (ruleDTO.Id > 0)
                {
                    rule = _ruleRepository.Get(ruleDTO.Id);
                }
                else
                {
                    rule = _ruleRepository.FindBy(x => x.RuleSetId == ruleDTO.RuleSetId && x.Code == ruleDTO.Code);
                }

                if (rule == null || String.IsNullOrEmpty(rule.Code))
                {
                    return false;
                }
                else
                {
                    ruleDTO.Id = rule.Id;
                }

                _mapper.Map(ruleDTO, rule);
                rule.Name = _sensorTypeRepository.FindBy(x => x.Code.ToUpper().Trim() == rule.Code.ToUpper().Trim()).Name;
                rule.DateModified = DateTime.Now;

                _ruleRepository.Update(rule);
                _ruleRepository.Commit();
                return true;
            }
            return false;
        }

        private bool Exists(Rule rule)
        {
            return _ruleRepository.Exists(rule);
        }
    }
}
