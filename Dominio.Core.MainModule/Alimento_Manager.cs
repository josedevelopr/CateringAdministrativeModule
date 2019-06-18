﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio.Core.Entities;
using Infraestructura.Data.MySql;


namespace Dominio.Core.MainModule
{
    public class Alimento_Manager
    {
        private Alimento_DAL objAlimento_DAL = new Alimento_DAL();
        public List<Alimento> listar_alimento()
        {
            return objAlimento_DAL.lista_alimento();
        }
    }
}
