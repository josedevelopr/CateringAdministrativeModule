using Dominio.Core.Entities;
using Infraestructura.Data.MySql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Core.MainModule
{
    public class Cliente_Manager
    {
        private Cliente_DAL objCliente_DAL = new Cliente_DAL();

        public List<Cliente> listar_cliente()
        {
            return objCliente_DAL.listar_cliente();
        }

        public Cliente lista_x_id_cliente(int id)
        {
            return objCliente_DAL.lista_x_id_cliente(id);
        }
           
        public int insertar_or_actualizar_cliente(Cliente objCliente, string action)
        {
            return objCliente_DAL.insertar_or_actualizar_cliente(objCliente,action);
        }
    }
}
