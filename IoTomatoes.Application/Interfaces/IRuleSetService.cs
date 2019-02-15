using System;
using System.Collections.Generic;
using IoTomatoes.Application.Models;

namespace IoTomatoes.Application.Interfaces
{
    public interface IRuleSetService
    {
        RuleSetDTO GetByFarm(int farmId);
        List<ListItemDTO> GetList();
        List<RuleSetDTO> GetAll();
    }
}
