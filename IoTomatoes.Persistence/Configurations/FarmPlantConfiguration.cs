using System;
using IoTomatoes.Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace IoTomatoes.Persistence.Configurations
{
    public class FarmPlantConfiguration : IEntityTypeConfiguration<FarmPlant>
    {
        public void Configure(EntityTypeBuilder<FarmPlant> builder)
        {
            builder.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

            builder.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

            builder.HasOne(d => d.Farm)
                .WithMany(p => p.FarmPlants)
                .HasForeignKey(d => d.FarmId)
                .HasConstraintName("FK__FarmPlant__FarmI__5DCAEF64");

            builder.HasOne(d => d.Plant)
                .WithMany(p => p.FarmPlants)
                .HasForeignKey(d => d.PlantId)
                .HasConstraintName("FK__FarmPlant__Plant__5EBF139D");
        }
    }
}
