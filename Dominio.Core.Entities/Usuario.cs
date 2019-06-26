using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Configuration;
using System.ComponentModel.DataAnnotations;

namespace Dominio.Core.Entities
{
    public class Usuario
    {
        [Display(Name = "Codigo del usuario", Order = 0)]
        public int us_int_idusu { get; set; }
        [Display(Name = "Id Tipo del usuario", Order = 1)]        
        [Required]
        public int us_int_idtipousu { get; set; }
        [Display(Name = "Tipo del usuario", Order = 2)]
        public string us_int_nomtipousu { get; set; }
        [Required]
        [Display(Name = "Correo del usuario", Order = 3)]
        [EmailAddress]
        public string us_vchar_correo { get; set; }
        [Required]
        [Display(Name = "Contraseña del usuario", Order = 4)]
        [RegularExpression(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8}$",
         ErrorMessage = 
        "La contraseña debe tener al menos 8 caracteres, tener un numero, una mayuscula y al menos un caracter especial")]
        public string us_vchar_password { get; set; }
        [Required]
        [Display(Name = "Foto de usuario", Order = 5)]
        public string us_vchar_foto { get; set; }
        [Required]
        [Display(Name = "Nombre del usuario", Order = 6)]
        public string us_vchar_nomusu { get; set; }
    }
}
