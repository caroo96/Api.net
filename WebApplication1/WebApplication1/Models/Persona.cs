using System.ComponentModel.DataAnnotations;

namespace WebApplication1.Models
{
    public class Persona
    {
        [Key]
        public int Id { get; set; }


        [Required(ErrorMessage = "El nombre es obligatorio")]
        public string Nombre { get; set; } = null!;

        [Required(ErrorMessage = "El apellido es obligatorio")]
        public string Apellidos { get; set; } = null!;                                                         

        [EmailAddress(ErrorMessage = "El correo electrónico no es válido")]               
        public string Email { get; set; } = null!;

        public string Celular { get; set; } = null!;

        public int Edad { get; set; }

        public ICollection<Cita> Citas { get; set; } = null!;


    }
}
