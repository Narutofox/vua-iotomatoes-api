using System;
using IoTomatoes.Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace IoTomatoes.Persistence.Configurations
{
    public class PlantConfiguration : IEntityTypeConfiguration<Plant>
    {
        public void Configure(EntityTypeBuilder<Plant> builder)
        {
            builder.Property(e => e.Code)
                    .HasMaxLength(10);

            builder.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

            builder.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

            builder.Property(e => e.Description).HasMaxLength(3000);

            builder.Property(e => e.Name).HasMaxLength(255);

            builder.Property(e => e.Version).HasDefaultValueSql("((1))");
        }
    }
}
