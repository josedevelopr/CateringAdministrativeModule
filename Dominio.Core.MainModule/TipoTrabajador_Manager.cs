using Dominio.Core.Entities;
using Infraestructura.Data.MySql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Core.MainModule
{
    public class TipoTrabajador_Manager
    {
        private TipoTrabajador_DAL objTrabajador_DAL = new TipoTrabajador_DAL();
        public List<TipoTrabajador> lista_TipoTrabajador()
        {
            return objTrabajador_DAL.lista_TipoTrabajador();
        }   
        public TipoTrabajador TipoTrabajador_x_id(int id)
        {
            return objTrabajador_DAL.TipoTrabajador_x_id(id);
        }

    }
}
