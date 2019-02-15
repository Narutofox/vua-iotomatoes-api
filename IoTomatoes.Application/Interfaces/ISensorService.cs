using IoTomatoes.Application.Models;
using System;
using System.Collections.Generic;
using System.Text;

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
    }
}
