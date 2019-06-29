using Dominio.Core.Entities;
using Infraestructura.Data.MySql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Core.MainModule
{
    public class Trabajador_Manager
    {
        private Trabajador_DAL objTrabajador_DAL = new Trabajador_DAL();

        public List<Trabajador> listar_trabajador()
        {
            return objTrabajador_DAL.listar_trabajador();
        }

        public Trabajador lista_x_id_trabajador(int id)
        {
            return objTrabajador_DAL.lista_x_id_trabajador(id);
        }

        public int insertar_or_actualizar_trabajador(Trabajador objTrabajador, string action)
        {
            return objTrabajador_DAL.insertar_or_actualizar_trabajador(objTrabajador, action);
        }
    }
   
}
