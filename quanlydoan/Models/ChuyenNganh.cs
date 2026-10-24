using System;
using System.Collections.Generic;

namespace quanlydoan.Models;

public partial class ChuyenNganh
{
    public string MaChuyenNganh { get; set; } = null!;

    public string TenChuyenNganh { get; set; } = null!;

    public string? MoTa { get; set; }

    public string MaLoai { get; set; } = null!;

    public virtual LoaiDeTai MaLoaiNavigation { get; set; } = null!;
}
