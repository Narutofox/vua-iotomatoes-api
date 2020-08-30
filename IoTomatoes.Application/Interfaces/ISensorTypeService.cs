using IoTomatoes.Application.Models;
using IoTomatoes.Domain.Models;
using System.Collections.Generic;
using System.Linq;

namespace IoTomatoes.Application.Interfaces
{
    public interface ISensorTypeService
    {
        SensorType Get (string name);
        SensorTypeDTO Get(int id);

        List<SensorTypeDTO> GetAll();
        SensorType GetByCode(string code);
        List<ListItemDTO> GetList();
    }
}
