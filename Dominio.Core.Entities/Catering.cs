using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Core.Entities
{
    public class Catering
    {
  
        public int ca_int_idcatering { get; set; }
        public string ca_date_fecha { get; set; }
        public string ca_char_estado { get; set; }
        public string ca_varchar_lugarcatering { get; set; }
        public string ca_char_dnicliente { get; set; }
    }
}
