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

        public List<Catering> listar_catering()
        {
            List<Catering> lstCatering = new List<Catering>();

            cn = cnx.conectar();
            cn.Open();

            MySqlCommand cmd = new MySqlCommand("SP_TRABAJ_LIST", cn);
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
                        ca_char_estado = dr.GetString(2),
                        ca_char_dniclie = dr.GetString(3),
                        ca_int_idtrab   =dr.GetInt32(4),
                        ca_vchar_encargadonom = dr.GetString(5),
                        ca_char_nomclie = dr.GetString(6)
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

            MySqlCommand cmd = new MySqlCommand("SP_TRABAJ_LIST", cn);
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
                        ca_char_dniclie = dr.GetString(3),
                        ca_int_idtrab = dr.GetInt32(4),
                        ca_vchar_encargadonom = dr.GetString(5),
                        ca_char_nomclie = dr.GetString(6)
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

        public int insertar_or_actualizar_trabajador(Trabajador objTrabajador, string action)
        {
            int resultado = -1;
            cn = cnx.conectar();
            cn.Open();

            try
            {
                MySqlCommand cmd = new MySqlCommand("SP_CATE_INSERT_UPDATE", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("x_int_idcater", DbType.Int32).Value = objTrabajador.tr_int_idtrab;
                cmd.Parameters.Add("x_date_fecha", DbType.String).Value = objTrabajador.tr_int_idusu;
                cmd.Parameters.Add("x_char_estado", DbType.String).Value = objTrabajador.tr_int_idtipotrab;
                cmd.Parameters.Add("x_vchar_lugarcater", DbType.String).Value = objTrabajador.tr_vchar_nombre;
                cmd.Parameters.Add("x_char_dniclie", DbType.String).Value = objTrabajador.tr_vchar_apellido;
                cmd.Parameters.Add("x_int_idtrab", DbType.Int32).Value = objTrabajador.tr_char_dni;
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
