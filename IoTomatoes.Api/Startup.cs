using System;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using IoTomatoes.Persistence;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using IoTomatoes.Application.Interfaces;
using IoTomatoes.Application.Services;
using AutoMapper;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Persistence.Repositories;
using Swashbuckle.AspNetCore.Swagger;

namespace IoTomatoes.Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            var connectionString = Configuration.GetConnectionString("IoTomatoesDatabase");
            services.AddDbContext<IoTomatoesContext>(options => options.UseSqlServer(connectionString));

            services.AddTransient<IRuleRepository, RuleRepository>();
            services.AddTransient<IRuleService, RuleService>();

            services.AddTransient<IRuleSetRepository, RuleSetRepository>();
            services.AddTransient<IRuleSetService, RuleSetService>();

            services.AddTransient<IFarmRepository, FarmRepository>();
            services.AddTransient<IFarmService, FarmService>();

            services.AddTransient<IUserRepository, UserRepository>();
            services.AddTransient<IUserService, UserService>();

            services.AddTransient<ICountryRepository, CountryRepository>();
            services.AddTransient<ICountryService, CountryService>();

            services.AddTransient<ICityRepository, CityRepository>();
            services.AddTransient<ICityService, CityService>();

            services.AddTransient<ISensorRepository, SensorRepository>();
            services.AddTransient<ISensorService, SensorService>();

            services.AddTransient<IFarmSensorMeasurementRepository, FarmSensorMeasurementRepository>();
            services.AddTransient<ISensorMeasurmentService, SensorMeasurementService>();

            services.AddTransient<IPlantRepository, PlantRepository>();
            services.AddTransient<IPlantService, PlantService>();

            services.AddTransient<IActuatorRepository, ActuatorRepository>();
            services.AddTransient<IActuatorService, ActuatorService>();

            services
                .AddMvc()
                .AddJsonOptions(options =>
                {
                    var serializer = options.SerializerSettings;
                    serializer.Formatting = Formatting.Indented;
                    serializer.ContractResolver = new CamelCasePropertyNamesContractResolver();
                })
                .SetCompatibilityVersion(CompatibilityVersion.Version_2_1);

            services.AddCors(options =>
            {
                options.AddPolicy("VueCors", policy =>
                {
                    policy.AllowAnyHeader();
                    policy.AllowAnyMethod();
                    policy.AllowAnyOrigin();
                });
            });

            services.AddAutoMapper();

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new Info { Title = "IoTomatoes API", Version = "v1" });
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment() || env.IsEnvironment("Docker"))
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseHsts();
            }

            app.UseCors("VueCors");
            //app.UseHttpsRedirection();

            // Enable middleware to serve generated Swagger as a JSON endpoint.
            app.UseSwagger();

            // Enable middleware to serve swagger-ui (HTML, JS, CSS, etc.), 
            // specifying the Swagger JSON endpoint.
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "IoTomatoes API V1");
            });

            app.UseMvc();
        }
    }
}
