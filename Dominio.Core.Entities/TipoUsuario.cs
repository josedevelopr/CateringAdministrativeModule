using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Core.Entities
{
    public class TipoUsuario
    {

        [Display(Name = "Codigo Tipo Usuario", Order = 0)]
        public int tu_int_idtipousu { get; set; }
        [Required]
        [Display(Name ="Tipo Usuario", Order =1)]
        public string tu_vchar_descr { get; set; }
        [Required]
        [Display(Name = "Tipo Usuario", Order = 2)]
        public string tu_char_estado { get; set; }
    }
}
