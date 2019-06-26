using Dominio.Core.Entities;
using Infraestructura.Data.MySql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Core.MainModule
{
    public class TipoUsuario_Manager
    {
        private TipoUsuario_DAL objTipoUsuario_DAL = new TipoUsuario_DAL();

        public List<TipoUsuario> lista_TipoUsuario()
        {
            return objTipoUsuario_DAL.lista_TipoUsuario();
        }

        public TipoUsuario TipoUsuario_x_id(int id)
        {
            return objTipoUsuario_DAL.TipoUsuario_x_id(id);
        }

        public int insertar_or_actualizar_TipoUsuario(TipoUsuario obTipoUsuario, string x_action)
        {
            return objTipoUsuario_DAL.insertar_or_actualizar_TipoUsuario(obTipoUsuario, x_action);
        }
    }
}
