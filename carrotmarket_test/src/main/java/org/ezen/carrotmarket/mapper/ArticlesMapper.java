package org.ezen.carrotmarket.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.ezen.carrotmarket.domain.ArticleVO;
import org.ezen.carrotmarket.domain.ImageVO;

@Mapper
public interface ArticlesMapper {

	int registerArticles(ArticleVO article);
	
	void registerImg(ImageVO imageVO);

	int getLastId();

	ArticleVO getArticle(int id);

	List<ImageVO> getArticleImage(int id);

	
	
}
