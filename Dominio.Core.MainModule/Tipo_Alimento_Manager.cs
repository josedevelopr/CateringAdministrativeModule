using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Dominio.Core.Entities;
using Infraestructura.Data.MySql;

namespace Dominio.Core.MainModule
{
    public class Tipo_Alimento_Manager
    {

        private Tipo_Alimento_DAL objTipoAlimento_DAL = new Tipo_Alimento_DAL();
       

        public List<Tipo_Alimento> listar_TipoAlimento()
        {
            return objTipoAlimento_DAL.lista_tipoalimento();
        }

        public Tipo_Alimento ver_TipoAlimento(int cod)
        {
            return objTipoAlimento_DAL.ver_TipoAlimento(cod);
        }

        public int registrar_TipoAlimento(Tipo_Alimento objTipoAlimento)
        {
            return objTipoAlimento_DAL.registrar_TipoAlimento(objTipoAlimento);
        }

        public int actualizar_Tipoalimento(Tipo_Alimento objTipoAlimento)
        {
            return objTipoAlimento_DAL.actualizar_Tipoalimento(objTipoAlimento);
        }
    }



}
}
