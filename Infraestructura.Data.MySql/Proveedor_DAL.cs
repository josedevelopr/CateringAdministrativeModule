using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


using Dominio.Core.Entities;
using MySql.Data.MySqlClient;

namespace Infraestructura.Data.MySql
{
    public class Proveedor_DAL
    {
        private Conexioncs cnx = new Conexioncs();
        private MySqlConnection cn;




        public List<Proveedor> listar_proveedor()
        {
            List<Proveedor> lstProveedor = new List<Proveedor>();

            cn = cnx.conectar();
            cn.Open();

            MySqlCommand cmd = new MySqlCommand("SP_PROVE_LIST", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            MySqlDataReader dr = cmd.ExecuteReader();

            try
            {
                while (dr.Read())
                {
                    Proveedor objProveedor = new Proveedor()
                    {
                        pr_int_idprove = dr.GetInt32(0),
                        pr_vchar_nomprove = dr.GetString(1),
                        pr_char_ruc = dr.GetString(2),
                        pr_int_estado = dr.GetInt32(3)
                    };
                    lstProveedor.Add(objProveedor);
                }
            }
            catch(Exception e)
            {
                Console.WriteLine("Exception source", e.Source);
            }
            finally
            {
                dr.Close();
                cn.Close();
            }

            return lstProveedor;
        }

        public Proveedor ver_proveedor(int codigo)
        {
            Proveedor objProveedor=null;
            cn = cnx.conectar();
            cn.Open();

            MySqlCommand cmd = new MySqlCommand("SP_PROVE_LISTID", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("id",DbType.Int32).Value = codigo;

            MySqlDataReader dr = cmd.ExecuteReader();
            try
            {
                while (dr.Read())
                {
                    objProveedor = new Proveedor()
                    {
                        pr_int_idprove = dr.GetInt32(0),
                        pr_vchar_nomprove = dr.GetString(1),
                        pr_char_ruc = dr.GetString(2),                        
                        pr_int_estado = dr.GetInt32(3)
                    };                   
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception source", e.Source);
                objProveedor = new Proveedor();
            }
            finally
            {
                dr.Close();
                cn.Close();
            }

            return objProveedor;
        }

        public int registrar_proveedor(Proveedor objProveedor)
        {
            int resultado = -1;
            cn = cnx.conectar();
            cn.Open(); 
            try
            {
                MySqlCommand cmd = new MySqlCommand("SP_PROVE_INSERT", cn);
                cmd.CommandType = CommandType.StoredProcedure;               
                cmd.Parameters.Add("pr_vchar_nomprove", DbType.String).Value = objProveedor.pr_vchar_nomprove;
                cmd.Parameters.Add("pr_char_ruc", DbType.String).Value = objProveedor.pr_char_ruc;

                resultado = cmd.ExecuteNonQuery();
            }
            catch(Exception e)
            {
                Console.WriteLine("Exception source", e.Source);
            }
            finally
            {
                cn.Close();
            }

            return resultado;
        }

        public int actualizar_proveedor(Proveedor objProveedor)
        {
            int resultado = -1;
            cn = cnx.conectar();
            cn.Open();
            try
            {
                MySqlCommand cmd = new MySqlCommand("SP_PROV_UPDATE", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("var_int_idprove", DbType.Int32).Value = objProveedor.pr_int_idprove;
                cmd.Parameters.Add("var_vchar_nomprove", DbType.String).Value = objProveedor.pr_vchar_nomprove;
                cmd.Parameters.Add("var_char_ruc", DbType.String).Value = objProveedor.pr_char_ruc; 
                cmd.Parameters.Add("var_int_estado", DbType.Int32).Value = objProveedor.pr_int_estado;

                resultado = cmd.ExecuteNonQuery();
            }
            catch(Exception e)
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
