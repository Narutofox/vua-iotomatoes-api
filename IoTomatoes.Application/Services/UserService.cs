using System;
using System.Collections.Generic;
using System.Linq;
using AutoMapper;
using IoTomatoes.Application.Infrastructure;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using IoTomatoes.Application.Models.User;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;

namespace IoTomatoes.Application.Services
{
    public class UserService : IUserService
    {
        private readonly IUserRepository _userRepository;
        private readonly IMapper _mapper;

        public UserService(IUserRepository userRepository, IMapper mapper)
        {
            _userRepository = userRepository;
            _mapper = mapper;
        }

        public void Create(CreateUserDTO user)
        {
            var createdUser = _mapper.Map<User>(user);
            createdUser.Active = 1;
            createdUser.DateCreated = DateTime.Now;
            createdUser.DateModified = DateTime.Now;

            _userRepository.Add(createdUser);
            _userRepository.Commit();
        }

        public void Update(UpdateUserDTO user)
        {
            var dbUser = _userRepository.Get(user.Id);
            _mapper.Map(user, dbUser);
            dbUser.DateModified = DateTime.Now;

            _userRepository.Update(dbUser);
            _userRepository.Commit();
        }

        public UserDTO Get(int id)
        {
            var user = _userRepository.Get(id);

            if(user != null)
            {
                return _mapper.Map<UserDTO>(user);
            }

            return null;
        }

        public List<UserDTO> GetAll()
        {
            var users = _userRepository.GetAll();
            return users.Select(user => _mapper.Map<UserDTO>(user)).ToList();
        }

        public List<FarmDTO> GetFarms(int id)
        {
            var user = _userRepository.Get(id);
            var userFarms = new List<FarmDTO>();
            
            if(user != null)
            {
                userFarms = user.Farms
                    .Select(farm => _mapper.Map<FarmDTO>(farm))
                    .ToList();
            }

            return userFarms;
        }

        public UserDTO Login(string username, string password)
        {
            var user = _userRepository.Login(username, HashHelper.CreateMD5(password));

            if(user != null)
            {
                return _mapper.Map<UserDTO>(user);
            }

            return null;
        }
    }
}
