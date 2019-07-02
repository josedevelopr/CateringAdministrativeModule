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
    public class Tipo_Alimento_DAL
    {

        private Conexioncs cnx = new Conexioncs();
        private MySqlConnection cn;

        //0207201


        public List<Tipo_Alimento> lista_tipoalimento()
        {
            List<Tipo_Alimento> lstAlimento = new List<Tipo_Alimento>();

            cn = cnx.conectar();
            cn.Open();

            MySqlCommand cmd = new MySqlCommand("SELECT * FROM TB_TIPOALIMENTO", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            MySqlDataReader dr = cmd.ExecuteReader();

            try
            {
                while (dr.Read())
                {
                    Tipo_Alimento objTipoAlimento = new Tipo_Alimento()
                    {
                        ta_int_idtipoalim = dr.GetInt32(0),
                        ta_vchar_descr = dr.GetString(1),
                        ta_int_est = dr.GetInt32(2),
                     
                    };
                    lstAlimento.Add(objTipoAlimento);
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

            return lstAlimento;

        }



        public Tipo_Alimento ver_TipoAlimento(int cod)
        {
            Tipo_Alimento objTipoAlimento = null;
            cn = cnx.conectar();
            cn.Open();

            MySqlCommand cmd = new MySqlCommand("SP_TIPALIM_LISTID", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            /* ese id de donde sale -- no estoy segura ayudaa :v*/
            cmd.Parameters.Add("ta_int_idtipoalim", DbType.Int32).Value = cod;

            MySqlDataReader dr = cmd.ExecuteReader();
            try
            {
                while (dr.Read())
                {
                    objTipoAlimento = new Tipo_Alimento()
                    {
                        ta_int_idtipoalim = dr.GetInt32(0),
                        ta_vchar_descr = dr.GetString(1),
                        ta_int_est = dr.GetInt32(2)
                        

                    };
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception source", e.Source);
                objTipoAlimento = new Tipo_Alimento();
            }
            finally
            {
                dr.Close();
                cn.Close();
            }

            return objTipoAlimento;
        }


        public int registrar_TipoAlimento(Tipo_Alimento objTipoAlimento)
        {
            int resultado = -1;
            cn = cnx.conectar();
            cn.Open();
            try
            {
                MySqlCommand cmd = new MySqlCommand("SP_TIPOALIM_INSERT", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("ta_int_idtipoalim", DbType.Int32).
                    Value = objTipoAlimento.ta_int_idtipoalim;

                cmd.Parameters.Add("ta_vchar_descr", DbType.String).
                    Value = objTipoAlimento.ta_vchar_descr;

                cmd.Parameters.Add("ta_int_est", DbType.Int32).
                    Value = objTipoAlimento.ta_int_est;



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


        public int actualizar_Tipoalimento(Tipo_Alimento obTipojAlimento)

        {
            int resultado = -1;
            cn = cnx.conectar();
            cn.Open();
            try
            {
                MySqlCommand cmd = new MySqlCommand("SP_TIPOALIMENTO_UPDATE", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("ta_int_idtipoalim", DbType.Int32).Value = obTipojAlimento.ta_int_idtipoalim;
                cmd.Parameters.Add("ta_vchar_descr", DbType.String).Value = obTipojAlimento.ta_vchar_descr;
                cmd.Parameters.Add("ta_int_est", DbType.Int32).Value = obTipojAlimento.ta_int_est;
              


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
