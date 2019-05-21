using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Configuration;
using MySql.Data.MySqlClient;

namespace Infraestructura.Data.MySql
{
    public class Conexioncs
    {
        private MySqlConnection cn;

        public MySqlConnection conectar()
        {
            cn = new MySqlConnection(ConfigurationManager.ConnectionStrings["cn_Catering"].ConnectionString);
            return cn;
        }
    }
}
