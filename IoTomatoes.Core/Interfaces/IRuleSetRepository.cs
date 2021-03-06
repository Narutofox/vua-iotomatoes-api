﻿using IoTomatoes.Domain.Models;

namespace IoTomatoes.Domain.Interfaces
{
    public interface IRuleSetRepository : IGenericRepository<RuleSet>
    {
        RuleSet GetByFarm(int farmId);
    }
}
