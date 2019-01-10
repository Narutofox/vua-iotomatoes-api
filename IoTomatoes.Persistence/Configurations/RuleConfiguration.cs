using System;
using IoTomatoes.Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace IoTomatoes.Persistence.Configurations
{
    public class RuleConfiguration : IEntityTypeConfiguration<Rule>
    {
        public void Configure(EntityTypeBuilder<Rule> builder)
        {
            builder.Property(e => e.Active).HasDefaultValueSql("((0))");

            builder.Property(e => e.Code)
                .HasMaxLength(3)
                .IsUnicode(false);

            builder.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

            builder.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

            builder.Property(e => e.Name).HasMaxLength(255);

            builder.HasOne(d => d.RuleSet)
                .WithMany(p => p.Rules)
                .HasForeignKey(d => d.RuleSetId)
                .HasConstraintName("FK__Rules__RuleSetId__02FC7413");
        }
    }
}
