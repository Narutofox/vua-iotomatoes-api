using IoTomatoes.Application.Interfaces;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;
using System.Collections.Generic;
using System.Linq;

namespace IoTomatoes.Application.Services
{
   public class SensorTypeService : ISensorTypeService
    {
        private readonly ISensorTypeRepository _sensorTypeRepository;

        public SensorTypeService(ISensorTypeRepository repository)
        {
            _sensorTypeRepository = repository;
        }

        public SensorType Get(string name)
        {
            return _sensorTypeRepository.FindBy(x=>x.Name.Trim() == name.Trim());
        }

        public List<SensorType> GetAll()
        {
            return _sensorTypeRepository.GetAll();
        }

        public SensorType GetByCode(string code)
        {
            return _sensorTypeRepository.FindBy(x => x.Code.Trim() == code.Trim());
        }
    }
}
