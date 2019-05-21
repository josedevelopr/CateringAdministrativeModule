using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Dominio.Core.Entities;
using System.Data;
using MySql.Data.MySqlClient;

namespace Infraestructura.Data.MySql
{
    public class Usuario_DAL
    {
        private Conexioncs cnx = new Conexioncs();
        private MySqlConnection cn;

        public Usuario log_in_usuario(string correo)
        {
            cn = cnx.conectar();
            cn.Open();

            Usuario objUsuario = null;

            MySqlCommand cmd = new MySqlCommand("SP_USU_LOGIN", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("us_correo", DbType.String).Value = correo;


            MySqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                objUsuario = new Usuario()
                {
                    us_int_idusu = dr.GetInt32(0),
                    us_int_idtipousu = dr.GetInt32(1),
                    us_vchar_correo = dr.GetString(2),
                    us_vchar_password = dr.GetString(3),
                    us_vchar_foto = dr.GetString(4),
                    us_vchar_nomusu = dr.GetString(5)
                };
            }

            dr.Close();
            cn.Close();

            return objUsuario;
        }
    }
}
