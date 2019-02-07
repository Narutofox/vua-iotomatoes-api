using System;
using IoTomatoes.Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace IoTomatoes.Persistence.Configurations
{
    public class MeasuringUnitConfiguration : IEntityTypeConfiguration<MeasuringUnit>
    {
        public void Configure(EntityTypeBuilder<MeasuringUnit> builder)
        {
            builder.Property(e => e.Code)
                    .HasMaxLength(10);

            builder.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

            builder.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

            builder.Property(e => e.Name).HasMaxLength(255);

            builder.Property(e => e.Version).HasDefaultValueSql("((1))");
        }
    }
}
