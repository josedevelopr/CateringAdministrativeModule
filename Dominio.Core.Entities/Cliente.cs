using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Configuration;
using System.ComponentModel.DataAnnotations;

namespace Dominio.Core.Entities
{

    public class Cliente    {
        
        [Required]
        public string cl_char_dniclie { get; set; }
        public int cl_int_idusu { get; set; }
        [Required]
        public string cl_vchar_nombre { get; set; }
        [Required]
        public string cl_vchar_apellido { get; set; }
        [Required]
        public string cl_char_sexo { get; set; }
        [Required]
        public string cl_char_ruc { get; set; }
        [Required]
        public string cl_char_fono { get; set; }
        [Required]
        public string cl_vchar_direc { get; set; }
        [Required]
        public string cl_vchar_foto { get; set; }
        [Required]
        public string cl_vchar_correo { get; set; }
    }
}
