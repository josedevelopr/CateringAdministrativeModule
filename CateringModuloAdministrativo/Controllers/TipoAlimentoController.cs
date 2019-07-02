using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CateringModuloAdministrativo.Controllers
{
    public class TipoAlimentoController : Controller
    {
        // GET: TipoAlimento
        public ActionResult Index()
        {
            return View();
        }

        // GET: TipoAlimento/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: TipoAlimento/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: TipoAlimento/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: TipoAlimento/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: TipoAlimento/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: TipoAlimento/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: TipoAlimento/Delete/5
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
