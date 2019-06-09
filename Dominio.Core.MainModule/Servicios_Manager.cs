using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Dominio.Core.Entities;
using Infraestructura.Data.MySql;

namespace Dominio.Core.MainModule
{
    public class Servicios_Manager
    {
        private Servicios_DAL objServicios_DAL = new Servicios_DAL();

        public List<Servicios> lista_Servicios()
        {
            return objServicios_DAL.lista_Servicios();
        }

        public Servicios ver_servicios(int cod)
        {
            return objServicios_DAL.ver_servicios(cod);
        }

        public int registrar_servicios(Servicios objServicios) {

            return objServicios_DAL.registrar_servicios(objServicios);

        }

        public int actualizar_servicios(Servicios objServicios)
        {
            return objServicios_DAL.actualizar_servicios(objServicios);
        }


    }
}
