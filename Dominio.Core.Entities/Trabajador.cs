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
     
        [Display(Name ="Id Trabajador", Order = 0)]        
        public int tr_int_idtrab { get; set; }
        [Display(Name = "Id Usuario", Order = 1)]
        [Required]        
        public int tr_int_idusu { get; set; }
        [Display(Name = "Id Tipo Trabajador", Order = 2)]
        public int tr_int_idtipotrab { get; set; }
        [Display(Name = "Nombre", Order = 3)]
        [Required]
        public string tr_vchar_nombre { get; set; }
        [Display(Name = "Apellido", Order = 4)]
        [Required]
        public string tr_vchar_apellido { get; set; }
        [Required]
        [Display(Name = "DNI", Order = 5)]
        public string tr_char_dni { get; set; }
        [Required]
        [Display(Name = "Direccion", Order = 5)]
        public string tr_vchar_direc { get; set; }
        [Required]
        [Display(Name = "Foto", Order = 6)]
        public string tr_vchar_foto { get; set; }
        [Display(Name = "Correo", Order = 7)]
        [Required]
        public string tr_vchar_correo { get; set; }
        [Display(Name = "Tipo trabajador", Order = 8)]
        public string tt_vchar_descr { get; set; }
        [Display(Name = "Nombre usuario", Order = 9)]
        public string us_vchar_nomusu { get; set; }
    }
}
