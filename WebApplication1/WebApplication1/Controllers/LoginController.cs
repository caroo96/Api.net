using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.Data;
using System.Data.SqlClient;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Text.Json.Serialization;
using System.Text.Json;
using WebApplication1.dbcontext;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly MyDbContext _context;    
        private readonly IConfiguration _config;
        public LoginController(MyDbContext context, IConfiguration config)  //i de dependencias
        {
            _context = context;   //variables globales igualadas a los parametros
            _config = config;       
        }

        [AllowAnonymous]
        [HttpPost("login")]
        public IActionResult Login(Login userLogin)
        {
            var user = Authenticate(userLogin);  // vamos a igualar la variable con el resultado del metodo aut con los parametros enviados

            if (user != null)
            {
                // Crear el token

                var token = Generate(user);   // vamos a igualar la variable con el resultado del metodo gener con los parametros enviados

                return Ok(token);
            }

            return NotFound("Usuario no encontrado");
        }


        //Endpoint para consultar las personas con las citas
        [Authorize]
        [HttpGet("Personas")]
        public ActionResult<List<Persona>> Get()
        {
            List<Persona> personas = _context.persona.Include(p => p.Citas).ToList();

            if (personas.Count > 0)
            {
                var options = new JsonSerializerOptions
                {
                    ReferenceHandler = ReferenceHandler.Preserve,
                    WriteIndented = true
                };

                return Ok(JsonSerializer.Serialize(personas, options));
            }
            else
            {
                return NotFound();
            }
        }


        //Endpoint para consultar por id
        [Authorize]
        [HttpGet("Personas/{id}")]
        public ActionResult<Persona> GetById(int id)
        {
            var personas = _context.persona.Include(p => p.Citas).SingleOrDefault(p => p.Id == id);

            if (personas != null)
            {
                var options = new JsonSerializerOptions
                {
                    ReferenceHandler = ReferenceHandler.Preserve,
                    WriteIndented = true
                };

                return Ok(JsonSerializer.Serialize(personas, options));
            }
            else
            {
                return NotFound();
            }
        }


        //Endpoint para consultar por fecha 
        [Authorize]
        [HttpGet("citas/{fecha}")]
        public ActionResult<List<Cita>> GetCitasByFecha(DateTime fecha)
        {
            var citas = _context.Citas
                .Include(c => c.MotivosCita)
                .Where(c => c.FechaCita.Date == fecha.Date)
                .ToList();

            if (citas == null || citas.Count == 0)
            {
               
                return NotFound("No se encontraron citas para la fecha dada.");
            }
            else
            {
                var options = new JsonSerializerOptions
                {
                    ReferenceHandler = ReferenceHandler.Preserve,
                    WriteIndented = true
                };
                return Ok(JsonSerializer.Serialize(citas, options));
            }

                   
        }

        private Login Authenticate(Login dto)
        {
            var currentUser = _context.login.FirstOrDefault(u => u.Email == dto.Email && u.Clave == dto.Clave);

            if (currentUser != null)
            {
                return currentUser;
            }

            return null;
        }

        private string Generate(Login user)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            //// Crear los claims son los datos que va encriptados en el token
            var claims = new[]
            {
                new Claim(ClaimTypes.NameIdentifier, user.NombreCompleto),
                new Claim(ClaimTypes.Email, user.Email),
                new Claim(ClaimTypes.GivenName, user.Usuario),
                
            };

            // Crear el token

            var token = new JwtSecurityToken(
                _config["Jwt:Issuer"],
                _config["Jwt:Audience"],   // toda la configuracion del token
                claims,
                expires: DateTime.Now.AddMinutes(60),
                signingCredentials: credentials);


            return new JwtSecurityTokenHandler().WriteToken(token);
        }

                 


        [HttpPost]
        public ActionResult<Persona> Create([FromBody] Persona persona)
        {
            _context.persona.Add(persona);
            _context.SaveChanges();

            return  Ok(persona);
        }



    }
}

