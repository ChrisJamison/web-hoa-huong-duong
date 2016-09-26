using BusinessEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessServices
{
    public interface INewsServices
    {
        NewsEntity GetNewsById(int newsId);
        IEnumerable<NewsEntity> GetAllNews();
        int CreateNews(NewsEntity newsEntity);
        bool UpdateNews(NewsEntity newsEntity);
        bool DeleteNews(int newsId);
    }
}
