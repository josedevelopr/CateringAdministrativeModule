using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Configuration;
using System.ComponentModel.DataAnnotations;

namespace Dominio.Core.Entities
{
    public class MenuNavegacion
    {
        
        public int am_int_idarchivo { get; set; }        
        public string am_vchar_descr { get; set; }
        public string am_vchar_cntrl { get; set; }
        public string am_vchar_nombr { get; set; }
        public string tu_vchar_descr { get; set; }



    }
}
