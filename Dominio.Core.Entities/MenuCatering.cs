using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Core.Entities
{
    public class MenuCatering
    {
        [Display(Name="Id Menu Catering",Order=0)]
        public int mc_int_idmenu { get; set; }
        [Display(Name = "Id Catering", Order = 2)]
        public int mc_int_idcater { get; set; }
        [Display(Name = "Estado", Order = 3)]
        public string mc_char_estado { get; set; }
        [Display(Name = "Precio total menu", Order = 4)]
        public double mc_dec_prectotalmenu { get; set; }
    }
}
