using System;
using IoTomatoes.Domain.Models;
using IoTomatoes.Persistence.Commons;

namespace IoTomatoes.Persistence.Repositories
{
    public class RuleSetRepository : GenericRepository<RuleSet>
    {
        public RuleSetRepository(IoTomatoesContext context) : base(context)
        {
        }
    }
}
