using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Dominio.Core.Entities;
using Infraestructura.Data.MySql;

namespace Dominio.Core.MainModule
{
    public class Catering_Manager
    {
        private Catering_DAL objCatering_DAL = new Catering_DAL();

        public List<Catering> lista_catering()
        {
            return objCatering_DAL.lista_catering();
        }

        public Catering ver_catering(int cod)
        {
            return objCatering_DAL.ver_catering(cod);
        }

        public int registrar_catering(Catering objCatering)
        {
            return objCatering_DAL.registrar_catering(objCatering);
        }

        public int actualizar_catering(Catering objCatering)
        {
            return objCatering_DAL.actualizar_catering(objCatering);
        }


    }
}
