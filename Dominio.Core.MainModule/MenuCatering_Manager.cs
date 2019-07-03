using Dominio.Core.Entities;
using Infraestructura.Data.MySql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Core.MainModule
{
    public class MenuCatering_Manager
    {
        private MenuCatering_DAL objMenuCateringDAL = new MenuCatering_DAL();

        public List<MenuCatering> listamenucatering()
        {
            return objMenuCateringDAL.listamenucatering();
        }

        public MenuCatering lista_x_id_menucatering(int id)
        {
            return objMenuCateringDAL.lista_x_id_menucatering(id);
        }

        public MenuCatering lista_x_idcate_menucatering(int id)
        {
            return objMenuCateringDAL.lista_x_idcate_menucatering(id);
        }

        public int insertar_or_actualizar_menucatering(MenuCatering objMenuCatering, string action)
        {
            return objMenuCateringDAL.insertar_or_actualizar_menucatering(objMenuCatering,action);
        }
    }
}
