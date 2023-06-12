using Microsoft.EntityFrameworkCore;
using WebApplication1.Models;

namespace WebApplication1.dbcontext
{
    public class MyDbContext : DbContext
    {
        public MyDbContext(DbContextOptions<MyDbContext> options)
       : base(options)
        {

        }
        public DbSet<Login> login { get; set; }  //contextos de los modelos para la base de datos 
        public DbSet<Persona> persona { get; set; }
        public DbSet<Cita> Citas { get; set; }
        public DbSet<MotivoCita> MotivosCita { get; set; }
        public DbSet<CitaMotivoCita> CitaMotivosCita { get; set; }

        //protected override void OnModelCreating(ModelBuilder modelBuilder)
        //{
        //    modelBuilder.Entity<Cita>()
        //        .HasMany(c => c.MotivosCita)
        //        .WithMany(m => m.Citas)                           //una consulta linq para hacer una relacion de muchos a muchos entre tablas o modelos
        //        .UsingEntity(j => j.ToTable("CitaMotivoCita"));
        //}
    }
}



