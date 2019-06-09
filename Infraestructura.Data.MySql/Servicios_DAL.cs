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
    public class Servicios_DAL
    {


        private Conexioncs cnx = new Conexioncs();
        private MySqlConnection cn;

        public List<Servicios> lista_Servicios()
        {
            List<Servicios> lstServicios = new List<Servicios>();

            cn = cnx.conectar();
            cn.Open();

            MySqlCommand cmd = new MySqlCommand("", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            MySqlDataReader dr = cmd.ExecuteReader();

            try
            {
                while (dr.Read())
                {
                    Servicios objServicios = new Servicios()
                    {
                        se_int_idservicios = dr.GetInt32(0),
                        se_varchar_nomservicio = dr.GetString(1),
                        se_varchar_descripcion = dr.GetString(2)

                    };
                    lstServicios.Add(objServicios);
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

            return lstServicios;
        }

        public Servicios ver_servicios(int cod)
        {
            Servicios objServicios = null;
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
                    objServicios = new Servicios()
                    {
                        se_int_idservicios = dr.GetInt32(0),
                        se_varchar_nomservicio = dr.GetString(1),
                        se_varchar_descripcion = dr.GetString(2),

                    };
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception source", e.Source);
                objServicios = new Servicios();
            }
            finally
            {
                dr.Close();
                cn.Close();
            }

            return objServicios;
        }


        public int registrar_servicios(Servicios objServicios)
        {
            int resultado = -1;
            cn = cnx.conectar();
            cn.Open();
            try
            {
                MySqlCommand cmd = new MySqlCommand("", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("se_varchar_nomservicio", DbType.String).
                    Value = objServicios.se_varchar_nomservicio;
                cmd.Parameters.Add("se_varchar_descripcion", DbType.String).
                    Value = objServicios.se_varchar_descripcion;

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


        public int actualizar_servicios(Servicios objServicios)
        {
            int resultado = -1;
            cn = cnx.conectar();
            cn.Open();
            try
            {
                MySqlCommand cmd = new MySqlCommand("", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("se_int_idservicios", DbType.Int32).Value = objServicios.se_int_idservicios;
                cmd.Parameters.Add("se_varchar_nomservicio", DbType.String).Value = objServicios.se_varchar_nomservicio;
                cmd.Parameters.Add("se_varchar_descripcion", DbType.String).Value = objServicios.se_varchar_descripcion;


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