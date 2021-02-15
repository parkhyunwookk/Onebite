package com.kh.onebite.recipeLink.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.kh.onebite.common.code.ErrorCode;
import com.kh.onebite.common.exception.DataAccessException;
import com.kh.onebite.common.template.JDBCTemplate;

public class RecipeDao {
	
	JDBCTemplate jdt = JDBCTemplate.getInstance();
	
	public void updateRecipePrice(Connection conn, int price, String itemNumber) {
		PreparedStatement pstm = null;
		
		try {
			String query = "update tb_recipe set rcp_price = ? where rcp_item_number = ? ";
			
			pstm = conn.prepareStatement(query);
			
			pstm.setInt(1, price);
			pstm.setString(2, itemNumber);
			
			pstm.executeUpdate();
			
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.RD02, e);
		}finally {
			jdt.close(pstm);
		}
	}
}
