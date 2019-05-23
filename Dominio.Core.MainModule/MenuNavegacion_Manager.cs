using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Dominio.Core.Entities;
using Infraestructura.Data.MySql;


namespace Dominio.Core.MainModule
{    
    public class MenuNavegacion_Manager
    {
        private MenuNavegacion_DAL objMenuNav_DAL = new MenuNavegacion_DAL();

        public List<MenuNavegacion> lista_menu_navegacion_usuario(string correo)
        {
            return objMenuNav_DAL.lista_menu_navegacion_usuario(correo);
        }
    }
}
