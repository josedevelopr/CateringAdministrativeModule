using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio.Core.Entities;
using Infraestructura.Data.MySql;

namespace Dominio.Core.MainModule
{
    public class Insumo_Manager
    {
        private Insumo_DAL objInsumo_DAL = new Insumo_DAL();

        public List<Insumos> listar_insumo()
        {
            return objInsumo_DAL.listar_insumo();
        }

        public Insumos ver_insumo(int codigo)
        {
            return objInsumo_DAL.ver_insumo(codigo);
        }

        public int registrar_insumo(Insumos objInsumo)
        {
            return objInsumo_DAL.registrar_insumo(objInsumo);
        }

        public int actualizar_insumo(Insumos objInsumo)
        {
            return objInsumo_DAL.actualizar_insumo(objInsumo);
        }
    }

}

