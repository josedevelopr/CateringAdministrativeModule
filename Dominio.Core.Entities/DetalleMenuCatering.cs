using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Core.Entities
{
    public class DetalleMenuCatering
    {
        [Display(Name="Id Detalle",Order=0)]
        public int dm_int_iddetmenucater { get; set; }
        [Display(Name = "Id Menu", Order = 1)]
        [Required]
        public int dm_int_idmenu { get; set; }
        [Display(Name = "Id Alimento", Order = 2)]
        [Required]
        public int dm_int_idalim { get; set; }
        [Display(Name = "Cantidad", Order = 3)]
        [Required]
        public int dm_int_cantmenu { get; set; }
        [Display(Name = "Subtotal", Order = 4)]
        [Required]
        public double dm_dec_subto { get; set; }
        [Display(Name = "Alimento", Order = 0)]        
        public string al_vchar_descr { get; set; }
    }
}
