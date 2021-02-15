package com.kh.onebite.recipeLink.model.service;

import java.sql.Connection;

import com.kh.onebite.common.exception.DataAccessException;
import com.kh.onebite.common.template.JDBCTemplate;
import com.kh.onebite.recipeLink.model.dao.RecipeDao;

public class RecipeService {
	
	JDBCTemplate jdt = JDBCTemplate.getInstance();
	private RecipeDao recipeDao = new RecipeDao();
	
	
	public void updateRecipePrice(int price, String itemNumber) {
		Connection conn = jdt.getConnection();
		
		try {
			recipeDao.updateRecipePrice(conn, price, itemNumber);
		} catch (DataAccessException e) {
			jdt.rollback(conn);
		}finally {
			jdt.close(conn);
		}
	}
}
