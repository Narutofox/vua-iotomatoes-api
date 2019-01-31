using System;
using System.Collections.Generic;
using IoTomatoes.Application.Models;

namespace IoTomatoes.Application.Interfaces
{
    public interface IUserService
    {
        UserDTO Login(string username, string password);
        UserDTO Get(int id);
        List<UserDTO> GetAll();
        void Create(UserDTO user);
        void Update(UserDTO user);
    }
}
