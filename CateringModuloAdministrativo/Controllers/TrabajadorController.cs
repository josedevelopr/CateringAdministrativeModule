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
    
    public class TrabajadorController : Controller
    {
        private Trabajador_Manager objTrabajadorManager         = new Trabajador_Manager();
        private Usuario_Manager objUsuarioManager               = new Usuario_Manager();
        private TipoTrabajador_Manager objTipoTrabajadorManager = new TipoTrabajador_Manager();

        public ActionResult Print()
        {
            return new ActionAsPdf("listaTrabajadores_print") { FileName = "TrabajadoresECatering.pdf" };
        }

        public ActionResult listaTrabajadores_print()
        {
            return View(objTrabajadorManager.listar_trabajador());
        }

        // GET: Trabajador
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult listarTrabajador()
        {
            List<Trabajador> lstTrabajador = new List<Trabajador>();
            lstTrabajador = objTrabajadorManager.listar_trabajador();
            return View(lstTrabajador);
        }

        // GET: Trabajador/Details/5
        public ActionResult Details(int idTrabajador)
        {
            Trabajador objTrabajador = new Trabajador();
            objTrabajador = objTrabajadorManager.lista_x_id_trabajador(idTrabajador);
            return View(objTrabajador);
        }

        // GET: Trabajador/Create
        public ActionResult Create()
        {
            ViewBag.ListaUsuario        = objUsuarioManager.lista_usuario();
            ViewBag.ListaTipoTrabajador    = objTipoTrabajadorManager.lista_TipoTrabajador();
            return View();
        }

        // POST: Trabajador/Create
        [HttpPost]
        public ActionResult Create(Trabajador  objTrabajador)
        {
            if (!ModelState.IsValid)
            {
                return View(objTrabajador);
            }
            else
            {
                int respuesta = objTrabajadorManager.insertar_or_actualizar_trabajador(objTrabajador,"I");
            }

            return RedirectToAction("listarTrabajador");
        }

        // GET: Trabajador/Edit/5
        public ActionResult Edit(int idTrabajador)
        {
            Trabajador objTrabajador = new Trabajador();
            objTrabajador = objTrabajadorManager.lista_x_id_trabajador(idTrabajador);
            ViewBag.ListaUsuario = objUsuarioManager.lista_usuario();
            ViewBag.ListaTipoTrabajador = objTipoTrabajadorManager.lista_TipoTrabajador();
            return View(objTrabajador);
        }

        // POST: Trabajador/Edit/5
        [HttpPost]
        public ActionResult Edit(Trabajador objTrabajador)
        {
            if (!ModelState.IsValid)
            {
                return View(objTrabajador);
            }
            else
            {
                int respuesta = objTrabajadorManager.insertar_or_actualizar_trabajador(objTrabajador, "I");
            }

            return RedirectToAction("listarTrabajador");
        }
        
    }
}
