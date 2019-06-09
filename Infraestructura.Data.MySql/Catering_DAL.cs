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
    public class Catering_DAL
    {
        private Conexioncs cnx = new Conexioncs();
        private MySqlConnection cn;

        public List<Catering> lista_catering()
        {
            List<Catering> lstCatering = new List<Catering>();

            cn = cnx.conectar();
            cn.Open();

            MySqlCommand cmd = new MySqlCommand("", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            MySqlDataReader dr = cmd.ExecuteReader();

            try
            {
                while (dr.Read())
                {
                    Catering objCatering = new Catering()
                    {
                        ca_int_idcatering = dr.GetInt32(0),
                        ca_date_fecha = dr.GetString(1),
                        ca_char_estado = dr.GetString(2),
                        ca_varchar_lugarcatering=dr.GetString(3),
                        ca_char_dnicliente=dr.GetString(4)
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

        public Catering ver_catering(int cod)
        {
            Catering objCatering = null;
            cn = cnx.conectar();
            cn.Open();

            MySqlCommand cmd = new MySqlCommand("", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("id", DbType.Int32).Value = cod;

            MySqlDataReader dr = cmd.ExecuteReader();
            try
            {
                while (dr.Read())
                {
                    objCatering = new Catering()
                    {
                        ca_int_idcatering = dr.GetInt32(0),
                        ca_date_fecha = dr.GetString(1),
                        ca_char_estado = dr.GetString(2),
                        ca_varchar_lugarcatering = dr.GetString(3),
                        ca_char_dnicliente = dr.GetString(4)

                    };
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception source", e.Source);
                objCatering = new Catering();
            }
            finally
            {
                dr.Close();
                cn.Close();
            }

            return objCatering;
        }


        public int registrar_catering(Catering objCatering)
        {
            int resultado = -1;
            cn = cnx.conectar();
            cn.Open();
            try
            {
                MySqlCommand cmd = new MySqlCommand("", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("ca_date_fecha", DbType.String).
                    Value = objCatering.ca_date_fecha;
                cmd.Parameters.Add("ca_char_estado", DbType.String).
                    Value = objCatering.ca_char_estado;
                cmd.Parameters.Add("ca_varchar_lugarcatering", DbType.String).
               Value = objCatering.ca_varchar_lugarcatering;
                cmd.Parameters.Add("ca_char_dnicliente", DbType.String).
                    Value = objCatering.ca_char_dnicliente;

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


        public int actualizar_catering(Catering objCatering)
        {
            int resultado = -1;
            cn = cnx.conectar();
            cn.Open();
            try
            {
                MySqlCommand cmd = new MySqlCommand("", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("ca_int_idcatering", DbType.Int32).Value = objCatering.ca_int_idcatering;
                cmd.Parameters.Add("ca_date_fecha", DbType.String).Value = objCatering.ca_date_fecha;
                cmd.Parameters.Add("ca_char_estado", DbType.String).Value = objCatering.ca_char_estado;
                cmd.Parameters.Add("ca_varchar_lugarcatering", DbType.String).Value = objCatering.ca_varchar_lugarcatering;
                cmd.Parameters.Add("ca_char_dnicliente", DbType.String).Value = objCatering.ca_char_dnicliente;
                
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
