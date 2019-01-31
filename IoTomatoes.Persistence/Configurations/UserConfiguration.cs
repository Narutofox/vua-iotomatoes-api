using System;
using IoTomatoes.Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace IoTomatoes.Persistence.Configurations
{
    public class UserConfiguration : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.Property(e => e.Active).HasDefaultValueSql("((1))");

            builder.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())");

            builder.Property(e => e.DateModified).HasDefaultValueSql("(getdate())");

            builder.Property(e => e.FirstName).HasMaxLength(255);

            builder.Property(e => e.LastName).HasMaxLength(255);

            builder.Property(e => e.Email).HasMaxLength(255);

            builder.Property(e => e.Password).HasMaxLength(255);

            builder.Property(e => e.Username).HasMaxLength(255);

            builder.HasOne(d => d.Role)
                .WithMany(p => p.Users)
                .HasForeignKey(d => d.RoleId)
                .HasConstraintName("FK__Users__RoleId__3E52440B");
        }
    }
}
