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
    public class FarmPlantService : IFarmPlantService
    {
        private readonly IFarmPlantRepository _repository;
        private readonly IMapper _mapper;

        public FarmPlantService(IFarmPlantRepository repository, IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }

        public void Update(int farmId, IList<FarmPlantDTO> farmPlantDTOs)
        {
            IList<FarmPlant> farmPlants = _repository.SelectBy(x => x.FarmId == farmId).ToList();
            IEnumerable<FarmPlant> farmSensorsToDelete = farmPlants.Where(x => !farmPlantDTOs.Select(y => y.PlantId).Contains(x.PlantId)).AsEnumerable();
            foreach (FarmPlantDTO farmSensorDTO in farmPlantDTOs)
            {
                if (!farmPlants.Any(x => x.PlantId == farmSensorDTO.PlantId))
                {
                    FarmPlant farmPlant = new FarmPlant() { FarmId = farmId };
                    _mapper.Map(farmSensorDTO, farmPlant);
                    farmPlant.DateCreated = DateTime.Now;
                    farmPlant.DateModified = DateTime.Now;
                    _repository.Add(farmPlant);
                }
            }
            if (farmSensorsToDelete.Any())
            {
                _repository.RemoveRange(farmSensorsToDelete);
            }

            _repository.Commit();
        }
    }
}
