
using System.ComponentModel.DataAnnotations;

namespace WebApplication1.Models
{
    public class Login
    {
        [Key]
        public int id { get; set; }

        public string NombreCompleto { get; set; } = null!;

        public string Usuario{ get; set; } = null!;

        public string Email { get; set; } = null!;
        public string Clave { get; set; } = null!;

    }
}
