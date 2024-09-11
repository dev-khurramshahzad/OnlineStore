using System;
using System.Collections.Generic;

namespace OnlineStore.Models;

public partial class Feedback
{
    public int FeedbackId { get; set; }

    public int? CustomerFid { get; set; }

    public int? ProductFid { get; set; }

    public DateTime? FeedbackDate { get; set; }

    public int? Rating { get; set; }

    public string? Comments { get; set; }

    public virtual Customer? CustomerF { get; set; }

    public virtual Product? ProductF { get; set; }
}
