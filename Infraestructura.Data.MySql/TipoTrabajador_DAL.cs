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
    public class TipoTrabajador_DAL
    {
        private Conexioncs cnx = new Conexioncs();
        private MySqlConnection cn;

        public List<TipoTrabajador> lista_TipoTrabajador()
        {
            cn = cnx.conectar();
            cn.Open();
            List<TipoTrabajador> lstTipoTrabajador = new List<TipoTrabajador>();

            MySqlDataReader dr = null;


            MySqlCommand cmd = new MySqlCommand("SP_TIPTRABA_LIST", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("x_id", DbType.Int32).Value = 0;
            cmd.Parameters.Add("x_tipo", DbType.String).Value = "A";

            try
            {
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    TipoTrabajador objTipoTrabajador = new TipoTrabajador()
                    {
                        tt_int_idtipotrab = dr.GetInt32(0),
                        tt_vchar_descr    = dr.GetString(1)
                    };

                    lstTipoTrabajador.Add(objTipoTrabajador);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception source", e.Source);
                lstTipoTrabajador = new List<TipoTrabajador>();
            }
            finally
            {
                dr.Close();
                cn.Close();
            }

            return lstTipoTrabajador;
        }

        public TipoTrabajador TipoTrabajador_x_id(int id)
        {
            cn = cnx.conectar();
            cn.Open();

            MySqlDataReader dr = null;
            TipoTrabajador objTipoTrabajador = null;

            MySqlCommand cmd = new MySqlCommand("SP_TIPTRABA_LIST", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("x_id", DbType.Int32).Value = id;
            cmd.Parameters.Add("x_tipo", DbType.String).Value = "F";

            try
            {
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    objTipoTrabajador = new TipoTrabajador()
                    {
                        tt_int_idtipotrab = dr.GetInt32(0),
                        tt_vchar_descr = dr.GetString(1)
                    };
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception source", e.Source);
                objTipoTrabajador = new TipoTrabajador();
            }
            finally
            {
                dr.Close();
                cn.Close();
            }

            return objTipoTrabajador;
        }
    }
}
