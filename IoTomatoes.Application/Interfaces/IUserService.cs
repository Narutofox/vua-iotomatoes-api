using System;
using System.Collections.Generic;
using IoTomatoes.Application.Models;
using IoTomatoes.Application.Models.User;

namespace IoTomatoes.Application.Interfaces
{
    public interface IUserService
    {
        UserDTO Login(string username, string password);
        UserDTO Get(int id);
        List<UserDTO> GetAll();
        void Create(CreateUserDTO user);
        void Update(UpdateUserDTO user);
        void Remove(int id);
        List<FarmDTO> GetFarms(int id);
    }
}
