using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


using System.Configuration;
using System.ComponentModel.DataAnnotations;

namespace Dominio.Core.Entities
{
    public class Trabajador
    {
     
        
        public int idttr_int_idtrabrab { get; set; }
        [Required]
        public int tr_int_idtipotrab { get; set; }
        [Required]
        public string tr_vchar_nombre { get; set; }
        [Required]
        public string tr_vchar_apellido { get; set; }
        [Required]
        public string tr_char_dni { get; set; }
        [Required]
        public string tr_vchar_direc { get; set; }
        [Required]
        public string tr_vchar_foto { get; set; }
    }
}
