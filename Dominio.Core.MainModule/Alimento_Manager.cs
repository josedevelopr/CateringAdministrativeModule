using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Dominio.Core.Entities;
using Infraestructura.Data.MySql;


namespace Dominio.Core.MainModule
{
    public class Alimento_Manager
    {
        private Alimento_DAL objAlimento_DAL = new Alimento_DAL();

        public List<Alimento> lista_Alimento()
        {
            return objAlimento_DAL.lista_alimento();
        }

        public Alimento ver_Alimento(int cod)
        {
            return objAlimento_DAL.ver_alimento(cod);
        }

        public int registrar_Alimento(Alimento objAlimento)
        {
            return objAlimento_DAL.registrar_alimento(objAlimento);
        }

        public int actualizar_Alimento(Alimento objAlimento)
        {
            return objAlimento_DAL.actualizar_alimento(objAlimento);
        }





    }
}
