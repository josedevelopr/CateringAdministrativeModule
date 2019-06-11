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
    public class Insumo_DAL
    {
        private Conexioncs cnx = new Conexioncs();
        private MySqlConnection cn;

        public List<Insumos> listar_insumo()
        {
            List<Insumos> lstInsumo = new List<Insumos>();

            cn = cnx.conectar();
            cn.Open();

            MySqlCommand cmd = new MySqlCommand("SP_INS_LIS", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            MySqlDataReader dr = cmd.ExecuteReader();

            try
            {
                while (dr.Read())
                {
                    Insumos objIsumo = new Insumos()
                    {
                        in_int_idinsum = dr.GetInt32(0),
                        in_vchar_descr = dr.GetString(1),
                        in_int_stock = dr.GetInt32(2),
                        in_int_minstock = dr.GetInt32(3),
                        in_dec_precio = double.Parse(dr.GetDecimal(4).ToString())
                    };
                    lstInsumo.Add(objIsumo);
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

            return lstInsumo;
        }

        public Insumos ver_insumo(int codigo)
        {
            Insumos objIsumo = null;
            cn = cnx.conectar();
            cn.Open();

            MySqlCommand cmd = new MySqlCommand("SP_INS_LIS", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("id", DbType.Int32).Value =codigo;

            MySqlDataReader dr = cmd.ExecuteReader();

            try
            {
                while (dr.Read())
                {
                    objIsumo = new Insumos()
                    {
                        in_int_idinsum = dr.GetInt32(0),
                        in_vchar_descr = dr.GetString(1),
                        in_int_stock = dr.GetInt32(2),
                        in_int_minstock = dr.GetInt32(3),
                        in_dec_precio = double.Parse(dr.GetDecimal(4).ToString())
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

            return objIsumo;
        }


        public int registrar_insumo(Insumos objInsumo)
        {
            int resultado = -1;
            cn = cnx.conectar();
            cn.Open();
            try
            {
             
                MySqlCommand cmd = new MySqlCommand("SP_INSUM_INSERT", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("var_int_idinsum", DbType.Int32).Value = objInsumo.in_int_idinsum;
                cmd.Parameters.Add("var_vchar_descr", DbType.String).Value = objInsumo.in_vchar_descr;
                cmd.Parameters.Add("var_int_stock", DbType.Int32).Value = objInsumo.in_int_stock;
                cmd.Parameters.Add("var_int_minstock", DbType.Int32).Value = objInsumo.in_int_minstock;
                cmd.Parameters.Add("var_dec_precio", DbType.Decimal).Value = objInsumo.in_dec_precio;

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

        public int actualizar_insumo(Insumos objInsumo)
        {
            int resultado = -1;
            cn = cnx.conectar();
            cn.Open();
            try
            {
                /*
                var_int_idinsum int ,
                var_vchar_descr varchar(100) ,
                var_int_stock int ,
                var_int_minstock int ,
                var_dec_precio decimal(8,2)
                 */

                MySqlCommand cmd = new MySqlCommand("SP_INSUM_UPDATE", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("var_int_idinsum", DbType.Int32).Value = objInsumo.in_int_idinsum;
                cmd.Parameters.Add("var_vchar_descr", DbType.String).Value = objInsumo.in_vchar_descr;
                cmd.Parameters.Add("var_int_stock", DbType.Int32).Value = objInsumo.in_int_stock;
                cmd.Parameters.Add("var_int_minstock", DbType.Int32).Value = objInsumo.in_int_minstock;
                cmd.Parameters.Add("var_dec_precio", DbType.Decimal).Value = objInsumo.in_dec_precio;

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
