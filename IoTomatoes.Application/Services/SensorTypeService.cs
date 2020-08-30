using AutoMapper;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;
using System.Collections.Generic;
using System.Linq;

namespace IoTomatoes.Application.Services
{
   public class SensorTypeService : ISensorTypeService
    {
        private readonly ISensorTypeRepository _sensorTypeRepository;
        private readonly IMapper _mapper;

        public SensorTypeService(ISensorTypeRepository repository, IMapper mapper)
        {
            _sensorTypeRepository = repository;
            _mapper = mapper;
        }

        public SensorType Get(string name)
        {
            return _sensorTypeRepository.FindBy(x=>x.Name.Trim() == name.Trim());
        }
        public SensorTypeDTO Get(int id)
        {
            var sensorType = _sensorTypeRepository.Get(id);

            if (sensorType != null)
            {
                return _mapper.Map<SensorTypeDTO>(sensorType);
            }

            return null;
        }
        public List<SensorTypeDTO> GetAll()
        {
            return _sensorTypeRepository.GetAll()
                 .Select(sensorType => _mapper.Map<SensorTypeDTO>(sensorType))
                 .ToList();
        }

        public SensorType GetByCode(string code)
        {
            return _sensorTypeRepository.FindBy(x => x.Code.Trim() == code.Trim());
        }

        public List<ListItemDTO> GetList()
        {
            return _sensorTypeRepository.GetAll()
              .Select(rule => _mapper.Map<ListItemDTO>(rule))
              .ToList();
        }
    }
}
