using System;
using System.Collections.Generic;

namespace IoTomatoes.Domain.Models
{
    public class User
    {
        public User()
        {
            Farms = new HashSet<Farm>();
        }

        public int Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public int RoleId { get; set; }
        public int? Active { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }

        public virtual Role Role { get; set; }
        public virtual ICollection<Farm> Farms { get; set; }
    }
}
