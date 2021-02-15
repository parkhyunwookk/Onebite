package com.kh.onebite.recipeLink.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.onebite.common.code.ErrorCode;
import com.kh.onebite.common.exception.DataAccessException;
import com.kh.onebite.common.template.JDBCTemplate;
import com.kh.onebite.recipeLink.model.vo.Cart;
import com.kh.onebite.recipeLink.model.vo.Recipe;

public class CartDao {
	
	JDBCTemplate jdt = JDBCTemplate.getInstance();
	
	//Cart 아이디, 갯수, 재품번호 등록
	public void insertCart(Connection conn, Cart cart) {
		
		String query = "insert into tb_cart "
				+ "(c_idx, user_Id, item_number, item_cnt) "
				+ "values('c' || sc_cart_idx.nextval,?,?,?) ";
		
		PreparedStatement pstm = null;
		
		try {
			pstm = conn.prepareStatement(query);
			
			pstm.setString(1, cart.getUserId());
			pstm.setString(2, cart.getItemNumber());
			pstm.setInt(3, cart.getItemCnt());
			
			pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			throw new DataAccessException(ErrorCode.RB01, e);
		}finally {
			jdt.close(pstm);
		}
	}
	//USER가 저장한 장바구니의 데이터를 가져오기
	public List<Cart> selectCartList(Connection conn, String userId) {
		Cart cart = null;
		Recipe recipe = null;
		List<Cart> cartList = new ArrayList<Cart>();
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		String query = "select tc.user_id, tc.item_number, tc.item_date, tc.item_cnt, tr.rcp_item_number ,tr.rcp_title, tr.rcp_price, tr.rcp_cnt "
				+ "from tb_cart tc "
				+ "inner join tb_recipe tr on(tr.rcp_item_number = tc.item_number) "
				+ "where user_id = ? ";
		
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, userId);
			//pstm.setString(2, itemNumber);
			rset = pstm.executeQuery();
			
			while(rset.next()) {
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
				
				cartList.add(cart);
			
			}
			
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.CR01, e);
		}finally {
			jdt.close(rset, pstm);
		}
		
		return cartList;
	}
	//USER의 장바구니 삭제 이벤트 발생시 DB삭제
	public void deleteCart(Connection conn, String itemNumber) {
		PreparedStatement pstm = null;
		
		try {
			String query = "delete from tb_cart where item_number = ? ";
			
			pstm = conn.prepareStatement(query);
			
			pstm.setString(1, itemNumber);
			
			pstm.executeUpdate();
			
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.RD01, e);
		}finally {
			jdt.close(pstm);
		}
	}
	
	public void updateCartItemCnt(Connection conn, int itemCnt, String userId) {
		PreparedStatement pstm = null;
		
		try {
			String query = "update tb_cart set item_cnt = ? where user_id = ? ";
			
			pstm = conn.prepareStatement(query);
			
			pstm.setInt(1, itemCnt);
			pstm.setString(2, userId);
			
			pstm.executeUpdate();
			
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.RU01, e);
		}finally {
			jdt.close(pstm);
		}
	}
	
	public void updateCartRcpPrice(Connection conn, int rcpPrice, String rcpItemNumber) {
		PreparedStatement pstm = null;
		
		try {
			String query = "update tb_recipe set rcp_price = ? where rcp_item_number = ? ";
			
			pstm = conn.prepareStatement(query);
			
			pstm.setInt(1, rcpPrice);
			pstm.setString(2, rcpItemNumber);
			
			pstm.executeUpdate();
			
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.RU02, e);
		}finally {
			jdt.close(pstm);
		}
	}
	
	
	
	
}
