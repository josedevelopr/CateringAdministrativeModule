using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Dominio.Core.Entities;
using Dominio.Core.MainModule;

namespace CateringModuloAdministrativo.Controllers
{
    public class LoginController : Controller
    {
        private Usuario_Manager objUsuarioManager = new Usuario_Manager();
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult IniciarSesion()
        {
            return View(new Usuario());
        }
        [HttpPost]
        public ActionResult IniciarSesion(string us_vchar_correo, string us_vchar_password)
        {
            try
            {
                Session["messageUser"] = "";
                Session["errorMessageUser"] = "";
                Usuario objUsuario = objUsuarioManager.log_in_usuario(us_vchar_correo);
                if (objUsuario != null)
                {
                    if (objUsuario.us_vchar_password == us_vchar_password)
                    {
                        Session["userSession"] = objUsuario;
                        return RedirectToAction("Index","Home");
                    }
                    else
                    {
                        Session["errorMessageUser"] = "¡Contraseña incorrecta!";
                        return RedirectToAction("IniciarSesion");
                    }
                }
                else
                {
                    Session["errorMessageUser"] = "EL correo o la contraseña no existen, intente de nuevo";
                }
            }
            catch (Exception e)
            {
                Session["errorMessageUser"] = "Error al iniciar sesion";
                return RedirectToAction("IniciarSesion");
            }
            return View(new Usuario());
        }

        public ActionResult CerrarSesion()
        {
            Session["messageUser"] = "Sesion cerrada, inicie de nuevo su cuenta de nuevo, por favor.";
            return RedirectToAction("IniciarSesion");
            Session.Abandon();
        }

    }
}