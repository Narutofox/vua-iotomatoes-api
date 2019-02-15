using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Models;
using Microsoft.AspNetCore.Mvc;

namespace IoTomatoes.Api.Controllers
{
    [Route("api/[controller]")]
    public class CitiesController : Controller
    {
        private readonly ICityService _cityService;

        public CitiesController(ICityService cityService)
        {
            _cityService = cityService;
        }

        // GET: api/<controller>
        [HttpGet]
        public List<CityDTO> Get()
        {
            return _cityService.GetAll();
        }

        [HttpGet("list")]
        public List<ListItemDTO> GetList()
        {
            return _cityService.GetList();
        }
    }
}