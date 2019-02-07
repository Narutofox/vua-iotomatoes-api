using System;
using IoTomatoes.Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace IoTomatoes.Persistence.Configurations
{
    public class FarmSensorMeasurementConfiguration : IEntityTypeConfiguration<FarmSensorMeasurement>
    {
        public void Configure(EntityTypeBuilder<FarmSensorMeasurement> builder)
        {
            builder.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

            builder.Property(e => e.Value).HasColumnType("decimal(18, 2)");

            builder.HasOne(d => d.FarmSensor)
                .WithMany(p => p.FarmSensorMeasurements)
                .HasForeignKey(d => d.FarmSensorId)
                .HasConstraintName("FK__FarmSenso__FarmS__787EE5A0");
        }
    }
}
