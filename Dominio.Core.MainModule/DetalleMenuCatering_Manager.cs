using Dominio.Core.Entities;
using Infraestructura.Data.MySql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Core.MainModule
{
    public class DetalleMenuCatering_Manager
    {
        private DetalleMenuCatering_DAL objDetalleMenuCatering_DAL = new DetalleMenuCatering_DAL();

        public List<DetalleMenuCatering> listaDetalleMenuCatering_x_idmenu(int id_men)
        {
            return objDetalleMenuCatering_DAL.listaDetalleMenuCatering_x_idmenu(id_men);
        }

        public List<DetalleMenuCatering> listaDetalleMenuCatering()
        {
            return objDetalleMenuCatering_DAL.listaDetalleMenuCatering();
        }

        public DetalleMenuCatering listaDetalleMenuCatering_x_id(int id_deta)
        {
            return objDetalleMenuCatering_DAL.listaDetalleMenuCatering_x_id(id_deta);
        }

        public int insertar_or_actualizar_menucatering(DetalleMenuCatering objDetalleMenuCatering, string action)
        {
            return objDetalleMenuCatering_DAL.insertar_or_actualizar_menucatering(objDetalleMenuCatering,action);
        }
        public int eliminar_menuDetalleCatering(int idMenuDetalleCatering)
        {
            return objDetalleMenuCatering_DAL.eliminar_menuDetalleCatering(idMenuDetalleCatering);
        }
    }
}
