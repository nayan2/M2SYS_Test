using System.Threading;
using System.Threading.Tasks;
using M2SYS.Core.Query;
using M2SYS.Domain.Entities;
using M2SYS.Repo.Interface;
using MediatR;

namespace M2SYS.Core.Handler
{
    public class GetEmployeeByIdHandler: IRequestHandler<GetEmployeeByIdQuery, Employee>
    {
        private readonly IEmployeeRepo _employeeRepo;

        public GetEmployeeByIdHandler(IEmployeeRepo employeeRepo)
        {
            _employeeRepo = employeeRepo;
        }
        
        public async Task<Employee> Handle(GetEmployeeByIdQuery request, CancellationToken cancellationToken)
        {
            return await _employeeRepo.GetByIdAsync(request.Id);
        }
    }
}