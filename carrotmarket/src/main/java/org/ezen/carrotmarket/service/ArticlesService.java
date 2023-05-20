package org.ezen.carrotmarket.service;

import java.util.List;

import org.ezen.carrotmarket.domain.ArticleVO;
import org.ezen.carrotmarket.domain.ImageVO;
import org.springframework.web.multipart.MultipartFile;

public interface ArticlesService {

	int registerArticles(MultipartFile[] files,ArticleVO article);

	ArticleVO getArticle(int id);

	List<ImageVO> getArticleImage(int id);

}
