using System;
using IoTomatoes.Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace IoTomatoes.Persistence.Configurations
{
    public class FarmSensorConfiguration : IEntityTypeConfiguration<FarmSensor>
    {
        public void Configure(EntityTypeBuilder<FarmSensor> builder)
        {
            builder.Property(e => e.Name).HasMaxLength(255);

            builder.Property(e => e.Code).HasMaxLength(10);

            builder.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

            builder.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

            builder.HasOne(d => d.Farm)
                .WithMany(p => p.FarmSensors)
                .HasForeignKey(d => d.FarmId)
                .HasConstraintName("FK__FarmSenso__FarmI__73BA3083");

            builder.HasOne(d => d.Sensor)
                .WithMany(p => p.FarmSensors)
                .HasForeignKey(d => d.SensorId)
                .HasConstraintName("FK__FarmSenso__Senso__74AE54BC");
        }
    }
}
