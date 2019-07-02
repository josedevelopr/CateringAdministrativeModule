using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Core.Entities
{
    public class Catering
    {
        [Display(Name="Id catering",Order=0)]
        public int ca_int_idcater { get; set; }
        [Display(Name = "Fecha catering", Order = 1)]
        public string ca_date_fecha { get; set; }
        [Display(Name = "Estado", Order = 2)]
        public string ca_char_estado { get; set; }
        [Display(Name = "Lugar", Order = 3)]
        public string ca_vchar_lugarcater { get; set; }
        [Display(Name = "DNI cliente", Order = 4)]
        public string ca_char_dniclie { get; set; }
        [Display(Name = "Cliente", Order = 5)]
        public string ca_char_nomclie { get; set; }
        [Display(Name = "Id Encargado", Order = 6)]
        public int ca_int_idtrab { get; set; }
        [Display(Name = "Encargado", Order = 7)]
        public string ca_vchar_encargadonom { get; set; }
    }
}
