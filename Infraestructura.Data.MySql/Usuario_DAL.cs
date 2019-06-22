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

        public Usuario lista_x_id_usuario(int x_id_usuario)
        {
            cn = cnx.conectar();
            cn.Open();

            Usuario objUsuario = null;

            MySqlCommand cmd = new MySqlCommand("P_USU_LISTID", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("x_id", DbType.Int32).Value = x_id_usuario;

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

        public int insertar_or_actualizar_usuario(Usuario obUsuario, string action)
        {
            int resultado = -1;
            cn = cnx.conectar();
            cn.Open();

            try
            {
                MySqlCommand cmd = new MySqlCommand("SP_USU_INSERT_UPDATE", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("x_int_idusu", DbType.Int32).Value = obUsuario.us_int_idusu;
                cmd.Parameters.Add("x_int_idtipousu", DbType.Int32).Value = obUsuario.us_int_idtipousu;
                cmd.Parameters.Add("x_vchar_correo", DbType.String).Value = obUsuario.us_vchar_correo;
                cmd.Parameters.Add("x_vchar_password", DbType.String).Value = obUsuario.us_vchar_password;
                cmd.Parameters.Add("x_vchar_foto", DbType.String).Value = obUsuario.us_vchar_foto;
                cmd.Parameters.Add("x_vchar_nomusu", DbType.String).Value = obUsuario.us_vchar_nomusu;
                cmd.Parameters.Add("x_action", DbType.String).Value = action;

                resultado = cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception source", e.Source);
            }
            finally
            {
                cn.Close();
            }           

            return resultado;
        }
    }
}
