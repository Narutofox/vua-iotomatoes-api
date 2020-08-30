using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;
using IoTomatoes.Persistence.Commons;

namespace IoTomatoes.Persistence.Repositories
{
    public class FarmPlantRepository : GenericRepository<FarmPlant>, IFarmPlantRepository
    {
        private IoTomatoesContext Context => (IoTomatoesContext)_context;
        public FarmPlantRepository(IoTomatoesContext context) : base(context) { }
    }
}
