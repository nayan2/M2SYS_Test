using System;
using System.Linq;
using System.Linq.Expressions;
using System.Threading;
using System.Threading.Tasks;
using M2SYS.Core.Query;
using M2SYS.Domain.Entities;
using M2SYS.Repo;
using M2SYS.Utility.DTOs;
using MediatR;

namespace M2SYS.Core.Handler
{
    public class GetPagedEmployeeHandler: IRequestHandler<GetPagedEmployeeQuery, Page<Employee>>
    {
        private readonly EmployeeRepo _employeeRepo;
        
        public GetPagedEmployeeHandler(EmployeeRepo employeeRepo)
        {
            _employeeRepo = employeeRepo;
        }
        
        public async Task<Page<Employee>> Handle(GetPagedEmployeeQuery request, CancellationToken cancellationToken)
        {
            var searchTerm = request.SearchTerm?.ToLower();
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
            Page<Employee> response = await _employeeRepo.GetPageAsync(request.PageIndex, request.PageSize, predicate: predicate,
                orderBy: o => o.OrderByDescending(x => x.CreatedDateUtc), includes: includes);
            return response;
        }
    }
}