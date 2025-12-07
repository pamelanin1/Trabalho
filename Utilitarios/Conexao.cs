

using MySql.Data.MySqlClient;

namespace Trabalho.Utilitarios
{
    internal class Conexao
    {
        private const string strconexao =
            "server=localhost;uid=root;port=3306;pwd=root;database=Hotel";
        public static MySqlConnection Conectar()
        {


            MySqlConnection conexao = new MySqlConnection(strconexao);
            try
            {
                conexao.Open();
                return conexao;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }
    }
}
