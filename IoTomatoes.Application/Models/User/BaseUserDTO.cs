using System;
using System.Collections.Generic;
using System.Text;

namespace IoTomatoes.Application.Models.User
{
    public abstract class BaseUserDTO
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int RoleId { get; set; }
        public bool Active { get; set; }
    }
}
