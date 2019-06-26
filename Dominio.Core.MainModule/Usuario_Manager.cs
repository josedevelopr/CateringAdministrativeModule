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

        public List<Usuario> lista_usuario()
        {
            return objUsuario_DAL.lista_usuario();
        }
        public Usuario log_in_usuario(string correo)
        {
            return objUsuario_DAL.log_in_usuario(correo);
        }
        public Usuario lista_x_id_usuario(int x_id_usuario)
        {
            return objUsuario_DAL.lista_x_id_usuario(x_id_usuario);
        }
        public int insertar_or_actualizar_usuario(Usuario obUsuario, string action)
        {
            return objUsuario_DAL.insertar_or_actualizar_usuario(obUsuario,action);
        }
    }
}
