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
    public class MenuCatering_DAL
    {
        private Conexioncs cnx = new Conexioncs();
        private MySqlConnection cn;

        public List<MenuCatering> listamenucatering()
        {
            List<MenuCatering> lstMenuCatering = new List<MenuCatering>();

            cn = cnx.conectar();
            cn.Open();

            MySqlCommand cmd = new MySqlCommand("SP_MENUCATE_LIST", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("x_int_idcater", DbType.Int32).Value = 0;
            cmd.Parameters.Add("x_int_idmenu", DbType.Int32).Value = 0;
            cmd.Parameters.Add("x_tipo", DbType.String).Value = "A";

            MySqlDataReader dr = cmd.ExecuteReader();

            try
            {
                while (dr.Read())
                {
                    MenuCatering objMenuCatering = new MenuCatering()
                    {
                        mc_int_idmenu = dr.GetInt32(0),
                        mc_int_idcater = dr.GetInt32(1),
                        mc_char_estado = dr.GetString(2),
                        mc_dec_prectotalmenu = dr.GetDouble(3)
                    };

                    lstMenuCatering.Add(objMenuCatering);
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

            return lstMenuCatering;
        }

        public MenuCatering lista_x_id_menucatering(int id)
        {
            MenuCatering objMenuCatering = null;

            cn = cnx.conectar();
            cn.Open();

            MySqlCommand cmd = new MySqlCommand("SP_MENUCATE_LIST", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("x_int_idcater", DbType.Int32).Value = id;
            cmd.Parameters.Add("x_int_idmenu", DbType.Int32).Value = 0;
            cmd.Parameters.Add("x_tipo", DbType.String).Value = "F";

            MySqlDataReader dr = cmd.ExecuteReader();

            try
            {
                while (dr.Read())
                {
                    objMenuCatering = new MenuCatering()
                    {
                        mc_int_idmenu = dr.GetInt32(0),
                        mc_int_idcater = dr.GetInt32(1),
                        mc_char_estado = dr.GetString(2),
                        mc_dec_prectotalmenu = dr.GetDouble(3)
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

            return objMenuCatering;
        }

        public MenuCatering lista_x_idcate_menucatering(int id)
        {
            MenuCatering objMenuCatering = null;

            cn = cnx.conectar();
            cn.Open();

            MySqlCommand cmd = new MySqlCommand("SP_MENUCATE_LIST", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("x_int_idcater", DbType.Int32).Value = id;
            cmd.Parameters.Add("x_int_idmenu", DbType.Int32).Value = 0;
            cmd.Parameters.Add("x_tipo", DbType.String).Value = "FC";

            MySqlDataReader dr = cmd.ExecuteReader();

            try
            {
                while (dr.Read())
                {
                    objMenuCatering = new MenuCatering()
                    {
                        mc_int_idmenu = dr.GetInt32(0),
                        mc_int_idcater = dr.GetInt32(1),
                        mc_char_estado = dr.GetString(2),
                        mc_dec_prectotalmenu = Double.Parse(dr.GetDecimal(3).ToString())
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

            return objMenuCatering;
        }

        public MenuCatering lista_ultimo_menucatering()
        {
            MenuCatering objMenuCatering = null;

            cn = cnx.conectar();
            cn.Open();

            MySqlCommand cmd = new MySqlCommand("SP_MENUCATE_LIST", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("x_int_idcater", DbType.Int32).Value = 0;
            cmd.Parameters.Add("x_int_idmenu", DbType.Int32).Value = 0;
            cmd.Parameters.Add("x_tipo", DbType.String).Value = "LM";

            MySqlDataReader dr = cmd.ExecuteReader();

            try
            {
                while (dr.Read())
                {
                    objMenuCatering = new MenuCatering()
                    {
                        
                        mc_int_idmenu = dr.GetInt32(0),
                        mc_int_idcater = dr.GetInt32(1),
                        mc_char_estado = dr.GetString(2),
                        mc_dec_prectotalmenu = Double.Parse(dr.GetDecimal(3).ToString())
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

            return objMenuCatering;
        }

        public int insertar_or_actualizar_menucatering (MenuCatering objMenuCatering, string action)
        {
            int resultado = -1;
            cn = cnx.conectar();
            cn.Open();

            try
            {
                MySqlCommand cmd = new MySqlCommand("SP_MENUCATE_INSERT_UPDATE", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("x_int_idmenu", DbType.Int32).Value = objMenuCatering.mc_int_idmenu;
                cmd.Parameters.Add("x_int_idcater", DbType.String).Value = objMenuCatering.mc_int_idcater;
                cmd.Parameters.Add("x_char_estado", DbType.String).Value = objMenuCatering.mc_char_estado;
                cmd.Parameters.Add("x_dec_prectotalmenu", DbType.String).Value = objMenuCatering.mc_dec_prectotalmenu;
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
