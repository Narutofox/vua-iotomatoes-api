using IoTomatoes.Application.Models;
using System.Collections.Generic;

namespace IoTomatoes.Application.Interfaces
{
    public interface IMeasuringUnitService
    {
        MeasuringUnitDTO Get(int id);
        List<MeasuringUnitDTO> GetAll();
        List<ListItemDTO> GetList();

        void Create(MeasuringUnitDTO measuringUnit);
        void Update(MeasuringUnitDTO measuringUnit);
        void Delete(int id);
    }
}
