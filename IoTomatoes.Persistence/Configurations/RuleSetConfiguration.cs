using System;
using IoTomatoes.Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace IoTomatoes.Persistence.Configurations
{
    public class RuleSetConfiguration : IEntityTypeConfiguration<RuleSet>
    {
        public void Configure(EntityTypeBuilder<RuleSet> builder)
        {
            builder.Property(e => e.Active).HasDefaultValueSql("((0))");

            builder.Property(e => e.Code)
                .HasMaxLength(3)
                .IsUnicode(false);

            builder.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

            builder.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

            builder.Property(e => e.Name).HasMaxLength(255);
        }
    }
}
