

namespace Trabalho.Interface
{
    internal interface IDao<T>
    {
        void Create(T t);

        void Update(T t);

        void Delete(int id);

        List<T> GetAll();
    }
}
