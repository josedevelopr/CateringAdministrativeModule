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
    public class DetalleMenuCatering_DAL
    {
        private Conexioncs cnx = new Conexioncs();
        private MySqlConnection cn;

        public List<DetalleMenuCatering> listaDetalleMenuCatering()
        {
            List<DetalleMenuCatering> lstDetalleMenuCatering = new List<DetalleMenuCatering>();

            cn = cnx.conectar();
            cn.Open();

            MySqlCommand cmd = new MySqlCommand("SP_DETAMENUCATE_LIST", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("x_id_detamenu", DbType.Int32).Value = 0;
            cmd.Parameters.Add("x_id_men", DbType.Int32).Value = 0;
            cmd.Parameters.Add("x_tipo", DbType.String).Value = "A";

            MySqlDataReader dr = cmd.ExecuteReader();

            try
            {
                while (dr.Read())
                {
                    DetalleMenuCatering objDetalleMenuCatering = new DetalleMenuCatering()
                    {
                        dm_int_iddetmenucater = dr.GetInt32(0),
                        dm_int_idmenu = dr.GetInt32(1),
                        dm_int_idalim   = dr.GetInt32(2),
                        dm_int_cantmenu = dr.GetInt32(3),
                        dm_dec_subto    = dr.GetDouble(4),
                        al_vchar_descr = dr.GetString(5)

                    };

                    lstDetalleMenuCatering.Add(objDetalleMenuCatering);
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

            return lstDetalleMenuCatering;
        }

        public List<DetalleMenuCatering> listaDetalleMenuCatering_x_idmenu(int id_men)
        {
            List<DetalleMenuCatering> lstDetalleMenuCatering = new List<DetalleMenuCatering>();

            cn = cnx.conectar();
            cn.Open();

            MySqlCommand cmd = new MySqlCommand("SP_DETAMENUCATE_LIST", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("x_id_detamenu", DbType.Int32).Value = id_men;
            cmd.Parameters.Add("x_id_men", DbType.Int32).Value = 0;
            cmd.Parameters.Add("x_tipo", DbType.String).Value = "FM";

            MySqlDataReader dr = cmd.ExecuteReader();

            try
            {
                while (dr.Read())
                {
                    DetalleMenuCatering objDetalleMenuCatering = new DetalleMenuCatering()
                    {
                        dm_int_iddetmenucater = dr.GetInt32(0),
                        dm_int_idmenu = dr.GetInt32(1),
                        dm_int_idalim = dr.GetInt32(2),
                        dm_int_cantmenu = dr.GetInt32(3),
                        dm_dec_subto = dr.GetDouble(4),
                        al_vchar_descr = dr.GetString(5)

                    };

                    lstDetalleMenuCatering.Add(objDetalleMenuCatering);
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

            return lstDetalleMenuCatering;
        }

        public DetalleMenuCatering listaDetalleMenuCatering_x_id(int id_deta)
        {
            DetalleMenuCatering objDetalleMenuCatering = null;

            cn = cnx.conectar();
            cn.Open();

            MySqlCommand cmd = new MySqlCommand("SP_DETAMENUCATE_LIST", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("x_id_detamenu", DbType.Int32).Value = 0;
            cmd.Parameters.Add("x_id_men", DbType.Int32).Value = id_deta;
            cmd.Parameters.Add("x_tipo", DbType.String).Value = "F";

            MySqlDataReader dr = cmd.ExecuteReader();

            try
            {
                while (dr.Read())
                {
                    objDetalleMenuCatering = new DetalleMenuCatering()
                    {
                        dm_int_iddetmenucater = dr.GetInt32(0),
                        dm_int_idmenu = dr.GetInt32(1),
                        dm_int_idalim = dr.GetInt32(2),
                        dm_int_cantmenu = dr.GetInt32(3),
                        dm_dec_subto = dr.GetDouble(4),
                        al_vchar_descr = dr.GetString(5)

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

            return objDetalleMenuCatering;
        }

        public int insertar_or_actualizar_menucatering(DetalleMenuCatering objDetalleMenuCatering, string action)
        {
            int resultado = -1;
            cn = cnx.conectar();
            cn.Open();

            try
            {
                MySqlCommand cmd = new MySqlCommand("SP_DETAMENUCATE_INSERT_UPDATE", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("x_int_iddetmenucater", DbType.Int32).Value = objDetalleMenuCatering.dm_int_iddetmenucater;
                cmd.Parameters.Add("x_int_idmenu", DbType.Int32).Value = objDetalleMenuCatering.dm_int_idmenu;
                cmd.Parameters.Add("x_int_idalim", DbType.Int32).Value = objDetalleMenuCatering.dm_int_idalim;
                cmd.Parameters.Add("x_int_cantmenu", DbType.Int32).Value = objDetalleMenuCatering.dm_int_cantmenu;
                cmd.Parameters.Add("x_dec_subto", DbType.Double).Value = objDetalleMenuCatering.dm_dec_subto;
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
