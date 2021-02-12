package com.kh.onebite.recipeLink.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kh.onebite.common.code.ErrorCode;
import com.kh.onebite.common.exception.DataAccessException;
import com.kh.onebite.common.template.JDBCTemplate;
import com.kh.onebite.recipeLink.model.vo.Cart;
import com.kh.onebite.recipeLink.model.vo.Recipe;

public class CartDao {
	
	JDBCTemplate jdt = JDBCTemplate.getInstance();
	
	public void insertCart(Connection conn, Cart cart) {
		
		String sql = "insert into tb_cart "
				+ "(c_idx, user_Id, item_number, item_cnt) "
				+ "values('c' || sc_cart_idx.nextval,?,?,?) ";
		
		PreparedStatement pstm = null;
		
		try {
			pstm = conn.prepareStatement(sql);
			
			pstm.setString(1, cart.getUserId());
			pstm.setString(2, cart.getItemNumber());
			pstm.setDouble(3, cart.getItemCnt());
			
			pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			throw new DataAccessException(ErrorCode.RB01, e);
		}finally {
			jdt.close(pstm);
		}
	}
	
	public Cart selectCartDetail(Connection conn, String userId, String itemNumber) {
		Cart cart = null;
		Recipe recipe = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		String sql = "select tc.user_id, tc.item_number, tc.item_date, tc.item_cnt, tr.rcp_item_number ,tr.rcp_title, tr.rcp_price, tr.rcp_cnt "
				+ "from tb_cart tc "
				+ "inner join tb_recipe tr on(tr.rcp_item_number = tc.item_number) "
				+ "where user_id = ? and item_number = ? ";
		
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, userId);
			pstm.setString(2, itemNumber);
			rset = pstm.executeQuery();
			
			if(rset.next()) {
				cart = new Cart();
				cart.setUserId(rset.getString(1));
				cart.setItemNumber(rset.getString(2));
				cart.setItemDate(rset.getDate(3));
				cart.setItemCnt(rset.getInt(4));
				
				
				recipe = new Recipe();
				recipe.setRcpitemNumber(rset.getString(5));
				recipe.setRcpTitle(rset.getString(6));
				recipe.setRcpPrice(rset.getInt(7));
				recipe.setRcpCnt(rset.getInt(8));
				
				cart.setRecipe(recipe);
			}
			
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.CR01, e);
		}finally {
			jdt.close(rset, pstm);
		}
		
		return cart;
	}
	
	
	
	
	
	
	
	
}
