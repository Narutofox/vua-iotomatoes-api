using System;
using System.Collections.Generic;
using System.Linq;
using IoTomatoes.Domain.Infrastructure;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Domain.Models;
using IoTomatoes.Persistence.Commons;
using Microsoft.EntityFrameworkCore;

namespace IoTomatoes.Persistence.Repositories
{
    public class UserRepository : GenericRepository<User>, IUserRepository
    {
        private IoTomatoesContext Context => (IoTomatoesContext) _context;

        public UserRepository(IoTomatoesContext context) : base(context) {}

        public User Login(string username, string password)
        {
            return Context.Users
                .Include(u => u.Role)
                .FirstOrDefault(x => x.Username.Equals(username) && x.Password.Equals(password) && x.Active == 1);
        }

        public override List<User> GetAll()
        {
            return Context.Users
                .Include(u => u.Role)
                .Where(u => u.RoleId.Equals((int)RoleType.User))
                .ToList();
        }

        public override User Get(int id)
        {
            return Context.Users
                .Include(u => u.Role)
                .FirstOrDefault(x => x.Id.Equals(id));
        }
    }
}
