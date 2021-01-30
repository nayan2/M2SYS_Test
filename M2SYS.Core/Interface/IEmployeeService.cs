using System.Collections.Generic;
using System.Threading.Tasks;
using M2SYS.Domain.Entities;
using M2SYS.Utility.DTOs;

namespace M2SYS.Service.Interface
{
    public interface IEmployeeService
    {
        Task<Employee> GetEmployeeById(long id);
        Task<Employee> AddEmployee(Employee employee);
        Task<Employee> EditEmployee(Employee employee);
        Task<bool> DeleteEmployee(long id);
        Task<Page<Employee>> GetEmployees(string searchTerm, int pageIndex, int pageSize);
    }
}