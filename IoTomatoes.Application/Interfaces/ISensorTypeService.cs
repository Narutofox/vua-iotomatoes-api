using IoTomatoes.Domain.Models;
using System.Collections.Generic;
using System.Linq;

namespace IoTomatoes.Application.Interfaces
{
    public interface ISensorTypeService
    {
        SensorType Get (string name);
        List<SensorType> GetAll();
        SensorType GetByCode(string code);
    }
}
