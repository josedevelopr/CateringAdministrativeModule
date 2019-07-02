using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Core.Entities
{
    public class Alimento
    {

        [Display(Name = "Codigo alimento", Order = 0)]
        public int al_int_idalim { get; set; }

        [Display(Name = "Descripción", Order = 4)]
        [StringLength(int.MaxValue, MinimumLength = 10)]
        public string al_vchar_descr { get; set; }

        public string al_int_idtipoalim { get; set; }
        [Display(Name = "Precio del alimento", Order = 4)]
        [Required(ErrorMessage = "El precio del insumo es necesario")]
        public decimal al_dec_precalim { get; set; }
        [Display(Name = "Estado del alimento", Order = 3)]
        public int al_int_estado { get; set; }

    }
}
