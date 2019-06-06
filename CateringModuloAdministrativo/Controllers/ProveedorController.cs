using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Dominio.Core.Entities;
using Dominio.Core.MainModule;

namespace CateringModuloAdministrativo.Controllers
{
    public class ProveedorController : Controller
    {
        private Proveedor_Manager objProveedorManager = new Proveedor_Manager();        
        // GET: Proveedor
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult listarProveedor()
        {
            List<Proveedor> lstProveedor = new List<Proveedor>();

            try
            {
                lstProveedor = objProveedorManager.listar_proveedor();
            }
            catch(Exception e)
            {
                Console.WriteLine("Exception source", e.Source);
                lstProveedor = new List<Proveedor>();
            }            

            return View(lstProveedor);

        }

        public ActionResult agregarProveedor()
        {
            return View(new Proveedor());
        }
        [HttpPost]
        public ActionResult agregarProveedor(Proveedor objProovedor)
        {
            if (!ModelState.IsValid)            
            {
                return View(objProovedor);               
            }
            else
            {
                int respuesta = objProveedorManager.registrar_proveedor(objProovedor);
                if(respuesta == 1)
                {
                    ViewBag.mensaje= "PROVEEDOR GUARDADO";
                }
                return RedirectToAction("listarProveedor");
            }            
        }

        public ActionResult verProveedor(int idProveedor)
        {
            Proveedor objProveedor = new Proveedor();
            objProveedor = objProveedorManager.ver_proveedor(idProveedor);
            return View(objProveedor);
        }

        public ActionResult editarProveedor(int idProveedor)
        {
            Proveedor objProveedor = new Proveedor();
            objProveedor = objProveedorManager.ver_proveedor(idProveedor);
            return View(objProveedor);
        }
        [HttpPost]
        public ActionResult editarProveedor(Proveedor objProovedor)
        {
            if (!ModelState.IsValid)
            {
                return View(objProovedor);
            }
            else
            {
                int respuesta = objProveedorManager.actualizar_proveedor(objProovedor);
                if (respuesta == 1)
                {
                    ViewBag.mensaje = "PROVEEDOR ACTUALIZADO";
                }
                return RedirectToAction("listarProveedor");
            }
        }
        public ActionResult anularProveedor(int idProveedor)
        {
            Proveedor objProveedor = new Proveedor();
            objProveedor = objProveedorManager.ver_proveedor(idProveedor);
            return View(new Proveedor());
        }
    }
}