using M2SYS.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System.Reflection;

namespace M2SYS.Infrastructure.Context
{
    public sealed class HRMContext: DbContext
    {
        public HRMContext()
        {
            this.ChangeTracker.LazyLoadingEnabled = false;
        }

        public HRMContext(DbContextOptions<HRMContext> options): base(options)
        {

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());
        }

        // Add DbSet here
        public DbSet<Employee> Employees { get; set; }
        public DbSet<Leave> Leaves { get; set; } 
    }
}
