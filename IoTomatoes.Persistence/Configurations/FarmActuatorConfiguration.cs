using System;
using IoTomatoes.Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace IoTomatoes.Persistence.Configurations
{
    public class FarmActuatorConfiguration : IEntityTypeConfiguration<FarmActutator>
    {
        public void Configure(EntityTypeBuilder<FarmActutator> builder)
        {
            builder.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

            builder.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

            builder.HasOne(d => d.Actuator)
                .WithMany(p => p.FarmActutators)
                .HasForeignKey(d => d.ActuatorId)
                .HasConstraintName("FK__FarmActut__Actua__17F790F9");

            builder.HasOne(d => d.Farm)
                .WithMany(p => p.FarmActutators)
                .HasForeignKey(d => d.FarmId)
                .HasConstraintName("FK__FarmActut__FarmI__17036CC0");
        }
    }
}
