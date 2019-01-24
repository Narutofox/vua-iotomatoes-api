using System;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;
using IoTomatoes.Persistence.Commons;

namespace IoTomatoes.Persistence.Repositories
{
    public class ActuatorTypeRepository : GenericRepository<ActuatorType>, IActuatorTypeRepository
    {
        public ActuatorTypeRepository(IoTomatoesContext context) : base(context){}
    }
}
