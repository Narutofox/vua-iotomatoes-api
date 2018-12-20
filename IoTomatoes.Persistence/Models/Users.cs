using System;
using System.Collections.Generic;

namespace IoTomatoes.Persistence.Models
{
    public partial class Users
    {
        public Users()
        {
            Farms = new HashSet<Farms>();
        }

        public int Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public int? RoleId { get; set; }
        public int? Active { get; set; }
        public DateTime? DateCreated { get; set; }
        public DateTime? DateModified { get; set; }

        public virtual Roles Role { get; set; }
        public virtual ICollection<Farms> Farms { get; set; }
    }
}
