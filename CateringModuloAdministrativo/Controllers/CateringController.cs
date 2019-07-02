using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CateringModuloAdministrativo.Controllers
{
    public class CateringController : Controller
    {
        // GET: Catering
        public ActionResult Index()
        {
            return View();
        }

        // GET: Catering/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Catering/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Catering/Create
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

        // GET: Catering/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Catering/Edit/5
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

        // GET: Catering/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Catering/Delete/5
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
