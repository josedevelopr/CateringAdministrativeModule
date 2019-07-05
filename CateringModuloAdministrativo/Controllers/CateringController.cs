using Dominio.Core.Entities;
using Dominio.Core.MainModule;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CateringModuloAdministrativo.Controllers
{
    public class CateringController : Controller
    {
        private Catering_Manager objCateringManager = new Catering_Manager();
        private DetalleMenuCatering_Manager objDetalleMenuCatering = new DetalleMenuCatering_Manager();
        private MenuCatering_Manager objMenuCateringManager = new MenuCatering_Manager();
        private Cliente_Manager objClienteManager = new Cliente_Manager();
        private Trabajador_Manager objTrabajadorManager = new Trabajador_Manager();

        // GET: Catering
        public ActionResult Index()
        {
            return View();
        }

        // GET: Catering/Create
        public ActionResult Create()
        {
            List<Trabajador> lstTrabajador = new List<Trabajador>();
            lstTrabajador = objTrabajadorManager.listar_trabajador();
            ViewBag.ListaTrabajador = lstTrabajador;

            List<Cliente> lstCliente = new List<Cliente>();
            lstCliente = objClienteManager.listar_cliente();
            ViewBag.ListaCliente = lstCliente;

            return View();
        }

        public ActionResult listarCatering()
        {
            List<Catering> lstCatering = new List<Catering>();
            lstCatering = objCateringManager.listar_catering();
            return View(lstCatering);
        }

        [HttpPost]
        public JsonResult Insertar_Catering(Catering objCatering)
        {
            String mensaje = "";

            return Json(mensaje);
        }

        // GET: Catering/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        [HttpPost]
        public JsonResult Insertar_Detalle(DetalleMenuCatering objMenuCatering)
        {
            String mensaje = "";

            return Json(mensaje);
        }

       

















        // GET: Catering/Details/5
        //public ActionResult Details(int id)
        //{
        //    return View();
        //}



        //// POST: Catering/Create
        //[HttpPost]
        //public ActionResult Create(FormCollection collection)
        //{
        //    try
        //    {
        //        // TODO: Add insert logic here

        //        return RedirectToAction("Index");
        //    }
        //    catch
        //    {
        //        return View();
        //    }
        //}

       

        //// POST: Catering/Edit/5
        //[HttpPost]
        //public ActionResult Edit(int id, FormCollection collection)
        //{
        //    try
        //    {
        //        // TODO: Add update logic here

        //        return RedirectToAction("Index");
        //    }
        //    catch
        //    {
        //        return View();
        //    }
        //}

        //// GET: Catering/Delete/5
        //public ActionResult Delete(int id)
        //{
        //    return View();
        //}

        //// POST: Catering/Delete/5
        //[HttpPost]
        //public ActionResult Delete(int id, FormCollection collection)
        //{
        //    try
        //    {
        //        // TODO: Add delete logic here

        //        return RedirectToAction("Index");
        //    }
        //    catch
        //    {
        //        return View();
        //    }
        //}
    }
}
