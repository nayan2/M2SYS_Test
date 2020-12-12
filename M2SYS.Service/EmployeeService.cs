using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using M2SYS.Domain.Entities;
using M2SYS.Repo.Interface;
using M2SYS.Service.Interface;
using M2SYS.Utility.DTOs;

namespace M2SYS.Service
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
            return await _employeeRepo.AddAsync(employee);
        }

        public async Task<Employee> EditEmployee(Employee employee)
        {
            return await _employeeRepo.EditAsync(employee);
        }

        public async Task<bool> DeleteEmployee(long id)
        {
            await _employeeRepo.DeleteAsync(id);
            return true;
        }

        public async Task<Page<Employee>> GetEmployees(string searchTerm, int pageIndex, int pageSize)
        {
            searchTerm = searchTerm?.ToLower();
            var isSearchContainsDate = DateTime.TryParse(searchTerm, out var dateTime);
            Expression<Func<Employee, bool>> predicate = x => true;

            if (!string.IsNullOrWhiteSpace(searchTerm))
            {
                if (!isSearchContainsDate)
                    predicate = x => x.FirstName.ToLower().Contains(searchTerm) || x.MiddleName.ToLower().Contains(searchTerm) || x.LastName.ToLower().Contains(searchTerm);
                else
                    predicate = x => x.DOB.Date == dateTime.Date || x.JoiningDate.Date == dateTime.Date;
            }

            Expression<Func<Employee, object>>[] includes = { x => x.Leaves };
            Page<Employee> response = await _employeeRepo.GetPageAsync(pageIndex, pageSize, predicate: predicate,
                orderBy: o => o.OrderByDescending(x => x.CreatedDateUtc), includes: includes);
            return response;
        }

        public async Task<Employee> GetEmployeeById(long id)
        {
            return await _employeeRepo.GetByIdAsync(id);
        }
    }
}