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
            CreateMap<Rule, RuleDTO>().ReverseMap();
            CreateMap<RuleSet, RuleSetDTO>().ReverseMap();
            CreateMap<Farm, FarmDTO>().ReverseMap();
            CreateMap<User, UserDTO>().ReverseMap();

            CreateMap<Country, CountryDTO>().ReverseMap();
            CreateMap<City, CityDTO>()
                .ReverseMap()
                .ForMember(src => src.CountryId, opt => opt.MapFrom(x => x.CountryId));

            CreateMap<Sensor, SensorDTO>().ReverseMap();
            CreateMap<FarmSensorMeasurement, SensorMeasurmentDTO>().ReverseMap();
        }
    }
}
