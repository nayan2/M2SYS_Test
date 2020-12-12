using System.Threading.Tasks;
using M2SYS.Domain.Entities;
using M2SYS.Repo.Interface;
using M2SYS.Service.Interface;

namespace M2SYS.Service
{
    public class LeaveService: ILeaveService
    {
        private readonly ILeaveRepo _leaveRepo;
        public LeaveService(ILeaveRepo leaveRepo)
        {
            _leaveRepo = leaveRepo;
        }
        
        public async Task<Leave> AddLeave(Leave leave)
        {
            return await _leaveRepo.AddAsync(leave);
        }

        public async Task<Leave> EditLeave(Leave leave)
        {
            return await _leaveRepo.EditAsync(leave);
        }

        public async Task<bool> DeleteLeave(long id)
        {
            await _leaveRepo.DeleteAsync(id);
            return true;
        }
    }
}