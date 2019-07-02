using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Dominio.Core.Entities
{
    public class Alimento
    {


        [Display(Name = "Codigo del alimento", Order = 0)]
        public int al_int_idalim { get; set; }


        [StringLength(100, ErrorMessage = "Descripcion maxima hasta 100 caracteres.", MinimumLength = 6)]
        [Display(Name = "Descripcion del alimento", Order = 0)]
        public string  al_vchar_descr { get; set; }
        [Display(Name = "Tipo pais ID", Order = 0)]
        public int al_int_idtipoalim { get; set; }
        [Display(Name = "Precio Alimento", Order = 0)]
        public decimal al_dec_precalim { get; set; }

        [Display(Name = "Estado", Order = 0)]
        public int al_int_est { get; set; } 
        

        

    }
}
