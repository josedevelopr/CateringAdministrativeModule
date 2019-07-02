using Dominio.Core.Entities;
using Infraestructura.Data.MySql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Core.MainModule
{
    public class Catering_Manager
    {
        private Catering_DAL objCatering_DAL = new Catering_DAL();

        public List<Catering> listar_catering()
        {
            return objCatering_DAL.listar_catering();
        }

        public Catering lista_x_id_catering(int id)
        {
            return objCatering_DAL.lista_x_id_catering(id);
        }

        public int insertar_or_actualizar_trabajador(Trabajador objTrabajador, string action)
        {
            return objCatering_DAL.insertar_or_actualizar_trabajador(objTrabajador, action);
        }
    }
}
