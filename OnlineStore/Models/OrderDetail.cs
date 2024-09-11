using System;
using System.Collections.Generic;

namespace OnlineStore.Models;

public partial class OrderDetail
{
    public int OrderDetailId { get; set; }

    public int? OrderFid { get; set; }

    public int? ProductFid { get; set; }

    public int? Quantity { get; set; }

    public decimal? UnitPrice { get; set; }

    public virtual Order? OrderF { get; set; }

    public virtual Product? ProductF { get; set; }
}
