using Dominio.Core.Entities;
using Dominio.Core.MainModule;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CateringModuloAdministrativo.Controllers
{
    public class ClienteController : Controller
    {
        private Cliente_Manager objClienteManager = new Cliente_Manager();
        private Usuario_Manager objUsuarioManager = new Usuario_Manager();
        
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult listarCliente()
        {
            List<Cliente> lstCliente = new List<Cliente>();
            lstCliente = objClienteManager.listar_cliente();
            return View(lstCliente);

        }

        // GET: Cliente/Details/5
        public ActionResult Details(int idCliente)
        {
            Cliente objCliente = new Cliente();
            objCliente = objClienteManager.lista_x_id_cliente(idCliente);
            return View(objCliente);
        }

        // GET: Cliente/Create
        public ActionResult Create()
        {
            ViewBag.ListaUsuario = objUsuarioManager.lista_usuario();
            return View();
        }

        // POST: Cliente/Create
        [HttpPost]
        public ActionResult Create(Cliente objCliente)
        {
            if (!ModelState.IsValid)
            {
                return View(objCliente);
            }
            else
            {
                int respuesta = objClienteManager.insertar_or_actualizar_cliente(objCliente, "I");
            }

            return RedirectToAction("listarCliente");
        }

        // GET: Cliente/Edit/5
        public ActionResult Edit(int idCliente)
        {
            Cliente objCliente = new Cliente();
            objCliente = objClienteManager.lista_x_id_cliente(idCliente);
            return View(objCliente);
        }

        // POST: Cliente/Edit/5
        [HttpPost]
        public ActionResult Edit(Cliente objCliente)
        {
            if (!ModelState.IsValid)
            {
                return View(objCliente);
            }
            else
            {
                int respuesta = objClienteManager.insertar_or_actualizar_cliente(objCliente, "U");
            }

            return RedirectToAction("listarCliente");
        }
      
    }
}