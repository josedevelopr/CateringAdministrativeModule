using Dominio.Core.Entities;
using Dominio.Core.MainModule;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CateringModuloAdministrativo.Controllers
{
    public class UsuarioController : Controller
    {
        private Usuario_Manager objUsuarioManager = new Usuario_Manager();
        private TipoUsuario_Manager objTipoUsuarioManager = new TipoUsuario_Manager();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult listarUsuario()
        {
            List<Usuario> lstUsuario = new List<Usuario>();
            lstUsuario = objUsuarioManager.lista_usuario();           
            return View(lstUsuario);

        }

        // GET: Usuario/Details/5
        public ActionResult Details(int idUsuario)
        {
            Usuario objUsuario = new Usuario();
            objUsuario = objUsuarioManager.lista_x_id_usuario(idUsuario);
            return View(objUsuario);
        }

        // GET: Usuario/Create
        public ActionResult Create()
        {
            List < TipoUsuario > lstTipoUsuario= objTipoUsuarioManager.lista_TipoUsuario();
            ViewBag.ListaTipoCliente = new SelectList(objTipoUsuarioManager.lista_TipoUsuario(), "tu_int_idtipousu", "tu_vchar_descr"); 

            return View();
        }

        // POST: Usuario/Create
        [HttpPost]
        public ActionResult Create(Usuario objUsuario)
        {
            if(!ModelState.IsValid)
            {
                return View(objUsuario);
            }
            else
            {
                int respuesta = objUsuarioManager.insertar_or_actualizar_usuario(objUsuario,"I");
            }

            return RedirectToAction("listarUsuario");
        }

        // GET: Usuario/Edit/5
        public ActionResult Edit(int idUsuario)
        {
            Usuario objUsuario = new Usuario();
            objUsuario = objUsuarioManager.lista_x_id_usuario(idUsuario);
            return View(objUsuario);
        }

        // POST: Usuario/Edit/5
        [HttpPost]
        public ActionResult Edit(Usuario objUsuario)
        {
            if (!ModelState.IsValid)
            {
                return View(objUsuario);
            }
            else
            {
                int respuesta = objUsuarioManager.insertar_or_actualizar_usuario(objUsuario, "U");
            }

            return RedirectToAction("listarUsuario");
        }

        // GET: Usuario/Delete/5
        public ActionResult Delete(int id)
        {
   
            return View();
        }

        // POST: Usuario/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
