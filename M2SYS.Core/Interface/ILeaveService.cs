using System.Threading.Tasks;
using M2SYS.Domain.Entities;

namespace M2SYS.Service.Interface
{
    public interface ILeaveService
    {
        Task<Leave> AddLeave(Leave leave);
        Task<Leave> EditLeave(Leave leave);
        Task<bool> DeleteLeave(long id);
    }
}