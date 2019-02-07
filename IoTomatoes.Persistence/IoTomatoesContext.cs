using System;
using IoTomatoes.Domain.Models;
using Microsoft.EntityFrameworkCore;

namespace IoTomatoes.Persistence
{
    public class IoTomatoesContext : DbContext
    {
        public IoTomatoesContext()
        {
        }

        public IoTomatoesContext(DbContextOptions<IoTomatoesContext> options)
            : base(options)
        {
        }

        public virtual DbSet<ActuatorType> ActuatorTypes { get; set; }
        public virtual DbSet<Actuator> Actuators { get; set; }
        public virtual DbSet<City> Cities { get; set; }
        public virtual DbSet<Country> Countries { get; set; }
        public virtual DbSet<FarmActuator> FarmActutators { get; set; }
        public virtual DbSet<FarmPlant> FarmPlants { get; set; }
        public virtual DbSet<FarmSensorMeasurement> FarmSensorMeasurements { get; set; }
        public virtual DbSet<FarmSensor> FarmSensors { get; set; }
        public virtual DbSet<Farm> Farms { get; set; }
        public virtual DbSet<MeasuringUnit> MeasuringUnits { get; set; }
        public virtual DbSet<Plant> Plants { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<RuleSet> RuleSets { get; set; }
        public virtual DbSet<Rule> Rules { get; set; }
        public virtual DbSet<SensorType> SensorTypes { get; set; }
        public virtual DbSet<Sensor> Sensors { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfigurationsFromAssembly(typeof(IoTomatoesContext).Assembly);
        }
    }
}
