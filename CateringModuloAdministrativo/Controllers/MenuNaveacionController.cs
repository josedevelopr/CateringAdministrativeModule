    using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Dominio.Core.Entities;
using Dominio.Core.MainModule;


namespace CateringModuloAdministrativo.Controllers
{
    public class MenuNaveacionController : Controller
    {
        private MenuNavegacion_Manager objMenuNavegacion = new MenuNavegacion_Manager();
        // GET: MenuNaveacion
        public ActionResult Index()
        {
            return View();
        }

        public List<MenuNavegacion> listarMenuNavegacion(string correo)
        {
            List<MenuNavegacion> lstMenuNavegacion = new List<MenuNavegacion>();

            try
            {
                lstMenuNavegacion = objMenuNavegacion.lista_menu_navegacion_usuario(correo);                
            }
            catch(Exception e)
            {
                lstMenuNavegacion = new List<MenuNavegacion>();
            }

            return lstMenuNavegacion;
        }
           
    }
}