using IoTomatoes.Application.Models;
using System.Collections.Generic;

namespace IoTomatoes.Application.Interfaces
{
    public interface ISensorService
    {
        SensorDTO Get(int id);
        List<SensorDTO> GetAll();
        void Remove(int id);
        void Update(SensorDTO sensor);
        void Create(SensorDTO sensor);
        List<ListItemDTO> GetList();

        IList<SensorDTO> GetBy(IEnumerable<int> sensorIds);
    }
}
