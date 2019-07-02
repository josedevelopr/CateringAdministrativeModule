using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;


namespace Dominio.Core.Entities
{
    public class Tipo_Alimento
    {

        [Display(Name = "Codigo del pais", Order = 0)]
        public int ta_int_idtipoalim { get; set; }
        [Display(Name = "Descripcion del pais", Order = 0)]
        public string ta_vchar_descr { get; set; }
        [Display(Name = "estado del pais", Order = 0)]
        public int ta_int_est { get; set; }

    }
}
