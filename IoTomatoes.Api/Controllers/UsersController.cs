using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using IoTomatoes.Application.Models.User;
using Microsoft.AspNetCore.Mvc;

namespace IoTomatoes.Api.Controllers
{
    [Route("api/[controller]")]
    public class UsersController : Controller
    {
        private readonly IUserService _userService;
        private readonly IFarmService _farmService;

        public UsersController(IUserService userService, IFarmService farmService)
        {
            _userService = userService;
            _farmService = farmService;
        }

        // GET: api/users
        [HttpGet]
        public IEnumerable<UserDTO> Get()
        {
            return _userService.GetAll();
        }

        [HttpGet("list")]
        public List<ListItemDTO> GetList()
        {
            return _userService.GetList();
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
            return _farmService.GetByUserId(id);
        }

        [HttpGet("{id}/farms/list")]
        public List<ListItemDTO> GetUserFarmsList(int id)
        {
            return _farmService.GetListByUserId(id);
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
        public ActionResult<UserDTO> Put([FromBody] UpdateUserDTO user)
        {
            var updatedUser = _userService.Update(user);

            if(updatedUser != null)
            {
                return Ok(updatedUser);
            }

            return NoContent();
        }

        [HttpPut("{id}/status")]
        public IActionResult Put(int id)
        {
            _userService.UpdateStatus(id);
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
