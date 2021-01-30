using System;
using System.Threading.Tasks;
using M2SYS.Domain.Entities;
using M2SYS.Repo.Interface;
using M2SYS.Service.Interface;
using M2SYS.Utility.DTOs;

namespace M2SYS.Core
{
    public class EmployeeService : IEmployeeService
    {
        private readonly IEmployeeRepo _employeeRepo;
        public EmployeeService(IEmployeeRepo employeeRepo)
        {
            _employeeRepo = employeeRepo;
        }
        
        public async Task<Employee> AddEmployee(Employee employee)
        {
            throw new NotImplementedException();
        }

        public async Task<Employee> EditEmployee(Employee employee)
        {
            throw new NotImplementedException();
        }

        public async Task<bool> DeleteEmployee(long id)
        {
            await _employeeRepo.DeleteAsync(id);
            return true;
        }

        public async Task<Page<Employee>> GetEmployees(string searchTerm, int pageIndex, int pageSize)
        {
            throw new NotImplementedException();
        }

        public async Task<Employee> GetEmployeeById(long id)
        {
            return await _employeeRepo.GetByIdAsync(id);
        }
    }
}