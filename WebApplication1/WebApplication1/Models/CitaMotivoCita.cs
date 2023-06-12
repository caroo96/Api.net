using System.ComponentModel.DataAnnotations;

namespace WebApplication1.Models
{
    public class CitaMotivoCita
    {
        [Key]
        public int Id { get; set; }

        public int CitaId { get; set; }

        public int MotivocitaId { get; set; }

        public virtual Cita CitaIdNavigation { get; set; } = null!;

        public virtual MotivoCita MotivocitaIdNavigation { get; set; } = null!;

    }
}
