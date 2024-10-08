using System;
using System.Collections.Generic;

namespace OnlineStore.Models;

public partial class Product
{
    public int ProductId { get; set; }

    public string? ProductName { get; set; }

    public int? BrandFid { get; set; }

    public int? CategoryFid { get; set; }

    public decimal Price { get; set; }

    public int? StockQuantity { get; set; }

    public int? Rating { get; set; }

    public string? Description { get; set; }

    public string? ProductImage { get; set; }

    public virtual Brand? BrandF { get; set; }

    public virtual Category? CategoryF { get; set; }

    public virtual ICollection<Feedback> Feedbacks { get; set; } = new List<Feedback>();

    public virtual ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();
}
