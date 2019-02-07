using System;
using IoTomatoes.Domain.Models;
using Microsoft.EntityFrameworkCore;

namespace IoTomatoes.Persistence.Configurations
{
    public class SensorConfiguration : IEntityTypeConfiguration<Sensor>
    {
        public SensorConfiguration()
        {
        }

        public void Configure(Microsoft.EntityFrameworkCore.Metadata.Builders.EntityTypeBuilder<Sensor> builder)
        {
            builder.Property(e => e.Code)
                    .HasMaxLength(20);

            builder.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

            builder.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

            builder.Property(e => e.Version).HasDefaultValueSql("((1))");

            builder.HasOne(d => d.MeasuringUnit)
                .WithMany(p => p.Sensors)
                .HasForeignKey(d => d.MeasuringUnitId)
                .HasConstraintName("FK__Sensors__Measuri__6EF57B66");

            builder.HasOne(d => d.SensorType)
                .WithMany(p => p.Sensors)
                .HasForeignKey(d => d.SensorTypeId)
                .HasConstraintName("FK__Sensors__SensorT__6E01572D");
        }
    }
}
