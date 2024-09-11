using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace OnlineStore.Models;

public partial class DbShoppingStoreContext : DbContext
{
    public DbShoppingStoreContext()
    {
    }

    public DbShoppingStoreContext(DbContextOptions<DbShoppingStoreContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Admin> Admins { get; set; }

    public virtual DbSet<Brand> Brands { get; set; }

    public virtual DbSet<Category> Categories { get; set; }

    public virtual DbSet<Customer> Customers { get; set; }

    public virtual DbSet<Feedback> Feedbacks { get; set; }

    public virtual DbSet<Order> Orders { get; set; }

    public virtual DbSet<OrderDetail> OrderDetails { get; set; }

    public virtual DbSet<Product> Products { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=.;Initial Catalog=db_ShoppingStore;Integrated Security=True;Trust Server Certificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Admin>(entity =>
        {
            entity.HasKey(e => e.AdminId).HasName("PK__Admins__719FE4E825E8092D");

            entity.Property(e => e.AdminId).HasColumnName("AdminID");
            entity.Property(e => e.Email).HasMaxLength(255);
            entity.Property(e => e.Passwor).HasMaxLength(255);
            entity.Property(e => e.Role).HasMaxLength(50);
            entity.Property(e => e.Status).HasMaxLength(50);
            entity.Property(e => e.Username).HasMaxLength(100);
        });

        modelBuilder.Entity<Brand>(entity =>
        {
            entity.HasKey(e => e.BrandId).HasName("PK__Brands__DAD4F3BE20F27CB3");

            entity.Property(e => e.BrandId).HasColumnName("BrandID");
            entity.Property(e => e.BrandName).HasMaxLength(50);
        });

        modelBuilder.Entity<Category>(entity =>
        {
            entity.HasKey(e => e.CategoryId).HasName("PK__Categori__19093A2B3A3F747C");

            entity.Property(e => e.CategoryId).HasColumnName("CategoryID");
            entity.Property(e => e.CategoryName).HasMaxLength(100);
        });

        modelBuilder.Entity<Customer>(entity =>
        {
            entity.HasKey(e => e.CustomerId).HasName("PK__Customer__A4AE64B8ED779F73");

            entity.Property(e => e.CustomerId).HasColumnName("CustomerID");
            entity.Property(e => e.Address).HasMaxLength(255);
            entity.Property(e => e.City).HasMaxLength(100);
            entity.Property(e => e.Email).HasMaxLength(255);
            entity.Property(e => e.FullName).HasMaxLength(100);
            entity.Property(e => e.Phone).HasMaxLength(20);
            entity.Property(e => e.State).HasMaxLength(100);
            entity.Property(e => e.ZipCode).HasMaxLength(10);
        });

        modelBuilder.Entity<Feedback>(entity =>
        {
            entity.HasKey(e => e.FeedbackId).HasName("PK__Feedback__6A4BEDF6AAFB161E");

            entity.Property(e => e.FeedbackId).HasColumnName("FeedbackID");
            entity.Property(e => e.CustomerFid).HasColumnName("CustomerFID");
            entity.Property(e => e.FeedbackDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.ProductFid).HasColumnName("ProductFID");

            entity.HasOne(d => d.CustomerF).WithMany(p => p.Feedbacks)
                .HasForeignKey(d => d.CustomerFid)
                .HasConstraintName("FK__Feedbacks__Custo__5DCAEF64");

            entity.HasOne(d => d.ProductF).WithMany(p => p.Feedbacks)
                .HasForeignKey(d => d.ProductFid)
                .HasConstraintName("FK__Feedbacks__Produ__5EBF139D");
        });

        modelBuilder.Entity<Order>(entity =>
        {
            entity.HasKey(e => e.OrderId).HasName("PK__Orders__C3905BAF208B7C26");

            entity.Property(e => e.OrderId).HasColumnName("OrderID");
            entity.Property(e => e.CustomerFid).HasColumnName("CustomerFID");
            entity.Property(e => e.OrderDate).HasColumnType("datetime");
            entity.Property(e => e.TotalAmount).HasColumnType("decimal(10, 2)");

            entity.HasOne(d => d.CustomerF).WithMany(p => p.Orders)
                .HasForeignKey(d => d.CustomerFid)
                .HasConstraintName("FK__Orders__Customer__534D60F1");
        });

        modelBuilder.Entity<OrderDetail>(entity =>
        {
            entity.HasKey(e => e.OrderDetailId).HasName("PK__OrderDet__D3B9D30CA0894220");

            entity.Property(e => e.OrderDetailId).HasColumnName("OrderDetailID");
            entity.Property(e => e.OrderFid).HasColumnName("OrderFID");
            entity.Property(e => e.ProductFid).HasColumnName("ProductFID");
            entity.Property(e => e.UnitPrice).HasColumnType("decimal(10, 2)");

            entity.HasOne(d => d.OrderF).WithMany(p => p.OrderDetails)
                .HasForeignKey(d => d.OrderFid)
                .HasConstraintName("FK__OrderDeta__Order__5629CD9C");

            entity.HasOne(d => d.ProductF).WithMany(p => p.OrderDetails)
                .HasForeignKey(d => d.ProductFid)
                .HasConstraintName("FK__OrderDeta__Produ__571DF1D5");
        });

        modelBuilder.Entity<Product>(entity =>
        {
            entity.HasKey(e => e.ProductId).HasName("PK__Products__B40CC6ED112C9E48");

            entity.Property(e => e.ProductId).HasColumnName("ProductID");
            entity.Property(e => e.BrandFid).HasColumnName("BrandFID");
            entity.Property(e => e.CategoryFid).HasColumnName("CategoryFID");
            entity.Property(e => e.Price).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.ProductName).HasMaxLength(255);

            entity.HasOne(d => d.BrandF).WithMany(p => p.Products)
                .HasForeignKey(d => d.BrandFid)
                .HasConstraintName("FK__Products__BrandF__4D94879B");

            entity.HasOne(d => d.CategoryF).WithMany(p => p.Products)
                .HasForeignKey(d => d.CategoryFid)
                .HasConstraintName("FK__Products__Catego__4E88ABD4");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
