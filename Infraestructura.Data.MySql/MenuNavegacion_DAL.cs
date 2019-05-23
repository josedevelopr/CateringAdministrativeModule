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
    public class MenuNavegacion_DAL
    {
        private Conexioncs cnx = new Conexioncs();
        private MySqlConnection cn;

        public List<MenuNavegacion> lista_menu_navegacion_usuario(string correo)
        {
            List<MenuNavegacion> lstMenuNavegacion = new List<MenuNavegacion>() ;
            cn = cnx.conectar();
            cn.Open();
            
            MySqlCommand cmd = new MySqlCommand("SP_USU_MENUACCES", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("us_correo", DbType.String).Value = correo;

            MySqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {

                MenuNavegacion obMenunav =  new MenuNavegacion()
                {
                    am_int_idarchivo = dr.GetInt32(0),
                    am_vchar_descr  = dr.GetString(1),
                    am_vchar_cntrl = dr.GetString(2),
                    am_vchar_nombr = dr.GetString(3),
                    tu_vchar_descr = dr.GetString(4)
                };

                lstMenuNavegacion.Add(obMenunav);
            }

            dr.Close();
            cn.Close();

            return lstMenuNavegacion;
        }
    }
}
