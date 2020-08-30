using AutoMapper;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace IoTomatoes.Application.Services
{
    public class MeasuringUnitService : IMeasuringUnitService
    {
        private readonly IMeasuringUnitRepository _measuringUnitRepository;
        private readonly IMapper _mapper;
        public MeasuringUnitService(IMeasuringUnitRepository measuringUnitRepository, IMapper mapper)
        {
            _measuringUnitRepository = measuringUnitRepository;
            _mapper = mapper;
        }

        public void Create(MeasuringUnitDTO measuringUnit)
        {
            var createMeasuringUnit = _mapper.Map<MeasuringUnit>(measuringUnit);
            createMeasuringUnit.DateCreated = DateTime.Now;
            createMeasuringUnit.DateModified = DateTime.Now;

            _measuringUnitRepository.Add(createMeasuringUnit);
            _measuringUnitRepository.Commit();
        }

        public void Delete(int id)
        {
            var measuringUnit = _measuringUnitRepository.Get(id);

            if (measuringUnit != null)
            {
                _measuringUnitRepository.Remove(measuringUnit);
                _measuringUnitRepository.Commit();
            }
        }

        public MeasuringUnitDTO Get(int id)
        {
            var measuringUnit = _measuringUnitRepository.Get(id);

            if (measuringUnit != null)
            {
                return _mapper.Map<MeasuringUnitDTO>(measuringUnit);
            }

            return null;
        }

        public List<MeasuringUnitDTO> GetAll()
        {
            return _measuringUnitRepository.GetAll()
                 .Select(measuringUnit => _mapper.Map<MeasuringUnitDTO>(measuringUnit))
                 .ToList();
        }

        public List<ListItemDTO> GetList()
        {
            return _measuringUnitRepository.GetAll()
                 .Select(measuringUnit => _mapper.Map<ListItemDTO>(measuringUnit))
                 .ToList();
        }

        public void Update(MeasuringUnitDTO measuringUnit)
        {
            var updateMeasuringUnit = _measuringUnitRepository.Get(measuringUnit.Id);
            _mapper.Map(measuringUnit, updateMeasuringUnit);
            updateMeasuringUnit.DateModified = DateTime.Now;
            _measuringUnitRepository.Update(updateMeasuringUnit);
            _measuringUnitRepository.Commit();
        }
    }
}
