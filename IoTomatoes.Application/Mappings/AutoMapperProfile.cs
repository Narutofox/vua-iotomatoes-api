using System;
using System.Linq;
using AutoMapper;
using IoTomatoes.Application.Infrastructure;
using IoTomatoes.Application.Models;
using IoTomatoes.Application.Models.Farm;
using IoTomatoes.Application.Models.RuleSet;
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

            CreateMap<CreateRuleSetDTO, RuleSet>()
                .ForMember(x => x.Rules, opt => opt.MapFrom(x => x.Rules));

            CreateMap<UpdateRuleSetDTO, RuleSet>()
                .ForMember(src => src.Id, opt => opt.Ignore())
                .ForMember(src => src.DateCreated, opt => opt.Ignore())
                .ForMember(x => x.Rules, opt => opt.MapFrom(x => x.Rules));

            CreateMap<Farm, FarmDTO>()
                .ForMember(x => x.UserFullName, opt => opt.MapFrom(x => $"{x.User.FirstName} {x.User.LastName}"))
                .ForMember(x => x.SensorIds, opt => opt.MapFrom(x => x.FarmSensors.Select(y => y.SensorId)))
                .ForMember(x => x.PlantIds, opt => opt.MapFrom(x => x.FarmPlants.Select(y => y.PlantId)))
                .ForMember(x => x.ActuatorIds, opt => opt.MapFrom(x => x.FarmActuators.Select(y => y.ActuatorId)))
                .ReverseMap();

            CreateMap<CreateFarmDTO, Farm>()
                .ForMember(src => src.RuleSetId, opt => opt.MapFrom(x => x.RuleSetId))
                .ForMember(src => src.UserId, opt => opt.MapFrom(x => x.UserId))
                .ForMember(src => src.CityId, opt => opt.MapFrom(x => x.CityId));

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

            CreateMap<Actuator, ListItemDTO>()
                .ForMember(x => x.Text, opt => opt.MapFrom(x => $"{x.Code} ({x.ActuatorType.Name})"))
                .ForMember(x => x.Value, opt => opt.MapFrom(x => x.Id));

            CreateMap<Sensor, ListItemDTO>()
                .ForMember(x => x.Text, opt => opt.MapFrom(x => $"{x.Code} ({x.SensorType.Name})"))
                .ForMember(x => x.Value, opt => opt.MapFrom(x => x.Id));

            CreateMap<Farm, ListItemDTO>()
                .ForMember(x => x.Text, opt => opt.MapFrom(x => x.Name))
                .ForMember(x => x.Value, opt => opt.MapFrom(x => x.Id));

            CreateMap<Plant, ListItemDTO>()
                .ForMember(x => x.Text, opt => opt.MapFrom(x => x.Name))
                .ForMember(x => x.Value, opt => opt.MapFrom(x => x.Id));

            CreateMap<User, ListItemDTO>()
                .ForMember(x => x.Text, opt => opt.MapFrom(x => $"{x.FirstName} {x.LastName}"))
                .ForMember(x => x.Value, opt => opt.MapFrom(x => x.Id));

            CreateMap<City, ListItemDTO>()
                .ForMember(x => x.Text, opt => opt.MapFrom(x => x.Name))
                .ForMember(x => x.Value, opt => opt.MapFrom(x => x.Id));

            CreateMap<RuleSet, ListItemDTO>()
                .ForMember(x => x.Text, opt => opt.MapFrom(x => x.Name))
                .ForMember(x => x.Value, opt => opt.MapFrom(x => x.Id));

            CreateMap<Rule, ListItemDTO>()
                .ForMember(x => x.Text, opt => opt.MapFrom(x => $"{x.Name} ({x.Code})"))
                .ForMember(x => x.Value, opt => opt.MapFrom(x => x.Id));
        }
    }
}
