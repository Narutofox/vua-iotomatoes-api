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

            services.AddTransient<IRuleSetRepository, RuleSetRepository>();
            services.AddTransient<IFarmRepository, FarmRepository>();
            services.AddTransient<IFarmService, FarmService>();

            services
                .AddMvc()
                .AddJsonOptions(options =>
                {
                    var serializer = options.SerializerSettings;
                    serializer.Formatting = Formatting.Indented;
                    serializer.ContractResolver = new CamelCasePropertyNamesContractResolver();
                })
                .SetCompatibilityVersion(CompatibilityVersion.Version_2_1);

            services.AddAutoMapper();
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

            //app.UseHttpsRedirection();
            app.UseMvc();
        }
    }
}
