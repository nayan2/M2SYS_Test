using System.Threading;
using System.Threading.Tasks;
using M2SYS.Core.Command;
using M2SYS.Repo.Interface;
using MediatR;

namespace M2SYS.Core.Handler
{
    public class EditEmployeeHandler: IRequestHandler<EditEmployeeCommand, bool>
    {
        private readonly IEmployeeRepo _employeeRepo;
        
        public EditEmployeeHandler(IEmployeeRepo employeeRepo)
        {
            _employeeRepo = employeeRepo;
        }
        
        public async Task<bool> Handle(EditEmployeeCommand request, CancellationToken cancellationToken)
        {
            var result = await _employeeRepo.EditAsync(request);
            return result != null;
        }
    }
}