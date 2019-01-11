using System;
using IoTomatoes.Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace IoTomatoes.Persistence.Configurations
{
    public class FarmActuatorConfiguration : IEntityTypeConfiguration<FarmActuator>
    {
        public void Configure(EntityTypeBuilder<FarmActuator> builder)
        {
            builder.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

            builder.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

            builder.HasOne(d => d.Actuator)
                .WithMany(p => p.FarmActuators)
                .HasForeignKey(d => d.ActuatorId)
                .HasConstraintName("FK__FarmActut__Actua__17F790F9");

            builder.HasOne(d => d.Farm)
                .WithMany(p => p.FarmActuators)
                .HasForeignKey(d => d.FarmId)
                .HasConstraintName("FK__FarmActut__FarmI__17036CC0");
        }
    }
}
