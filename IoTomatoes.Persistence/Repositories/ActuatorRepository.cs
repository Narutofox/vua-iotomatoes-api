using System;
using System.Collections.Generic;
using System.Linq;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;
using IoTomatoes.Persistence.Commons;
using Microsoft.EntityFrameworkCore;

namespace IoTomatoes.Persistence.Repositories
{
    public class ActuatorRepository : GenericRepository<Actuator>, IActuatorRepository
    {
        private IoTomatoesContext Context => (IoTomatoesContext)_context;
        public ActuatorRepository(IoTomatoesContext context) : base(context) {}

        public override List<Actuator> GetAll()
        {
            return Context.Actuators
                .Include(x => x.ActuatorType)
                .ToList();
        }
    }
}
