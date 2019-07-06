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
    public class Catering_DAL
    {
        private Conexioncs cnx = new Conexioncs();
        private MySqlConnection cn;

        public List<Alimento> listar_alimento()
        {
            List<Alimento> lstAlimento = new List<Alimento>();

            cn = cnx.conectar();
            cn.Open();

            MySqlCommand cmd = new MySqlCommand("SP_COMIDA_LIST", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            
            MySqlDataReader dr = cmd.ExecuteReader();

            try
            {
                while (dr.Read())
                {
                    Alimento objAlimento = new Alimento()
                    {
                        al_int_idalim = dr.GetInt32(0),
                        al_vchar_descr = dr.GetString(1),
                        al_int_idtipoalim = dr.GetInt32(2),
                        al_dec_precalim = Double.Parse(dr.GetDecimal(3).ToString()),
                        al_int_est = dr.GetInt32(4)
                    };
                    lstAlimento.Add(objAlimento);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception source", e.Source);
            }
            finally
            {
                dr.Close();
                cn.Close();
            }

            return lstAlimento;
        }
        public List<Catering> listar_catering()
        {
            List<Catering> lstCatering = new List<Catering>();

            cn = cnx.conectar();
            cn.Open();

            MySqlCommand cmd = new MySqlCommand("SP_CATE_LIST", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("x_id", DbType.Int32).Value = 0;
            cmd.Parameters.Add("x_tipo", DbType.String).Value = "A";

            MySqlDataReader dr = cmd.ExecuteReader();

            try
            {
                while (dr.Read())
                {
                    Catering objCatering = new Catering()
                    {
                        ca_int_idcater = dr.GetInt32(0),
                        ca_date_fecha = dr.GetString(1),
                        ca_vchar_lugarcater = dr.GetString(2),
                        ca_char_estado = dr.GetString(3),
                        ca_char_dniclie = dr.GetString(4),
                        ca_int_idtrab   =dr.GetInt32(5),
                        ca_vchar_encargadonom = dr.GetString(6),
                        ca_char_nomclie = dr.GetString(7)
                    };
                    lstCatering.Add(objCatering);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception source", e.Source);
            }
            finally
            {
                dr.Close();
                cn.Close();
            }

            return lstCatering;
        }
        public Catering lista_x_id_catering(int id)
        {
            Catering objCatering = null;

            cn = cnx.conectar();
            cn.Open();

            MySqlCommand cmd = new MySqlCommand("SP_CATE_LIST", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("x_id", DbType.Int32).Value = id;
            cmd.Parameters.Add("x_tipo", DbType.String).Value = "F";

            MySqlDataReader dr = cmd.ExecuteReader();

            try
            {
                while (dr.Read())
                {
                    objCatering = new Catering()
                    {
                        ca_int_idcater = dr.GetInt32(0),
                        ca_date_fecha = dr.GetString(1),
                        ca_char_estado = dr.GetString(2),
                        ca_vchar_lugarcater = dr.GetString(3),
                        ca_char_dniclie = dr.GetString(4),
                        ca_int_idtrab = dr.GetInt32(5),
                        ca_vchar_encargadonom = dr.GetString(6),
                        ca_char_nomclie = dr.GetString(7)
                    };
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception source", e.Source);
            }
            finally
            {
                dr.Close();
                cn.Close();
            }

            return objCatering;
        }


        public int insertar_or_actualizar_catering(Catering objCatering, string action)
        {
            int resultado = -1;
            cn = cnx.conectar();
            cn.Open();

            try
            {
                MySqlCommand cmd = new MySqlCommand("SP_CATE_INSERT_UPDATE", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("x_int_idcater", DbType.Int32).Value = 0;
                cmd.Parameters.Add("x_date_fecha", DbType.String).Value = objCatering.ca_date_fecha;
                cmd.Parameters.Add("x_char_estado", DbType.String).Value = objCatering.ca_char_estado;
                cmd.Parameters.Add("x_vchar_lugarcater", DbType.String).Value = objCatering.ca_vchar_lugarcater;
                cmd.Parameters.Add("x_char_dniclie", DbType.String).Value = objCatering.ca_char_dniclie;
                cmd.Parameters.Add("x_int_idtrab", DbType.Int32).Value = objCatering.ca_int_idtrab;
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
