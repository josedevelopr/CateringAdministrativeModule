using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.ComponentModel.DataAnnotations;

namespace Dominio.Core.Entities
{
   public  class IngredienteDetalleAlimento
    {
        [Display(Name = "Codigo del ingrediente del alimento", Order = 0)]
        public int is_int_idingralim { get; set; }
      
        [Display(Name = "Codigo del Alimento", Order = 0)]
        public int is_int_idalim { get; set; }

        [Display(Name = "Fecha de creación", Order = 0)]
        public DateTime is_date_feccrea { get; set; }
        [Display(Name = "Codigo del detalle Alimento", Order = 0)]
        public int dta_int_iddetingrealim { get; set; }
        [Display(Name = "Codigo del Insumo", Order = 0)]
        public int dta_int_idinsum { get; set; }
        [Display(Name = "Cantidad", Order = 0)]
        public int dta_int_cantidad { get; set; }

    }
}
