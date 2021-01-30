using System.Threading;
using System.Threading.Tasks;
using M2SYS.Core.Command;
using M2SYS.Domain.Entities;
using M2SYS.Repo.Interface;
using MediatR;

namespace M2SYS.Core.Handler
{
    public class AddEmployeeHandler: IRequestHandler<AddEmployeeCommand, Employee>
    {
        private readonly IEmployeeRepo _employeeRepo;
        
        public AddEmployeeHandler(IEmployeeRepo employeeRepo)
        {
            _employeeRepo = employeeRepo;
        }
        
        public async Task<Employee> Handle(AddEmployeeCommand request, CancellationToken cancellationToken)
        {
            return await _employeeRepo.AddAsync(request);
        }
    }
}