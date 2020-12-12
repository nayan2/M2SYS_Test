using System.Net.Mime;
using System.Threading.Tasks;
using M2SYS.Service.Interface;
using M2SYS.Web.Filter;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace M2SYS.Web.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class EnumController : ControllerBase
    {
        private readonly IEnumService _enumService;
        public EnumController(IEnumService enumService)
        {
            _enumService = enumService;
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public IActionResult Test()
        {
            return Ok("I am just a test");
        }
        
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public IActionResult GetAllDepartmentTypes()
        {
            return Ok(_enumService.GetDepartments());
        }
        
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public IActionResult GetAllDesignationTypes()
        {
            return Ok(_enumService.GetDesignations());
        }
        
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public IActionResult GetAllLeaveTypes()
        {
            return Ok(_enumService.GetLeaveTypes());
        }
    }
}