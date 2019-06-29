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
    public class Trabajador_DAL
    {
        private Conexioncs cnx = new Conexioncs();
        private MySqlConnection cn;

        public List<Trabajador> listar_trabajador()
        {
            List<Trabajador> lstTrabajador = new List<Trabajador>();

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
                    Trabajador objTrabajador = new Trabajador()
                    {
                        idttr_int_idtrabrab = dr.GetInt32(0),
                        tr_int_idusu        = dr.GetInt32(1),
                        tr_int_idtipotrab   = dr.GetInt32(2),
                        tr_vchar_nombre     = dr.GetString(3),
                        tr_vchar_apellido   = dr.GetString(4),
                        tr_char_dni         = dr.GetString(5),
                        tr_vchar_direc      = dr.GetString(6),
                        tr_vchar_foto       = dr.GetString(7),
                        tr_vchar_correo     = dr.GetString(8),
                        tt_vchar_descr      = dr.GetString(9),
                        us_vchar_nomusu     = dr.GetString(10)
                    };
                    lstTrabajador.Add(objTrabajador);
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

            return lstTrabajador;
        }

        public Trabajador lista_x_id_trabajador(int id)
        {
            Trabajador objTrabajador = null;

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
                    objTrabajador = new Trabajador()
                    {
                        idttr_int_idtrabrab = dr.GetInt32(0),
                        tr_int_idusu = dr.GetInt32(1),
                        tr_int_idtipotrab = dr.GetInt32(2),
                        tr_vchar_nombre = dr.GetString(3),
                        tr_vchar_apellido = dr.GetString(4),
                        tr_char_dni = dr.GetString(5),
                        tr_vchar_direc = dr.GetString(6),
                        tr_vchar_foto = dr.GetString(7),
                        tr_vchar_correo = dr.GetString(8),
                        tt_vchar_descr = dr.GetString(9),
                        us_vchar_nomusu = dr.GetString(10)
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

            return objTrabajador;
        }

        public int insertar_or_actualizar_trabajador(Trabajador objTrabajador, string action)
        {
            int resultado = -1;
            cn = cnx.conectar();
            cn.Open();

            try
            {
                MySqlCommand cmd = new MySqlCommand("SP_TRABAJ_INSERT_UPDATE", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("x_int_idtrab", DbType.Int32).Value = objTrabajador.idttr_int_idtrabrab;
                cmd.Parameters.Add("x_int_idusu", DbType.Int32).Value = objTrabajador.tr_int_idusu;
                cmd.Parameters.Add("x_int_idtipotrab", DbType.Int32).Value = objTrabajador.tr_int_idtipotrab;
                cmd.Parameters.Add("x_vchar_nombre", DbType.String).Value = objTrabajador.tr_vchar_nombre;
                cmd.Parameters.Add("x_vchar_apellido", DbType.String).Value = objTrabajador.tr_vchar_apellido;
                cmd.Parameters.Add("x_char_dni", DbType.String).Value = objTrabajador.tr_char_dni;
                cmd.Parameters.Add("x_vchar_direc", DbType.String).Value = objTrabajador.tr_vchar_direc;
                cmd.Parameters.Add("x_vchar_foto", DbType.String).Value = objTrabajador.tr_vchar_foto;
                cmd.Parameters.Add("x_vchar_correo", DbType.String).Value = objTrabajador.tr_vchar_correo;
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
