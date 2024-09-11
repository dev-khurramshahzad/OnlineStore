using System;
using System.Collections.Generic;

namespace OnlineStore.Models;

public partial class Admin
{
    public int AdminId { get; set; }

    public string? Username { get; set; }

    public string? Passwor { get; set; }

    public string? Email { get; set; }

    public string? Status { get; set; }

    public string? Role { get; set; }
}
