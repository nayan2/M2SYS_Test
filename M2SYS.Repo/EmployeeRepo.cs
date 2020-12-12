using M2SYS.Domain.Entities;
using M2SYS.Infrastructure.Context;
using M2SYS.Repo.Interface;

namespace M2SYS.Repo
{
    public class EmployeeRepo : BaseRepo<Employee>, IEmployeeRepo
    {
        public EmployeeRepo(HRMContext dbContext) : base(dbContext)
        {
            
        }
    }
}