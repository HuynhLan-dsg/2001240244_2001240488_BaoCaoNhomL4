using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace quanlydoan.Models;

public partial class QuanLyDoAnContext : DbContext
{
    public QuanLyDoAnContext()
    {
    }

    public QuanLyDoAnContext(DbContextOptions<QuanLyDoAnContext> options)
        : base(options)
    {
    }

    public virtual DbSet<ChuyenNganh> ChuyenNganhs { get; set; }

    public virtual DbSet<LoaiDeTai> LoaiDeTais { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=localhost\\SQLEXPRESS03;Database=QuanLyDoAn;Trusted_Connection=True;TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<ChuyenNganh>(entity =>
        {
            entity.HasKey(e => e.MaChuyenNganh).HasName("PK__ChuyenNg__F89CA683228D1E42");

            entity.ToTable("ChuyenNganh");

            entity.Property(e => e.MaChuyenNganh)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("maChuyenNganh");
            entity.Property(e => e.MaLoai)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("maLoai");
            entity.Property(e => e.MoTa)
                .HasMaxLength(100)
                .HasColumnName("moTa");
            entity.Property(e => e.TenChuyenNganh)
                .HasMaxLength(100)
                .HasColumnName("tenChuyenNganh");

            entity.HasOne(d => d.MaLoaiNavigation).WithMany(p => p.ChuyenNganhs)
                .HasForeignKey(d => d.MaLoai)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_CN");
        });

        modelBuilder.Entity<LoaiDeTai>(entity =>
        {
            entity.HasKey(e => e.MaLoai).HasName("PK__LoaiDeTa__E5A6B2289381A88B");

            entity.ToTable("LoaiDeTai");

            entity.Property(e => e.MaLoai)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("maLoai");
            entity.Property(e => e.TenLoai)
                .HasMaxLength(100)
                .HasColumnName("tenLoai");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
