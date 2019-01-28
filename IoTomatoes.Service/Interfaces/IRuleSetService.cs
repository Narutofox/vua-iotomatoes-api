using System;
using IoTomatoes.Application.Models;

namespace IoTomatoes.Application.Interfaces
{
    public interface IRuleSetService
    {
        RuleSetDTO GetByFarm(int farmId);
    }
}
