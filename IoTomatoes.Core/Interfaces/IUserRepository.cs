using System;
using IoTomatoes.Domain.Models;

namespace IoTomatoes.Domain.Interfaces
{
    public interface IUserRepository : IGenericRepository<User>
    {
        User Login(string username, string password);
    }
}
