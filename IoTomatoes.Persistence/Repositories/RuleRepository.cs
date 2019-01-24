using System;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;
using IoTomatoes.Persistence.Commons;

namespace IoTomatoes.Persistence.Repositories
{
    public class RuleRepository : GenericRepository<Rule>, IRuleRepository
    {
        public RuleRepository(IoTomatoesContext context) : base(context) {}
    }
}
