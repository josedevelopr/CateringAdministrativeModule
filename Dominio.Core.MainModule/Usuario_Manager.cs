using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Dominio.Core.Entities;
using Infraestructura.Data.MySql;

namespace Dominio.Core.MainModule
{
    public class Usuario_Manager
    {
        private Usuario_DAL objUsuario_DAL = new Usuario_DAL();

        public Usuario log_in_usuario(string correo)
        {
            return objUsuario_DAL.log_in_usuario(correo);
        }

    }
}
