using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


using Dominio.Core.Entities;
using Dominio.Core.MainModule;

namespace CateringModuloAdministrativo.Controllers
{
    public class ComidaTipoController : Controller { 



          private Tipo_Alimento_Manager objTipoAlimManager = new Tipo_Alimento_Manager();

        public ActionResult Index()
        {
            return View();
        }


        // GET: TipoAlimento/Details/5
        public ActionResult ListarTipoAlimento()
        {
            
            List<Tipo_Alimento> lstTiAlimen = new List<Tipo_Alimento>();

            try
            {
                lstTiAlimen = objTipoAlimManager.listar_TipoAlimento();
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception source", e.Source);
                lstTiAlimen = new List<Tipo_Alimento>();
            }
            return View(lstTiAlimen);
        }

        // GET: Alimento/Create
        public ActionResult AgregarTipoAlimento()
        {
            return View(new Tipo_Alimento());
        }

        // POST: Alimento/Create
        [HttpPost]
        public ActionResult AgregarTipoAlimento(Tipo_Alimento objTiAlimento)

        {
            if (!ModelState.IsValid)
            {
                return View(objTiAlimento);
            }
            else
            {
                int respuesta = objTipoAlimManager.registrar_TipoAlimento(objTiAlimento);
                if (respuesta == 1)
                {
                    ViewBag.mensaje = "TIPO ALIMENTO GUARDADO";
                }
            }
            return RedirectToAction("ListarTipoAlimento");
        }


        public ActionResult verTipoAlimento(int idTipoAlimento)
        {

            Tipo_Alimento objtipoalimento = new Tipo_Alimento();
            objtipoalimento = objTipoAlimManager.ver_TipoAlimento(idTipoAlimento);
            return View(objtipoalimento);


        }



        // GET: Alimento/Edit/5
        public ActionResult EditarTipoAlimento(int idTipoAlimento)
        {
            Tipo_Alimento objTipoAlimento = new Tipo_Alimento();
            objTipoAlimento = objTipoAlimManager.ver_TipoAlimento(idTipoAlimento);
            return View(objTipoAlimento);
        }

        // POST: Alimento/Edit/5
        [HttpPost]
        public ActionResult EditarTipoAlimento(Tipo_Alimento objTipoAlimento)
        {
            if (!ModelState.IsValid)
            {
                return View(objTipoAlimento);
            }
            else
            {
                int respuesta = objTipoAlimManager.actualizar_Tipoalimento(objTipoAlimento);
                if (respuesta == 1)
                {
                    ViewBag.mensaje = "TIPO DE ALIMENTO ACTUALIZADO";
                }
            }
            return RedirectToAction("ListarTipoAlimento");
        }
    }
    }
