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
        public int us_int_idtipousu { get; set; }

        [Display(Name = "Correo del usuario", Order = 2)]
        public string us_vchar_correo { get; set; }
        [Display(Name = "Contraseña del usuario", Order = 3)]
        public string us_vchar_password { get; set; }
        [Display(Name = "Foto de usuario", Order = 4)]
        public string us_vchar_foto { get; set; }
        [Display(Name = "Nombre del usuario", Order = 5)]
        public string us_vchar_nomusu { get; set; }
    }
}
