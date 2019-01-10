using System;
using Microsoft.EntityFrameworkCore;
using IoTomatoes.Domain.Models;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace IoTomatoes.Persistence.Configurations
{
    public class ActuatorTypeConfiguration : IEntityTypeConfiguration<ActuatorType>
    {
        public void Configure(EntityTypeBuilder<ActuatorType> builder)
        {
            builder.Property(e => e.Code)
                    .HasMaxLength(3)
                    .IsUnicode(false);

            builder.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

            builder.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

            builder.Property(e => e.Name).HasMaxLength(255);

            builder.Property(e => e.Version).HasDefaultValueSql("((1))");
        }
    }
}
