using System;
using AutoMapper;
using IoTomatoes.Application.Models;
using IoTomatoes.Domain.Models;

namespace IoTomatoes.Application.Mappings
{
    public class AutoMapperProfile : Profile
    {
        public AutoMapperProfile()
        {
            CreateMap<Rule, RuleDTO>();
            CreateMap<RuleSet, RuleSetDTO>();
            CreateMap<Farm, FarmDTO>();
        }
    }
}
