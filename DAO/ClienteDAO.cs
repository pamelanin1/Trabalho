
using Trabalho.Interface;
using MySql.Data.MySqlClient;
using Trabalho.Models;
using Trabalho.Utilitarios;

namespace Trabalho.DAO
{
    internal class ClienteDAO : IDao<Cliente>
    {
        public void Create(Cliente cliente )
        {
            try
            {
                string sql = @"INSERT INTO cliente (Nome, Telefone, CPF, Email)
                    VALUES (@Nome, @Telefone, @CPF, @Email)";
                using (var conexao = Conexao.Conectar())
                using (var cmd = new MySqlCommand(sql, conexao))
                {
                    cmd.Parameters.AddWithValue("@Nome", cliente.Nome);
                    cmd.Parameters.AddWithValue("@Telefone", cliente.Telefone);
                    cmd.Parameters.AddWithValue("@CPF", cliente.CPF);
                    cmd.Parameters.AddWithValue("@Email", cliente.Email);
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }
        public void Update(Cliente cliente)
        {
            try
            {
                string sql = @"UPDATE cliente SET Nome = @Nome, Telefone = @Telefone, CPF = @CPF,
                                Email = @Email WHERE id_cliente = @id_cliente;";
                using (var conexao = Conexao.Conectar())
                using (var cmd = new MySqlCommand(sql, conexao))
                {
                    cmd.Parameters.AddWithValue("@Nome", cliente.Nome);
                    cmd.Parameters.AddWithValue("@Telefone", cliente.Telefone);
                    cmd.Parameters.AddWithValue("@CPF", cliente.CPF);
                    cmd.Parameters.AddWithValue("@Email", cliente.Email);
                    cmd.Parameters.AddWithValue("@id_cliente", cliente.id_cliente);

                    var linhas = cmd.ExecuteNonQuery();

                    if (linhas == 0)
                        throw new Exception("Nenhum registro foi atualizado (verifique o id_cliente).");

                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        public void Delete(int id_cliente)
        {
            try
            {
                string sql = "DELETE FROM cliente WHERE id_cliente = @id_cliente";
                using (var conexao = Conexao.Conectar())
                using (var cmd = new MySqlCommand(sql, conexao))
                {
                    cmd.Parameters.AddWithValue("@id_cliente", id_cliente);
                    var LinhasAfetadas = cmd.ExecuteNonQuery();
                    if (LinhasAfetadas == 0)
                        throw new Exception("Nenhum registro encontrado com esse ID.");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        public List<Cliente> GetAll()
        {
            List<Cliente> listaCliente = new List<Cliente>();
            try
            {
                var sql = "SELECT * FROM cliente ORDER BY nome";
                using (var conexao = Conexao.Conectar())
                using (var cmd = new MySqlCommand(sql, conexao))
                {
                    var dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        Cliente c = new Cliente();
                        c.id_cliente = dr.GetInt32("id_cliente");
                        c.Nome = dr.GetString("nome");
                        c.CPF = dr.GetString("cpf");
                        c.Telefone = dr.GetString("telefone");
                        c.Email = dr.GetString("email");

                        listaCliente.Add(c);
                    }
                }
                return listaCliente;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
