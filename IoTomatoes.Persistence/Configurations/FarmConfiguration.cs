using System;
using IoTomatoes.Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace IoTomatoes.Persistence.Configurations
{
    public class FarmConfiguration : IEntityTypeConfiguration<Farm>
    {
        public void Configure(EntityTypeBuilder<Farm> builder)
        {
            builder.Property(e => e.Address).HasMaxLength(255);

            builder.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

            builder.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

            builder.Property(e => e.Description).HasMaxLength(3000);

            builder.Property(e => e.Latitude).HasColumnType("decimal(18, 7)");

            builder.Property(e => e.Longitude).HasColumnType("decimal(18, 7)");

            builder.Property(e => e.Name).HasMaxLength(255);

            builder.HasOne(d => d.City)
                .WithMany(p => p.Farms)
                .HasForeignKey(d => d.CityId)
                .HasConstraintName("FK__Farms__CityId__5812160E");

            builder.HasOne(d => d.RuleSet)
                .WithMany(p => p.Farms)
                .HasForeignKey(d => d.RuleSetId);

            builder.HasOne(d => d.User)
                .WithMany(p => p.Farms)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK__Farms__UserId__59063A47");
        }
    }
}
