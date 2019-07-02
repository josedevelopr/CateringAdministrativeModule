using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Configuration;
using System.ComponentModel.DataAnnotations;

namespace Dominio.Core.Entities
{
    public class Insumos
    {

        [Display(Name = "Codigo del insumo", Order = 0)]
        public int in_int_idinsum { get; set; }
        [Display(Name = "Descripcion", Order = 1)]
        [Required(ErrorMessage = "La descripcion es necesaria")]
        public string in_vchar_descr { get; set; }
        [Display(Name = "Stock", Order = 2)]        
        [Required(ErrorMessage = "El stock del insumo es necesario")]
        [RegularExpression(@"^\d+$", ErrorMessage = "El stock solo admite numeros")]
        public int in_int_stock { get; set; }
        [Display(Name = "Stock minimo", Order = 3)]
        [Required(ErrorMessage = "El stock minimo es necesario")]
        [RegularExpression(@"^\d+$", ErrorMessage = "El stock minimo solo admite numeros")]
        public int in_int_minstock { get; set; }
        [Display(Name = "Precio del insumo", Order = 4)]
        [Required(ErrorMessage = "El precio del insumo es necesario")]
        //[RegularExpression(@"^\d{1,3}(\.\d{3})*(,\d+)?$/", ErrorMessage = "El precio debe ser valor numerico")]
        public double in_dec_precio { get; set; }
    }
}
