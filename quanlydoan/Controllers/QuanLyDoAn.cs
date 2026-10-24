using Microsoft.AspNetCore.Mvc;
using quanlydoan.Models;
namespace quanlydoan.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoaiDeTaiController : ControllerBase
    {
        private readonly QuanLyDoAnContext _context;

        public LoaiDeTaiController(QuanLyDoAnContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult GetLoaiDeTai()
        {
            return Ok(_context.LoaiDeTais.ToList());
        }
    }
}