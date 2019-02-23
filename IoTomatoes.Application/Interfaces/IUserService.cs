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
        List<ListItemDTO> GetList();
        void Create(CreateUserDTO user);
        UserDTO Update(UpdateUserDTO user);
        void UpdateStatus(int id);
        void Remove(int id);
    }
}
