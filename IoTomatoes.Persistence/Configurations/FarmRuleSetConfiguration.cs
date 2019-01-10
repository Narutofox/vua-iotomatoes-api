using System;
using IoTomatoes.Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace IoTomatoes.Persistence.Configurations
{
    public class FarmRuleSetConfiguration : IEntityTypeConfiguration<FarmRuleSet>
    {
        public void Configure(EntityTypeBuilder<FarmRuleSet> builder)
        {
            builder.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

            builder.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

            builder.HasOne(d => d.Farm)
                .WithMany(p => p.FarmRuleSets)
                .HasForeignKey(d => d.FarmId)
                .HasConstraintName("FK__FarmRuleS__FarmI__07C12930");

            builder.HasOne(d => d.RuleSet)
                .WithMany(p => p.FarmRuleSets)
                .HasForeignKey(d => d.RuleSetId)
                .HasConstraintName("FK__FarmRuleS__RuleS__08B54D69");
        }
    }
}
