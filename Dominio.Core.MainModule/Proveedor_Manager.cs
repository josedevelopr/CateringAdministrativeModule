using Dominio.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Infraestructura.Data.MySql;

namespace Dominio.Core.MainModule
{
    public class Proveedor_Manager
    {
        private Proveedor_DAL objProveedor_DAL = new Proveedor_DAL();

        public List<Proveedor> listar_proveedor()
        {
            return objProveedor_DAL.listar_proveedor();
        }

        public Proveedor ver_proveedor(int codigo)
        {
            return objProveedor_DAL.ver_proveedor(codigo);
        }

        public int registrar_proveedor(Proveedor objProveedor)
        {
            return objProveedor_DAL.registrar_proveedor(objProveedor);
        }

        public int actualizar_proveedor(Proveedor objProveedor)
        {
            return objProveedor_DAL.actualizar_proveedor(objProveedor);
        }
    }
}