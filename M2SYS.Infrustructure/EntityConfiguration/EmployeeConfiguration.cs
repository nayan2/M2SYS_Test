using M2SYS.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace M2SYS.Infrastructure.EntityConfiguration
{
    public class EmployeeConfiguration : IEntityTypeConfiguration<Employee>
    {
        public void Configure(EntityTypeBuilder<Employee> builder)
        {
            builder.HasKey(x => x.Id);
            builder.Property(x => x.FirstName)
                .HasMaxLength(600)
                .IsRequired();
            builder.Property(x => x.MiddleName)
                .HasMaxLength(600);
            builder.Property(x => x.LastName)
                .HasMaxLength(600)
                .IsRequired();
        }
    }
}
