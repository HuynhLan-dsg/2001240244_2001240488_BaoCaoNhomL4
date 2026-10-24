using Microsoft.AspNetCore.Mvc;
using quanlydoan.Models;

namespace quanlydoan.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ChuyenNganhController : ControllerBase
    {
        private readonly QuanLyDoAnContext _context;

        public ChuyenNganhController(QuanLyDoAnContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult GetAll()
        {
            return Ok(_context.ChuyenNganhs.ToList());
        }
        [HttpGet("{maLoai}")]
        public IActionResult GetByLoai(string maLoai)
        {
            var ds = _context.ChuyenNganhs
                             .Where(x => x.MaLoai == maLoai)
                             .ToList();

            return Ok(ds);
        }
    }
}