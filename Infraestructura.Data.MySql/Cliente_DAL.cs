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
    public class Cliente_DAL
    {
        private Conexioncs cnx = new Conexioncs();
        private MySqlConnection cn;

        public List<Cliente> lista_cliente()
        {
            List<Cliente> lstCliente = new List<Cliente>();

            cn = cnx.conectar();
            cn.Open();

            MySqlCommand cmd = new MySqlCommand("", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            MySqlDataReader dr = cmd.ExecuteReader();

            try
            {
                while (dr.Read())
                {
                    Cliente objCliente = new Cliente()
                    {
                        cl_char_dnicliente = dr.GetString(0),
                        cl_varchar_nombre = dr.GetString(1),
                        cl_varchar_apellido = dr.GetString(2),
                        cl_char_sexo = dr.GetString(3),
                        cl_char_telefono = dr.GetString(4),
                        cl_varchar_direccion = dr.GetString(3),
                        cl_varchar_foto = dr.GetString(4),
                        cl_varchar_correo = dr.GetString(4)

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

        public Cliente ver_cliente(string cod)
        {
            Cliente objCliente = null;
            cn = cnx.conectar();
            cn.Open();

            MySqlCommand cmd = new MySqlCommand("", cn);
            cmd.CommandType = CommandType.StoredProcedure;
           /* ese id de donde sale -- no estoy segura ayudaa :v*/
            cmd.Parameters.Add("id", DbType.String).Value = cod;

            MySqlDataReader dr = cmd.ExecuteReader();
            try
            {
                while (dr.Read())
                {
                    objCliente = new Cliente()
                    {
                        cl_char_dnicliente = dr.GetString(0),
                        cl_varchar_nombre = dr.GetString(1),
                        cl_varchar_apellido = dr.GetString(2),
                        cl_char_sexo = dr.GetString(3),
                        cl_char_telefono = dr.GetString(4),
                        cl_varchar_direccion = dr.GetString(3),
                        cl_varchar_foto = dr.GetString(4),
                        cl_varchar_correo = dr.GetString(4)

                    };
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception source", e.Source);
                objCliente = new Cliente();
            }
            finally
            {
                dr.Close();
                cn.Close();
            }

            return objCliente;
        }


        public int registrar_cliente(Cliente objCliente)
        {
            int resultado = -1;
            cn = cnx.conectar();
            cn.Open();
            try
            {
                MySqlCommand cmd = new MySqlCommand("", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("cl_char_dnicliente", DbType.String).
                    Value = objCliente.cl_char_dnicliente;

                cmd.Parameters.Add("cl_varchar_nombre", DbType.String).
                    Value = objCliente.cl_varchar_nombre;

                cmd.Parameters.Add("cl_varchar_apellido", DbType.String).
                    Value = objCliente.cl_varchar_apellido;

                cmd.Parameters.Add("cl_char_sexo", DbType.String).
                    Value = objCliente.cl_char_sexo;

                cmd.Parameters.Add("cl_char_telefono", DbType.String).
                    Value = objCliente.cl_char_telefono;

                cmd.Parameters.Add("cl_varchar_direccion", DbType.String).
                    Value = objCliente.cl_varchar_direccion;

                cmd.Parameters.Add("cl_varchar_foto", DbType.String).
                    Value = objCliente.cl_varchar_foto;

                cmd.Parameters.Add("cl_varchar_correo", DbType.String).
                    Value = objCliente.cl_varchar_correo;

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


        public int actualizar_cliente(Cliente objCliente)
        {
            int resultado = -1;
            cn = cnx.conectar();
            cn.Open();
            try
            {
                MySqlCommand cmd = new MySqlCommand("", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("cl_char_dnicliente", DbType.String).Value = objCliente.cl_char_dnicliente;
                cmd.Parameters.Add("cl_varchar_nombre", DbType.String).Value = objCliente.cl_varchar_nombre;
                cmd.Parameters.Add("cl_varchar_apellido", DbType.String).Value = objCliente.cl_varchar_apellido;
                cmd.Parameters.Add("cl_char_sexo", DbType.String).Value = objCliente.cl_char_sexo;
                cmd.Parameters.Add("cl_char_telefono", DbType.String).Value = objCliente.cl_char_telefono;
                cmd.Parameters.Add("cl_varchar_direccion", DbType.String).Value = objCliente.cl_varchar_direccion;
                cmd.Parameters.Add("cl_varchar_foto", DbType.String).Value = objCliente.cl_varchar_foto;
                cmd.Parameters.Add("cl_varchar_correo", DbType.String).Value = objCliente.cl_varchar_correo;

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
