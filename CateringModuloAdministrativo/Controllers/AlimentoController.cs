using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CateringModuloAdministrativo.Controllers
{
    public class AlimentoController : Controller
    {
        // GET: Alimento
        public ActionResult Index()
        {
            return View();
        }

        // GET: Alimento/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Alimento/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Alimento/Create
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

        // GET: Alimento/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Alimento/Edit/5
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

        // GET: Alimento/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Alimento/Delete/5
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
