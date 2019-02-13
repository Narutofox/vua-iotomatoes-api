using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using IoTomatoes.Application.Models.User;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace IoTomatoes.Api.Controllers
{
    [Route("api/[controller]")]
    public class UsersController : Controller
    {
        private readonly IUserService _userService;

        public UsersController(IUserService userService)
        {
            _userService = userService;
        }

        // GET: api/users
        [HttpGet]
        public IEnumerable<UserDTO> Get()
        {
            return _userService.GetAll();
        }

        // GET api/users/5
        [HttpGet("{id}")]
        public UserDTO Get(int id)
        {
            return _userService.Get(id);
        }

        [HttpGet("{id}/farms")]
        public List<FarmDTO> GetUserFarms(int id)
        {
            return _userService.GetFarms(id);
        }

        [HttpPost("login")]
        public ActionResult<UserDTO> Login([FromBody] LoginUserDTO user)
        {
            var loggedIn = _userService.Login(user.Username, user.Password);

            if(loggedIn != null)
            {
                return Ok(loggedIn);
            }

            return NotFound();
        }

        // POST api/users
        [HttpPost]
        public IActionResult Post([FromBody] CreateUserDTO user)
        {
            _userService.Create(user);
            return Ok();
        }

        // PUT api/users
        [HttpPut]
        public IActionResult Put([FromBody] UpdateUserDTO user)
        {
            _userService.Update(user);
            return Ok();
        }

        // DELETE api/users/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            _userService.Remove(id);
            return Ok();
        }
    }
}
