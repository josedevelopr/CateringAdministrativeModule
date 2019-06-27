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
            List<Cliente> lstCliente = new List<Cliente>();

            cn = cnx.conectar();
            cn.Open();

            MySqlCommand cmd = new MySqlCommand("SP_CLIENTE_LIST", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("x_id", DbType.Int32).Value = 0;
            cmd.Parameters.Add("x_tipo", DbType.String).Value = "A";

            MySqlDataReader dr = cmd.ExecuteReader();

            try
            {
                while (dr.Read())
                {
                    Cliente objCliente = new Cliente()
                    {
                       cl_char_dniclie  = dr.GetString(0),
                       cl_int_idusu     = dr.GetInt32(1),
                       cl_vchar_nombre  = dr.GetString(2),
                       cl_vchar_apellido = dr.GetString(3),
                       cl_char_sexo     = dr.GetString(4),
                       cl_char_ruc      = dr.GetString(5),
                       cl_char_fono     = dr.GetString(6),
                       cl_vchar_direc   = dr.GetString(7),
                       cl_vchar_foto    = dr.GetString(8),
                       cl_vchar_correo  = dr.GetString(9)
                    };
                    lstCliente.Add(objCliente);
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

            return lstCliente;
        }


        public Cliente lista_x_id_cliente(int id)
        {
            cn = cnx.conectar();
            cn.Open();

            Cliente objCliente = null;

            MySqlCommand cmd = new MySqlCommand("SP_CLIENTE_LIST", cn);

            cmd.Parameters.Add("x_id", DbType.Int32).Value = id;
            cmd.Parameters.Add("x_tipo", DbType.String).Value = "F";

            cmd.CommandType = CommandType.StoredProcedure;
            MySqlDataReader dr = cmd.ExecuteReader();

            try
            {
                while (dr.Read())
                {
                    objCliente = new Cliente()
                    {
                        cl_char_dniclie = dr.GetString(0),
                        cl_int_idusu = dr.GetInt32(1),
                        cl_vchar_nombre = dr.GetString(2),
                        cl_vchar_apellido = dr.GetString(3),
                        cl_char_sexo = dr.GetString(4),
                        cl_char_ruc = dr.GetString(5),
                        cl_char_fono = dr.GetString(6),
                        cl_vchar_direc = dr.GetString(7),
                        cl_vchar_foto = dr.GetString(8),
                        cl_vchar_correo = dr.GetString(9)
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
            return objCliente;
        }
    }
}
