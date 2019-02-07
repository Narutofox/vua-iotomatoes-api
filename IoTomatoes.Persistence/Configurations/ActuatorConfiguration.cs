using System;
using IoTomatoes.Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace IoTomatoes.Persistence.Configurations
{
    public class ActuatorConfiguration : IEntityTypeConfiguration<Actuator>
    {
        public void Configure(EntityTypeBuilder<Actuator> builder)
        {
            builder.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

            builder.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

            builder.Property(e => e.Code).HasMaxLength(20);

            builder.HasOne(d => d.ActuatorType)
                .WithMany(p => p.Actuators)
                .HasForeignKey(d => d.ActutatorTypeId)
                .HasConstraintName("FK__Actuators__Actut__123EB7A3");
        }
    }
}
