using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Dominio.Core.Entities;
using Dominio.Core.MainModule;
using Rotativa;

namespace CateringModuloAdministrativo.Controllers
{
    public class InsumoController : Controller
    {
        private Insumo_Manager objInsumoManager = new Insumo_Manager();

        public ActionResult Print()
        {
            return new ActionAsPdf("listInsumo_print") { FileName = "InsumosECatering.pdf" };
        }

        public ActionResult listInsumo_print()
        {
            return View(objInsumoManager.listar_insumo());
        }

        // GET: Insumo
        public ActionResult Index()
        {
            return View();
        }
        
        public ActionResult listarinsumo()
        {
            List<Insumos> lstInsumos = new List<Insumos>();

            try
            {
                lstInsumos = objInsumoManager.listar_insumo();
            }
            catch(Exception e)
            {                
                Console.WriteLine("Exception source", e.Source);
                lstInsumos = new List<Insumos>();
            }
            return View(lstInsumos);
        }

        public ActionResult agregarInsumo()
        {
             return View(new Insumos());
        }
        [HttpPost]
        public ActionResult agregarInsumo(Insumos objInsumo)
        {
            if(!ModelState.IsValid)
            {
                return View(objInsumo);
            }
            else
            {
                int respuesta = objInsumoManager.registrar_insumo(objInsumo);
                if(respuesta==1)
                {
                    ViewBag.mensaje = "INSUMO GUARDADO";
                }
            }
            return RedirectToAction("listarinsumo");
        }
        public ActionResult verInsumo(int idInsumo)
        {
            Insumos objInsumo = new Insumos();
            objInsumo = objInsumoManager.ver_insumo(idInsumo);
            return View(objInsumo);
        }

        public ActionResult editarInsumo(int idInsumo)
        {
            Insumos objInsumo = new Insumos();
            objInsumo = objInsumoManager.ver_insumo(idInsumo);
            return View(objInsumo);
        }

        [HttpPost]
        public ActionResult editarInsumo(Insumos objInsumo)
        {
            if (!ModelState.IsValid)
            {
                return View(objInsumo);
            }
            else
            {
                int respuesta = objInsumoManager.actualizar_insumo(objInsumo);
                if (respuesta == 1)
                {
                    ViewBag.mensaje = "INSUMO ACTUALIZADO";
                }
            }
            return RedirectToAction("listarinsumo");
        }
    }
}