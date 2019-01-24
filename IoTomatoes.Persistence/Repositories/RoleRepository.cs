using System;
using IoTomatoes.Domain.Models;
using IoTomatoes.Persistence.Commons;

namespace IoTomatoes.Persistence.Repositories
{
    public class RoleRepository : GenericRepository<Role>
    {
        public RoleRepository(IoTomatoesContext context) : base(context)
        {
        }
    }
}
