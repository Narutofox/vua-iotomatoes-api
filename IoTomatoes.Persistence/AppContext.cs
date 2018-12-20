using System;
using IoTomatoes.Persistence.Models;
using Microsoft.EntityFrameworkCore;

namespace IoTomatoes.Persistence
{
    public partial class AppContext : DbContext
    {
        public AppContext()
        {
        }

        public AppContext(DbContextOptions<AppContext> options)
            : base(options)
        {
        }

        public virtual DbSet<ActuatorTypes> ActuatorTypes { get; set; }
        public virtual DbSet<Actuators> Actuators { get; set; }
        public virtual DbSet<Cities> Cities { get; set; }
        public virtual DbSet<Countries> Countries { get; set; }
        public virtual DbSet<FarmActutators> FarmActutators { get; set; }
        public virtual DbSet<FarmPlants> FarmPlants { get; set; }
        public virtual DbSet<FarmRuleSets> FarmRuleSets { get; set; }
        public virtual DbSet<FarmSensorMeasurements> FarmSensorMeasurements { get; set; }
        public virtual DbSet<FarmSensors> FarmSensors { get; set; }
        public virtual DbSet<Farms> Farms { get; set; }
        public virtual DbSet<MeasuringUnits> MeasuringUnits { get; set; }
        public virtual DbSet<PlantTypes> PlantTypes { get; set; }
        public virtual DbSet<Plants> Plants { get; set; }
        public virtual DbSet<Roles> Roles { get; set; }
        public virtual DbSet<RuleSets> RuleSets { get; set; }
        public virtual DbSet<Rules> Rules { get; set; }
        public virtual DbSet<SensorTypes> SensorTypes { get; set; }
        public virtual DbSet<Sensors> Sensors { get; set; }
        public virtual DbSet<Users> Users { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=localhost;Database=iotomatoes_db;User Id=sa;Password=SqlAdmin123$");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.0-rtm-35687");

            modelBuilder.Entity<ActuatorTypes>(entity =>
            {
                entity.Property(e => e.Code)
                    .HasMaxLength(3)
                    .IsUnicode(false);

                entity.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Name).HasMaxLength(255);

                entity.Property(e => e.Version).HasDefaultValueSql("((1))");
            });

            modelBuilder.Entity<Actuators>(entity =>
            {
                entity.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Description).HasMaxLength(1000);

                entity.Property(e => e.Name).HasMaxLength(255);

                entity.HasOne(d => d.ActutatorType)
                    .WithMany(p => p.Actuators)
                    .HasForeignKey(d => d.ActutatorTypeId)
                    .HasConstraintName("FK__Actuators__Actut__123EB7A3");
            });

            modelBuilder.Entity<Cities>(entity =>
            {
                entity.Property(e => e.Code)
                    .HasMaxLength(3)
                    .IsUnicode(false);

                entity.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Name).HasMaxLength(255);

                entity.Property(e => e.PostalCode)
                    .HasMaxLength(5)
                    .IsUnicode(false);

                entity.Property(e => e.Version).HasDefaultValueSql("((1))");

                entity.HasOne(d => d.Country)
                    .WithMany(p => p.Cities)
                    .HasForeignKey(d => d.CountryId)
                    .HasConstraintName("FK__Cities__CountryI__534D60F1");
            });

            modelBuilder.Entity<Countries>(entity =>
            {
                entity.Property(e => e.Code)
                    .HasMaxLength(3)
                    .IsUnicode(false);

                entity.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Name).HasMaxLength(255);

                entity.Property(e => e.Version).HasDefaultValueSql("((1))");
            });

            modelBuilder.Entity<FarmActutators>(entity =>
            {
                entity.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

                entity.HasOne(d => d.Actuator)
                    .WithMany(p => p.FarmActutators)
                    .HasForeignKey(d => d.ActuatorId)
                    .HasConstraintName("FK__FarmActut__Actua__17F790F9");

                entity.HasOne(d => d.Farm)
                    .WithMany(p => p.FarmActutators)
                    .HasForeignKey(d => d.FarmId)
                    .HasConstraintName("FK__FarmActut__FarmI__17036CC0");
            });

            modelBuilder.Entity<FarmPlants>(entity =>
            {
                entity.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

                entity.HasOne(d => d.Farm)
                    .WithMany(p => p.FarmPlants)
                    .HasForeignKey(d => d.FarmId)
                    .HasConstraintName("FK__FarmPlant__FarmI__5DCAEF64");

                entity.HasOne(d => d.Plant)
                    .WithMany(p => p.FarmPlants)
                    .HasForeignKey(d => d.PlantId)
                    .HasConstraintName("FK__FarmPlant__Plant__5EBF139D");
            });

            modelBuilder.Entity<FarmRuleSets>(entity =>
            {
                entity.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

                entity.HasOne(d => d.Farm)
                    .WithMany(p => p.FarmRuleSets)
                    .HasForeignKey(d => d.FarmId)
                    .HasConstraintName("FK__FarmRuleS__FarmI__07C12930");

                entity.HasOne(d => d.RuleSet)
                    .WithMany(p => p.FarmRuleSets)
                    .HasForeignKey(d => d.RuleSetId)
                    .HasConstraintName("FK__FarmRuleS__RuleS__08B54D69");
            });

            modelBuilder.Entity<FarmSensorMeasurements>(entity =>
            {
                entity.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Value).HasColumnType("decimal(18, 0)");

                entity.HasOne(d => d.FarmSensor)
                    .WithMany(p => p.FarmSensorMeasurements)
                    .HasForeignKey(d => d.FarmSensorId)
                    .HasConstraintName("FK__FarmSenso__FarmS__787EE5A0");
            });

            modelBuilder.Entity<FarmSensors>(entity =>
            {
                entity.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

                entity.HasOne(d => d.Farm)
                    .WithMany(p => p.FarmSensors)
                    .HasForeignKey(d => d.FarmId)
                    .HasConstraintName("FK__FarmSenso__FarmI__73BA3083");

                entity.HasOne(d => d.Sensor)
                    .WithMany(p => p.FarmSensors)
                    .HasForeignKey(d => d.SensorId)
                    .HasConstraintName("FK__FarmSenso__Senso__74AE54BC");
            });

            modelBuilder.Entity<Farms>(entity =>
            {
                entity.Property(e => e.Address).HasMaxLength(255);

                entity.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Description).HasMaxLength(3000);

                entity.Property(e => e.Latitude).HasColumnType("decimal(18, 0)");

                entity.Property(e => e.Longitude).HasColumnType("decimal(18, 0)");

                entity.Property(e => e.Name).HasMaxLength(255);

                entity.HasOne(d => d.City)
                    .WithMany(p => p.Farms)
                    .HasForeignKey(d => d.CityId)
                    .HasConstraintName("FK__Farms__CityId__5812160E");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Farms)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK__Farms__UserId__59063A47");
            });

            modelBuilder.Entity<MeasuringUnits>(entity =>
            {
                entity.Property(e => e.Code)
                    .HasMaxLength(3)
                    .IsUnicode(false);

                entity.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Name).HasMaxLength(255);

                entity.Property(e => e.Version).HasDefaultValueSql("((1))");
            });

            modelBuilder.Entity<PlantTypes>(entity =>
            {
                entity.Property(e => e.Code)
                    .HasMaxLength(3)
                    .IsUnicode(false);

                entity.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Name).HasMaxLength(255);

                entity.Property(e => e.Version).HasDefaultValueSql("((1))");
            });

            modelBuilder.Entity<Plants>(entity =>
            {
                entity.Property(e => e.Code)
                    .HasMaxLength(3)
                    .IsUnicode(false);

                entity.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Description).HasMaxLength(3000);

                entity.Property(e => e.Name).HasMaxLength(255);

                entity.Property(e => e.Version).HasDefaultValueSql("((1))");

                entity.HasOne(d => d.PlantType)
                    .WithMany(p => p.Plants)
                    .HasForeignKey(d => d.PlantTypeId)
                    .HasConstraintName("FK__Plants__PlantTyp__48CFD27E");
            });

            modelBuilder.Entity<Roles>(entity =>
            {
                entity.Property(e => e.Code)
                    .HasMaxLength(3)
                    .IsUnicode(false);

                entity.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Name).HasMaxLength(255);

                entity.Property(e => e.Version).HasDefaultValueSql("((1))");
            });

            modelBuilder.Entity<RuleSets>(entity =>
            {
                entity.Property(e => e.Active).HasDefaultValueSql("((0))");

                entity.Property(e => e.Code)
                    .HasMaxLength(3)
                    .IsUnicode(false);

                entity.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Name).HasMaxLength(255);
            });

            modelBuilder.Entity<Rules>(entity =>
            {
                entity.Property(e => e.Active).HasDefaultValueSql("((0))");

                entity.Property(e => e.Code)
                    .HasMaxLength(3)
                    .IsUnicode(false);

                entity.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Name).HasMaxLength(255);

                entity.HasOne(d => d.RuleSet)
                    .WithMany(p => p.Rules)
                    .HasForeignKey(d => d.RuleSetId)
                    .HasConstraintName("FK__Rules__RuleSetId__02FC7413");
            });

            modelBuilder.Entity<SensorTypes>(entity =>
            {
                entity.Property(e => e.Code)
                    .HasMaxLength(3)
                    .IsUnicode(false);

                entity.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Name).HasMaxLength(255);

                entity.Property(e => e.Version).HasDefaultValueSql("((1))");
            });

            modelBuilder.Entity<Sensors>(entity =>
            {
                entity.Property(e => e.Code)
                    .HasMaxLength(3)
                    .IsUnicode(false);

                entity.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Name).HasMaxLength(255);

                entity.Property(e => e.Version).HasDefaultValueSql("((1))");

                entity.HasOne(d => d.MeasuringUnit)
                    .WithMany(p => p.Sensors)
                    .HasForeignKey(d => d.MeasuringUnitId)
                    .HasConstraintName("FK__Sensors__Measuri__6EF57B66");

                entity.HasOne(d => d.SensorType)
                    .WithMany(p => p.Sensors)
                    .HasForeignKey(d => d.SensorTypeId)
                    .HasConstraintName("FK__Sensors__SensorT__6E01572D");
            });

            modelBuilder.Entity<Users>(entity =>
            {
                entity.Property(e => e.Active).HasDefaultValueSql("((1))");

                entity.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Password).HasMaxLength(255);

                entity.Property(e => e.Username).HasMaxLength(255);

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.RoleId)
                    .HasConstraintName("FK__Users__RoleId__3E52440B");
            });
        }
    }
}
