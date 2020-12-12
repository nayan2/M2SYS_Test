using M2SYS.Domain.Entities;
using M2SYS.Infrastructure.Context;
using M2SYS.Repo.Interface;

namespace M2SYS.Repo
{
    public class LeaveRepo : BaseRepo<Leave>, ILeaveRepo
    {
        public LeaveRepo(HRMContext dbContext) : base(dbContext)
        {
            
        }
    }
}