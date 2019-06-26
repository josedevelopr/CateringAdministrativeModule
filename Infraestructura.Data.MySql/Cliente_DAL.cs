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
    public class Cliente_DAL
    {
        private Conexioncs cnx = new Conexioncs();
        private MySqlConnection cn;

        public List<Cliente> listar_cliente()
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
            catch (Exception e)
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
    }
}
