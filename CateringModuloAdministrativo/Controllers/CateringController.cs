using Dominio.Core.Entities;
using Dominio.Core.MainModule;
using Rotativa;
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
        private DetalleMenuCatering_Manager objDetalleMenuCateringManager = new DetalleMenuCatering_Manager();
        private MenuCatering_Manager objMenuCateringManager = new MenuCatering_Manager();
        private Cliente_Manager objClienteManager = new Cliente_Manager();
        private Trabajador_Manager objTrabajadorManager = new Trabajador_Manager();

        // GET: Catering
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Print()
        {
            return new ActionAsPdf("listadoCatering_print") { FileName = "CateringECatering.pdf" };
        }

        public ActionResult listadoCatering_print()
        {
            return View(objCateringManager.listar_catering());
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

            List<Alimento> lstAlimento = new List<Alimento>();
            lstAlimento = objCateringManager.listar_alimento();
            ViewBag.ListaAlimento = lstAlimento;

            return View();
        }

        public ActionResult listarCatering()
        {
            List<Catering> lstCatering = new List<Catering>();
            lstCatering = objCateringManager.listar_catering();
            return View(lstCatering);
        }

        public ActionResult listarDetalleMenuCatering()
        {
            List<Catering> lstCatering = new List<Catering>();
            lstCatering = objCateringManager.listar_catering();
            return View(lstCatering);
        }

        public PartialViewResult MenuDetalleCatering(int idMenu)
        {
            List<DetalleMenuCatering> lstDetalleMenuCatering = new List<DetalleMenuCatering>();
            lstDetalleMenuCatering = objDetalleMenuCateringManager.listaDetalleMenuCatering_x_idmenu(idMenu);
            return PartialView("_DetalleMenuCatering", lstDetalleMenuCatering);
        }

        // GET: Catering/Edit/5
        public ActionResult Edit(int idCatering)
        {
            List<Trabajador> lstTrabajador = new List<Trabajador>();
            lstTrabajador = objTrabajadorManager.listar_trabajador();
            ViewBag.ListaTrabajador = lstTrabajador;

            List<Cliente> lstCliente = new List<Cliente>();
            lstCliente = objClienteManager.listar_cliente();
            ViewBag.ListaCliente = lstCliente;

            List<Alimento> lstAlimento = new List<Alimento>();
            lstAlimento = objCateringManager.listar_alimento();
            ViewBag.ListaAlimento = lstAlimento;

            Catering objCatering = new Catering();
            objCatering = objCateringManager.lista_x_id_catering(idCatering);
            MenuCatering objMenuCatering = new MenuCatering();
            objMenuCatering = objMenuCateringManager.lista_x_idcate_menucatering(objCatering.ca_int_idcater);
            ViewBag.idMenuCatering = objMenuCatering.mc_int_idmenu;
            return View(objCatering);
        }

        [HttpPost]
        public JsonResult Insertar_Catering(Catering objCatering)
        {
            int resultado = -1;
            try
            {
                objCatering.ca_char_estado = "NCF";//No confirmado
                resultado = objCateringManager.insertar_or_actualizar_catering(objCatering, "I");
                if (resultado == 1)
                {
                    MenuCatering obj = new MenuCatering();
                    int resultado2 = -1;
                    resultado2 = objMenuCateringManager.insertar_or_actualizar_menucatering(obj, "I");

                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception source", e.Source);
            }

            return Json(resultado);
        }
        [HttpPost]
        public JsonResult GuardarActualizado_Catering(int idCatering,double total)
        {
            int resultado = -1;
            try
            {
                Catering objCatering = new Catering();
                MenuCatering objMenuCatering = new MenuCatering();

                objCatering = objCateringManager.lista_x_id_catering(idCatering);
                objMenuCatering = objMenuCateringManager.lista_x_idcate_menucatering(idCatering);

                objCatering.ca_char_estado = "DIS";//Disponible
                objMenuCatering.mc_dec_prectotalmenu = total;
                objMenuCatering.mc_char_estado = "DIS";

                resultado = objCateringManager.insertar_or_actualizar_catering(objCatering, "U");
                resultado = objMenuCateringManager.insertar_or_actualizar_menucatering(objMenuCatering,"U");
           
                
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception source", e.Source);
            }

            return Json(resultado);
        }

        [HttpPost]
        public JsonResult Insertar_Detalle(DetalleMenuCatering objDetalleMenuCatering)
        {
            int resultado = -1;
            try
            {
                resultado = objDetalleMenuCateringManager.insertar_or_actualizar_menucatering(objDetalleMenuCatering,"I");               
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception source", e.Source);
            }


            return Json(resultado);
        }
        
        [HttpPost]
        public JsonResult Actualizar_Detalle(DetalleMenuCatering objDetalleMenuCatering)
        {
            int resultado = -1;
            try
            {
                resultado = objDetalleMenuCateringManager.insertar_or_actualizar_menucatering(objDetalleMenuCatering, "U");
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception source", e.Source);
            }


            return Json(resultado);
        }

        [HttpPost]
        public JsonResult obtenerAlimento(int idAlimento)
        {

            List<Alimento> lstAlimento = new List<Alimento>();
            lstAlimento = objCateringManager.listar_alimento();

            Alimento objAlimento = new Alimento();
            objAlimento = lstAlimento.Where(x=>x.al_int_idalim == idAlimento).First();
            var precio = objAlimento.al_dec_precalim;
            return Json(precio);
        }

        [HttpPost]
        public JsonResult obtenerMenuDetalleCatering(int idMenuDetalleCatering)
        {
            DetalleMenuCatering obj = new DetalleMenuCatering();
            obj = objDetalleMenuCateringManager.listaDetalleMenuCatering_x_id(idMenuDetalleCatering);
            return Json(obj);
        }

        [HttpPost]
        public JsonResult eliminarMenuDetalleCatering(int idMenuDetalleCatering)
        {
            var respuesta = -1;

            respuesta = objDetalleMenuCateringManager.eliminar_menuDetalleCatering(idMenuDetalleCatering);

            return Json(respuesta);
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
