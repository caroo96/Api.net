using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebApplication1.Models
{
    public class Cita
    {
        [Key]
        public int IdCita { get; set; }

        [Required(ErrorMessage = "El nombre es obligatorio")]
        public string Nombre { get; set; } = null!;

        [Required(ErrorMessage = "La fecha de la cita es obligatoria")]
        [Display(Name = "Fecha de la cita")]
        [DataType(DataType.Date)]                                                 //atributos con data annotation o fluent para
        public DateTime FechaCita { get; set; }     

        [Required(ErrorMessage = "La persona es obligatoria")]
        public int PersonaId { get; set; }

        [ForeignKey("PersonaId")]
        public Persona Persona { get; set; } = null!;

        public ICollection<MotivoCita> MotivosCita { get; set; } = null!;

        public virtual ICollection<CitaMotivoCita> CitaMotivocita { get; } = new List<CitaMotivoCita>();

        
    }
}
