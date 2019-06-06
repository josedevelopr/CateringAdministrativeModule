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
        private MenuNavegacion_Manager objMenuNavegacion = new MenuNavegacion_Manager();
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
            List<MenuNavegacion> lstMenuNavegacion = new List<MenuNavegacion>();
            List<string> lstCabMenuNavegacion = new List<string>();
            try
            {
                Session["messageUser"] = "";
                Session["errorMessageUser"] = "";
                Usuario objUsuario = objUsuarioManager.log_in_usuario(us_vchar_correo);
                if (objUsuario != null)
                {
                    if (objUsuario.us_vchar_password == us_vchar_password)
                    {
                        lstMenuNavegacion = objMenuNavegacion.lista_menu_navegacion_usuario(us_vchar_correo);
                        lstCabMenuNavegacion = objMenuNavegacion.lista_menu_navegacion_usuario_cabecera(us_vchar_correo);

                        Session["userSession"] = objUsuario;
                        Session["navigateMenuCabecera"] = lstCabMenuNavegacion;
                        //Session["navigateMenu"] = lstMenuNavegacion;
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
            //Session["messageUser"] = "Sesion cerrada, inicie de nuevo su cuenta de nuevo, por favor.";            
            Session.Abandon();
            return RedirectToAction("IniciarSesion");
            
        }
        public ActionResult evitarSesion()
        {
            //Session["messageUser"] = "No puede acceder de esta forma, debe iniciar sesión";
            Session.Abandon();
            return RedirectToAction("IniciarSesion");
            
        }
        public ActionResult killSession()
        {
            Session.Abandon();
            return RedirectToAction("Index", "Home");
        }

        public List<MenuNavegacion> listarMenuNavegacionLogeado(string correo)
        {
            List<MenuNavegacion> lstMenuNavegacion = new List<MenuNavegacion>();

            try
            {
                lstMenuNavegacion = objMenuNavegacion.lista_menu_navegacion_usuario(correo);
            }
            catch (Exception e)
            {
                lstMenuNavegacion = new List<MenuNavegacion>();
            }

            return lstMenuNavegacion;
        }

        public List<string> listarMenuCabeceraNavegacionLogeado(string correo)
        {
            var lstMenuCabecera = new List<string>();

            try
            {
                lstMenuCabecera = objMenuNavegacion.lista_menu_navegacion_usuario_cabecera(correo);
            }
            catch (Exception e)
            {
                lstMenuCabecera = new List<string>();
            }

            return lstMenuCabecera;
        }
    }
}