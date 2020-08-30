using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;
using IoTomatoes.Persistence.Commons;

namespace IoTomatoes.Persistence.Repositories
{
    public class FarmActuatorsRepository : GenericRepository<FarmActuator>, IFarmActuatorRepository
    {
        private IoTomatoesContext Context => (IoTomatoesContext)_context;
        public FarmActuatorsRepository(IoTomatoesContext context) : base(context) { }
    }
}
