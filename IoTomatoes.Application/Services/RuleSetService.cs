using System;
using System.Collections.Generic;
using System.Linq;
using AutoMapper;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using IoTomatoes.Domain.Interfaces;

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
    }
}
