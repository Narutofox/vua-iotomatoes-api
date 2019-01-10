using System;
using IoTomatoes.Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace IoTomatoes.Persistence.Configurations
{
    public class CityConfiguration : IEntityTypeConfiguration<City>
    {
        public void Configure(EntityTypeBuilder<City> builder)
        {
            builder.Property(e => e.Code)
                    .HasMaxLength(3)
                    .IsUnicode(false);

            builder.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

            builder.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

            builder.Property(e => e.Name).HasMaxLength(255);

            builder.Property(e => e.PostalCode)
                .HasMaxLength(5)
                .IsUnicode(false);

            builder.Property(e => e.Version).HasDefaultValueSql("((1))");

            builder.HasOne(d => d.Country)
                .WithMany(p => p.Cities)
                .HasForeignKey(d => d.CountryId)
                .HasConstraintName("FK__Cities__CountryI__534D60F1");
        }
    }
}
