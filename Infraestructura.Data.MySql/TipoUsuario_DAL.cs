using Dominio.Core.Entities;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infraestructura.Data.MySql
{
    public class TipoUsuario_DAL
    {
        private Conexioncs cnx = new Conexioncs();
        private MySqlConnection cn;

        public List<TipoUsuario> lista_TipoUsuario()
        {

            cn = cnx.conectar();
            cn.Open();
            List<TipoUsuario> lstTipoUsuario = new List<TipoUsuario>();

            MySqlDataReader dr = null;


            MySqlCommand cmd = new MySqlCommand("SP_TIPUSU_LIST", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("x_id", DbType.Int32).Value = 0;
            cmd.Parameters.Add("x_tipo", DbType.String).Value = "AS";

            try
            {
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    TipoUsuario objTipoUsuario = new TipoUsuario()
                    {
                        tu_int_idtipousu    = dr.GetInt32(0),
                        tu_vchar_descr      = dr.GetString(1),
                        tu_char_estado      = dr.GetString(2)
                    };

                    lstTipoUsuario.Add(objTipoUsuario);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception source", e.Source);
                lstTipoUsuario = new List<TipoUsuario>();
            }
            finally
            {
                dr.Close();
                cn.Close();
            }

            return lstTipoUsuario;
        }

        public TipoUsuario TipoUsuario_x_id(int id)
        {
            cn = cnx.conectar();
            cn.Open();
            TipoUsuario objTipoUsuario = null;
            MySqlDataReader dr = null;

            MySqlCommand cmd = new MySqlCommand("SP_USU_LIST", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("x_id", DbType.Int32).Value = id;
            cmd.Parameters.Add("x_tipo", DbType.String).Value = "F";

            try
            {
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    objTipoUsuario = new TipoUsuario()
                    {
                        tu_int_idtipousu = dr.GetInt32(0),
                        tu_vchar_descr = dr.GetString(1),
                        tu_char_estado = dr.GetString(2)
                    };                    
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception source", e.Source);
                objTipoUsuario = new TipoUsuario();
            }
            finally
            {
                dr.Close();
                cn.Close();
            }

            return objTipoUsuario;
        }

        public int insertar_or_actualizar_TipoUsuario(TipoUsuario obTipoUsuario, string x_action)
        {
            int resultado = -1;
            cn = cnx.conectar();
            cn.Open();

            try
            {
                MySqlCommand cmd = new MySqlCommand("SP_TIPUSU_INSERT_UPDATE", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("x_int_idtipousu", DbType.Int32).Value = obTipoUsuario.tu_int_idtipousu;
                cmd.Parameters.Add("x_vchar_descr", DbType.String).Value = obTipoUsuario.tu_vchar_descr;
                cmd.Parameters.Add("x_char_estado", DbType.String).Value = obTipoUsuario.tu_char_estado;
                cmd.Parameters.Add("x_action", DbType.String).Value = x_action;

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
