using System.Net.Mime;
using System.Text;
using System.Threading.Tasks;
using M2SYS.Domain.Entities;
using M2SYS.Service.Interface;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace M2SYS.Web.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class EmployeeController : ControllerBase
    {
        private readonly IEmployeeService _employeeService;
        public EmployeeController(IEmployeeService employeeService)
        {
            _employeeService = employeeService;
        }
        
        [HttpGet("{id:long}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<IActionResult> Get(long id)
        {
            return Ok(await _employeeService.GetEmployeeById(id));
        }
        
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<IActionResult> Gets(int pageIndex, int pageSize, string searchTerm)
        {
            return Ok(await _employeeService.GetEmployees(searchTerm, pageIndex, pageSize));
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        public async Task<IActionResult> Add(Employee employee)
        {
            var newEmployee = await _employeeService.AddEmployee(employee);
            return CreatedAtAction(nameof(Add), new { id = newEmployee.Id }, newEmployee);
        }

        [HttpPut("{id:long}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<IActionResult> Edit(long id, Employee employee)
        {
            return Ok(await _employeeService.EditEmployee(employee));
        }

        [HttpDelete("{id:long}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<IActionResult> Delete(long id)
        {
            return Ok(await _employeeService.DeleteEmployee(id));
        }
    }
}