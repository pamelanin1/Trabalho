using Trabalho.Utilitarios;
using Trabalho.DAO;
using Trabalho.Models;

namespace Trabalho
{
    internal class Program
    {
        static void Main(string[] args)
        {
            ClienteDAO dao = new ClienteDAO();
            int opcao;

            do
            {
                Console.Clear();
                Console.WriteLine("====== MENU CLIENTE ======");
                Console.WriteLine("1 - Cadastrar Cliente");
                Console.WriteLine("2 - Atualizar Cliente");
                Console.WriteLine("3 - Deletar Cliente");
                Console.WriteLine("4 - Listar Clientes");
                Console.WriteLine("0 - Sair");
                Console.WriteLine("==========================");
                Console.Write("Escolha uma opção: ");

                int.TryParse(Console.ReadLine(), out opcao);
                Console.Clear();

                switch (opcao)
                {
                    case 1:
                        Cadastrar(dao);
                        break;

                    case 2:
                        Atualizar(dao);
                        break;

                    case 3:
                        Deletar(dao);
                        break;

                    case 4:
                        Listar(dao);
                        break;

                    case 0:
                        Console.WriteLine("Saindo...");
                        break;

                    default:
                        Console.WriteLine("Opção inválida!");
                        break;
                }

                if (opcao != 0)
                {
                    Console.WriteLine("\nPressione ENTER para continuar...");
                    Console.ReadLine();
                }

            } while (opcao != 0);
        }

        
        static void Cadastrar(ClienteDAO dao)
        {
            try
            {
                Cliente c = new Cliente();

                Console.WriteLine("=== CADASTRO DE CLIENTE ===");

                Console.Write("Nome: ");
                c.Nome = Console.ReadLine();

                Console.Write("Telefone: ");
                c.Telefone = Console.ReadLine();

                Console.Write("CPF: ");
                c.CPF = Console.ReadLine();

                Console.Write("Email: ");
                c.Email = Console.ReadLine();

                dao.Create(c);
                Console.WriteLine("\nCliente cadastrado com sucesso!");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Erro ao cadastrar: " + ex.Message);
            }
        }

        
        static void Atualizar(ClienteDAO dao)
        {
            try
            {
                Cliente c = new Cliente();

                Console.WriteLine("=== ATUALIZAR CLIENTE ===");

                Console.Write("ID do cliente: ");
                c.id_cliente = int.Parse(Console.ReadLine());

                Console.Write("Novo Nome: ");
                c.Nome = Console.ReadLine();

                Console.Write("Novo Telefone: ");
                c.Telefone = Console.ReadLine();

                Console.Write("Novo CPF: ");
                c.CPF = Console.ReadLine();

                Console.Write("Novo Email: ");
                c.Email = Console.ReadLine();

                dao.Update(c);
                Console.WriteLine("\nCliente atualizado com sucesso!");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Erro ao atualizar: " + ex.Message);
            }
        }

        
        static void Deletar(ClienteDAO dao)
        {
            try
            {
                Console.WriteLine("=== DELETAR CLIENTE ===");

                Console.Write("ID do cliente: ");
                int id = int.Parse(Console.ReadLine());

                dao.Delete(id);
                Console.WriteLine("\nCliente deletado com sucesso!");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Erro ao deletar: " + ex.Message);
            }
        }

        
        static void Listar(ClienteDAO dao)
        {
            try
            {
                Console.WriteLine("=== LISTA DE CLIENTES ===");

                var lista = dao.GetAll();

                if (lista.Count == 0)
                {
                    Console.WriteLine("Nenhum cliente encontrado!");
                    return;
                }

                foreach (var c in lista)
                {
                    Console.WriteLine(
                        $"ID: {c.id_cliente}  |  Nome: {c.Nome}  |  CPF: {c.CPF}  |  Telefone: {c.Telefone}  |  Email: {c.Email}"
                    );
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Erro ao listar: " + ex.Message);
            }
        }
    }
}

