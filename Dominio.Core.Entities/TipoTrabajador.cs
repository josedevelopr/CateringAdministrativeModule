using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Core.Entities
{
    public class TipoTrabajador
    {
        [Display(Name="Id Tipo Trabajador",Order=0)]
        public int tt_int_idtipotrab { get; set; }
        [Display(Name = "Descripcion Tipo Trabajador", Order = 1)]
        [Required]
        public string tt_vchar_descr { get; set; }
    }
}
