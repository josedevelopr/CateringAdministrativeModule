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
    public class IngredienteDetalleAlimento_DAL
    {

        private Conexioncs cnx = new Conexioncs();
        private MySqlConnection cn;




       /* public List<IngredienteDetalleAlimento> lista_DIngAlimento()
        {
            List<IngredienteDetalleAlimento> lstIngreDeAlim = new List<IngredienteDetalleAlimento>();

            cn = cnx.conectar();
            cn.Open();

            MySqlCommand cmd = new MySqlCommand("", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            MySqlDataReader dr = cmd.ExecuteReader();

            try
            {
                while (dr.Read())
                {
                    IngredienteDetalleAlimento objDetalleIngA = new IngredienteDetalleAlimento()
                    {
                        is_int_idingralim = dr.GetInt32(0),
                        is_int_idalim = dr.GetInt32(1),
                        is_date_feccrea = dr.GetDateTime(2),
                        dta_int_iddetingrealim = dr.GetInt32(3),
                        dta_int_idinsum = dr.GetInt32(4),
                        dta_int_cantidad=dr.GetInt32(5)
                    };
                    lstIngreDeAlim.Add(objDetalleIngA);
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

            return lstIngreDeAlim;

        }



        public Alimento ver_InDetaAl(int cod)
        {
            IngredienteDetalleAlimento objDeIngAl = null;
            cn = cnx.conectar();
            cn.Open();

            MySqlCommand cmd = new MySqlCommand("", cn);
            cmd.CommandType = CommandType.StoredProcedure;
      
            cmd.Parameters.Add("al_int_idalim", DbType.Int32).Value = cod;

            MySqlDataReader dr = cmd.ExecuteReader();
            try
            {
                while (dr.Read())
                {
                    objAlimento = new Alimento()
                    {
                        al_int_idalim = dr.GetInt32(0),
                        al_vchar_descr = dr.GetString(1),
                        al_int_idtipoalim = dr.GetInt32(2),
                        al_dec_precalim = dr.GetDecimal(3),
                        al_int_est = dr.GetInt32(4)

                    };
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception source", e.Source);
                objAlimento = new Alimento();
            }
            finally
            {
                dr.Close();
                cn.Close();
            }

            return objAlimento;
        }


        public int registrar_Alimento(Alimento objAlimento)
        {
            int resultado = -1;
            cn = cnx.conectar();
            cn.Open();
            try
            {
                MySqlCommand cmd = new MySqlCommand("SP_ALIM_INSERT", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("al_int_idalim", DbType.Int32).
                    Value = objAlimento.al_int_idalim;

                cmd.Parameters.Add("al_vchar_descr", DbType.String).
                    Value = objAlimento.al_vchar_descr;

                cmd.Parameters.Add("al_int_idtipoalim", DbType.Int32).
                    Value = objAlimento.al_int_idtipoalim;

                cmd.Parameters.Add("al_dec_precalim", DbType.Decimal).
                    Value = objAlimento.al_dec_precalim;

                cmd.Parameters.Add("al_int_est", DbType.Int32).
                    Value = objAlimento.al_int_est;


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


        public int actualizar_alimento(Alimento objAlimento)

        {
            int resultado = -1;
            cn = cnx.conectar();
            cn.Open();
            try
            {
                MySqlCommand cmd = new MySqlCommand("SP_ALIM_UPDATE", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("al_int_idalim", DbType.Int32).Value = objAlimento.al_int_idalim;
                cmd.Parameters.Add("al_vchar_descr", DbType.String).Value = objAlimento.al_vchar_descr;
                cmd.Parameters.Add("al_int_idtipoalim", DbType.String).Value = objAlimento.al_int_idtipoalim;
                cmd.Parameters.Add("al_dec_precalim", DbType.String).Value = objAlimento.al_dec_precalim;
                cmd.Parameters.Add("al_int_est", DbType.String).Value = objAlimento.al_int_est;



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




    */


    }
}
