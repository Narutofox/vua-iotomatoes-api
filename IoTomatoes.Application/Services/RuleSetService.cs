using System;
using System.Collections.Generic;
using System.Linq;
using AutoMapper;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using IoTomatoes.Application.Models.RuleSet;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;

namespace IoTomatoes.Application.Services
{
    public class RuleSetService : IRuleSetService
    {
        private readonly IRuleSetRepository _ruleSetRepository;
        private readonly IMapper _mapper;

        public RuleSetService(IRuleSetRepository ruleSetRepository, IMapper mapper)
        {
            _ruleSetRepository = ruleSetRepository;
            _mapper = mapper;
        }

        public void Create(CreateRuleSetDTO ruleSet)
        {
            var createdRuleSet = _mapper.Map<RuleSet>(ruleSet);
            createdRuleSet.DateCreated = DateTime.Now;
            createdRuleSet.DateModified = DateTime.Now;

            _ruleSetRepository.Add(createdRuleSet);
            _ruleSetRepository.Commit();
        }

        public RuleSetDTO Get(int id)
        {
            var ruleSet = _ruleSetRepository.Get(id);
            return _mapper.Map<RuleSetDTO>(ruleSet);
        }

        public List<RuleSetDTO> GetAll()
        {
            return _ruleSetRepository.GetAll()
                .Select(rs => _mapper.Map<RuleSetDTO>(rs))
                .ToList();
        }

        public RuleSetDTO GetByFarm(int farmId)
        {
            var ruleSet = _ruleSetRepository.GetByFarm(farmId);
            return _mapper.Map<RuleSetDTO>(ruleSet);
        }

        public List<ListItemDTO> GetList()
        {
            return _ruleSetRepository.GetAll()
                .Select(rs => _mapper.Map<ListItemDTO>(rs))
                .ToList();
        }

        public void Remove(int id)
        {
            var ruleSet = _ruleSetRepository.Get(id);
            _ruleSetRepository.Remove(ruleSet);
        }

        public void Update(UpdateRuleSetDTO ruleSet)
        {
            var updateRuleSet = _ruleSetRepository.Get(ruleSet.Id);
            _mapper.Map(ruleSet, updateRuleSet);
            updateRuleSet.DateModified = DateTime.Now;

            _ruleSetRepository.Update(updateRuleSet);
            _ruleSetRepository.Commit();
        }
    }
}
