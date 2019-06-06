using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Configuration;
using System.ComponentModel.DataAnnotations;


namespace Dominio.Core.Entities
{
    public class Proveedor
    {
        [Display(Name = "Codigo del proveedor", Order = 0)]
        public int pr_int_idprove { get; set; }
        [Display(Name = "Nombre de proveedor", Order = 1)]
        [Required(ErrorMessage = "El nombre del proveedor es necesario")]
        [StringLength(int.MaxValue, MinimumLength = 10)]
        public string pr_vchar_nomprove { get; set; }
        [Display(Name = "RUC proveedor", Order = 2)]
        [Required(ErrorMessage = "El RUC es necesario")]
        [RegularExpression(@"^(?:.*[0-9]){11}$", ErrorMessage = "El RUC tiene 11 caracteres")]
        public string pr_char_ruc { get; set; }
        [Display(Name = "Estado de proveedor", Order = 3)]        
        public int pr_int_estado { get; set; }
    }
}
