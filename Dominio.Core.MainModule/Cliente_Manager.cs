using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


using Dominio.Core.Entities;
using Infraestructura.Data.MySql;


namespace Dominio.Core.MainModule
{
    public class Cliente_Manager
    {
        private Cliente_DAL objCliente_DAL = new Cliente_DAL();

        public List<Cliente> lista_cliente()
        {
            return objCliente_DAL.lista_cliente();
        }

        public Cliente ver_cliente(string cod)
        {
            return objCliente_DAL.ver_cliente(cod);
        }

        public int registrar_cliente(Cliente objCliente)
        {
            return objCliente_DAL.registrar_cliente(objCliente);
        }

        public int actualizar_cliente(Cliente objCliente)
        {
            return objCliente_DAL.actualizar_cliente(objCliente);
        }


    }
}
