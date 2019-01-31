using System;
using System.Collections.Generic;
using System.Linq;
using AutoMapper;
using IoTomatoes.Application.Infrastructure;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
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

        public void Create(UserDTO user)
        {
            var createdUser = _mapper.Map<User>(user);
            createdUser.Id = 0;
            createdUser.Password = HashHelper.CreateMD5(user.Password);

            _userRepository.Add(createdUser);
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

        public UserDTO Login(string username, string password)
        {
            var user = _userRepository.Login(username, HashHelper.CreateMD5(password));

            if(user != null)
            {
                return _mapper.Map<UserDTO>(user);
            }

            return null;
        }

        public void Update(UserDTO user)
        {
            var updatedUser = _mapper.Map<User>(user);
            updatedUser.Password = HashHelper.CreateMD5(user.Password);

            _userRepository.Update(updatedUser);
            _userRepository.Commit();
        }
    }
}
