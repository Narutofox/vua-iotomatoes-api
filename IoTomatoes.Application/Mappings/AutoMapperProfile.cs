using System;
using AutoMapper;
using IoTomatoes.Application.Infrastructure;
using IoTomatoes.Application.Models;
using IoTomatoes.Application.Models.Farm;
using IoTomatoes.Application.Models.User;
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
            CreateMap<CreateFarmDTO, Farm>();
            CreateMap<UpdateFarmDTO, Farm>()
                .ForMember(src => src.Id, opt => opt.Ignore())
                .ForMember(src => src.DateCreated, opt => opt.Ignore());

            CreateMap<User, UserDTO>().ReverseMap();
            CreateMap<CreateUserDTO, User>()
                .ForMember(src => src.Password, opt => opt.MapFrom(x => HashHelper.CreateMD5(x.Password)));

            CreateMap<Country, CountryDTO>().ReverseMap();
            CreateMap<City, CityDTO>()
                .ReverseMap()
                .ForMember(src => src.CountryId, opt => opt.MapFrom(x => x.CountryId));

            CreateMap<Sensor, SensorDTO>().ReverseMap();
            CreateMap<Plant, PlantDTO>().ReverseMap();
            CreateMap<Actuator, ActuatorDTO>().ReverseMap();
            CreateMap<FarmSensorMeasurement, SensorMeasurmentDTO>().ReverseMap();
        }
    }
}
