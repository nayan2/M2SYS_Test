using System.Threading.Tasks;
using M2SYS.Domain.Entities;
using M2SYS.Service.Interface;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace M2SYS.Web.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class LeaveController: ControllerBase
    {
        private readonly ILeaveService _leaveService;
        public LeaveController(ILeaveService leaveService)
        {
            _leaveService = leaveService;
        }
        
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        public async Task<IActionResult> Add(Leave leave)
        {
            var newLeaveRequest = await _leaveService.AddLeave(leave);
            return CreatedAtAction(nameof(Add), new { id = newLeaveRequest.Id }, newLeaveRequest);
        }
        
        [HttpPut("{id:long}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<IActionResult> Edit(long id, Leave leave)
        {
            return Ok(await _leaveService.EditLeave(leave));
        }

        [HttpDelete("{id:long}")]
        public async Task<IActionResult> Delete(long id)
        {
            return Ok(await _leaveService.DeleteLeave(id));
        }
    }
}