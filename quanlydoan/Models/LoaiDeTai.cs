using System;
using System.Collections.Generic;

namespace quanlydoan.Models;

public partial class LoaiDeTai
{
    public string MaLoai { get; set; } = null!;

    public string TenLoai { get; set; } = null!;

    public virtual ICollection<ChuyenNganh> ChuyenNganhs { get; set; } = new List<ChuyenNganh>();
}
