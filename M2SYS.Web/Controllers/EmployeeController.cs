using System.Threading.Tasks;
using M2SYS.Core.Command;
using M2SYS.Core.Query;
using M2SYS.Domain.Entities;
using M2SYS.Service.Interface;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace M2SYS.Web.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class EmployeeController : ControllerBase
    {
        private readonly IEmployeeService _employeeService;
        private readonly IMediator _mediator;
        public EmployeeController(IEmployeeService employeeService, IMediator mediator)
        {
            _employeeService = employeeService;
            _mediator = mediator;
        }
        
        [HttpGet("{id:long}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<IActionResult> Get(long id)
        {
            var query = new GetEmployeeByIdQuery(id);
            var result = await this._mediator.Send(query);
            return result != null ? Ok(result) : NoContent();
        }
        
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<IActionResult> Gets(int pageIndex, int pageSize, string searchTerm)
        {
            var query = new GetPagedEmployeeQuery(pageIndex, pageSize, searchTerm);
            var result = await this._mediator.Send(query);
            return result != null ? Ok(result) : NoContent();
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        public async Task<IActionResult> Add(AddEmployeeCommand employee)
        {
            var response = await this._mediator.Send(employee);
            return CreatedAtAction(nameof(Add), new { id = response.Id }, response);
        }

        [HttpPut("{id:long}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<IActionResult> Edit(long id, EditEmployeeCommand employee)
        {
            var result = await this._mediator.Send(employee);
            return result ? Ok() : BadRequest("Invalid Employee");
        }

        [HttpDelete("{id:long}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<IActionResult> Delete(long id)
        {
            return Ok(await _employeeService.DeleteEmployee(id));
        }
    }
}