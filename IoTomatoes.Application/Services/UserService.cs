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

        public UserDTO Update(UpdateUserDTO user)
        {
            var dbUser = _userRepository.Get(user.Id);

            if (!dbUser.Password.Equals(user.Password))
            {
                dbUser.Password = HashHelper.CreateMD5(user.Password);
            }

            dbUser.Email = user.Email;
            dbUser.DateModified = DateTime.Now;

            _userRepository.Update(dbUser);
            _userRepository.Commit();

            return _mapper.Map<UserDTO>(dbUser);
        }

        public UserDTO Get(int id)
        {
            var user = _userRepository.Get(id);

            if (user != null)
            {
                return _mapper.Map<UserDTO>(user);
            }

            return null;
        }

        public List<UserDTO> GetAll()
        {
            return _userRepository.GetAll()
                 .Select(user => _mapper.Map<UserDTO>(user))
                 .ToList();
        }

        public List<ListItemDTO> GetList()
        {
            return _userRepository.GetAll()
                .Where(x => x.Active == 1)
                .Select(user => _mapper.Map<ListItemDTO>(user))
                .ToList();
        }

        public UserDTO Login(string username, string password)
        {
            var user = _userRepository.Login(username, HashHelper.CreateMD5(password));

            if (user != null)
            {
                return _mapper.Map<UserDTO>(user);
            }

            return null;
        }

        public void Remove(int id)
        {
            var user = _userRepository.Get(id);
            _userRepository.Remove(user);
            _userRepository.Commit();
        }

        public void UpdateStatus(int id)
        {
            var user = _userRepository.Get(id);

            if (user != null)
            {
                user.Active = user.Active == 1 ? 0 : 1;
                user.DateModified = DateTime.Now;

                _userRepository.Update(user);
                _userRepository.Commit();
            }
        }
    }
}
