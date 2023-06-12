using System.ComponentModel.DataAnnotations;

namespace WebApplication1.Models
{
    public class MotivoCita
    {
        [Key]
        public int IdMotivoCita { get; set; }

        [Required(ErrorMessage = "El nombre del motivo es obligatorio")]
        public string Nombre { get; set; } = null!;                                     //atributos con data annotation o fluent para

        public string Descripcion { get; set; } = null!;                              //dar caracteristicas o propiedades para mandar al contexto de la db

        public ICollection<Cita> Citas { get; set; } = null!;
        public virtual ICollection<CitaMotivoCita> CitaMotivocita { get; } = new List<CitaMotivoCita>();
    }
}
