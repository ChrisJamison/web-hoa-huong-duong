using AutoMapper;
using BusinessEntities;
using DataModel;
using DataModel.UnitOfWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;

namespace BusinessServices
{
    public class NewsServices : INewsServices
    {
        private readonly UnitOfWork _unitOfWork;

        public NewsServices()
        {
            _unitOfWork = new UnitOfWork();
        }
        public BusinessEntities.NewsEntity GetNewsById(int newsId)
        {
            var news = _unitOfWork.NewsRepository.GetById(newsId);
            if (news != null)
            {
                var newsModel = Mapper.Map<News, NewsEntity>(news);
                return newsModel;
            }
            return null;
        }

        public IEnumerable<BusinessEntities.NewsEntity> GetAllNews()
        {
            var news = _unitOfWork.NewsRepository.GetAll();
            if (news != null)
            {
                var newsModel = Mapper.Map<IEnumerable<News>, IEnumerable<NewsEntity>>(news);
                return newsModel;
            }
            return null;
        }

        public int CreateNews(BusinessEntities.NewsEntity newsEntity)
        {
            using (var scope = new TransactionScope())
            {
                var news = Mapper.Map<NewsEntity, News>(newsEntity);
                _unitOfWork.NewsRepository.Insert(news);
                _unitOfWork.Save();
                scope.Complete();
                return news.News_ID;
            }
        }

        public bool UpdateNews(BusinessEntities.NewsEntity newsEntity)
        {
            var success = false;
            if (newsEntity != null)
            {
                using (var scope = new TransactionScope())
                {
                    var news = Mapper.Map<NewsEntity, News>(newsEntity);
                    _unitOfWork.NewsRepository.Update(news);
                    _unitOfWork.Save();
                    scope.Complete();
                    success = true;
                }
            }

            return success;
        }

        public bool DeleteNews(int newsId)
        {
            var success = false;
            if (newsId > 0)
            {
                var news = _unitOfWork.NewsRepository.GetById(newsId);
                if (news != null)
                {
                    using (var scope = new TransactionScope())
                    {
                        _unitOfWork.NewsRepository.Delete(news);
                        _unitOfWork.Save();
                        scope.Complete();
                        success = true;
                    }
                }
            }
            return success;
        }
    }
}
