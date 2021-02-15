package com.kh.onebite.recipeLink.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import com.kh.onebite.common.exception.DataAccessException;
import com.kh.onebite.common.exception.ToAlertException;
import com.kh.onebite.common.template.JDBCTemplate;
import com.kh.onebite.recipeLink.model.dao.CartDao;
import com.kh.onebite.recipeLink.model.vo.Cart;

public class CartService {
	
	JDBCTemplate jdt = JDBCTemplate.getInstance();
	private CartDao cartDao = new CartDao();
	
	//레시피 재료 DB 저장
	public void insertCart(Cart cart) {
		Connection conn = jdt.getConnection();
		
		try {
			cartDao.insertCart(conn, cart);
		} catch (DataAccessException e) {
			jdt.rollback(conn);
			throw new ToAlertException(e.error,e);
		}finally {
			jdt.close(conn);
		}
	}
	
	//USER가 저장한 장바구니의 데이터를 가져오기
	public List<Cart> selectCartList(String userId){
		List<Cart> cartList = new ArrayList<Cart>();
		Connection conn = jdt.getConnection();
		
		try {
			cartList = cartDao.selectCartList(conn, userId);
		
		}finally {
			jdt.close(conn);
		}
		
		return cartList;
	}
	
	//USER의 장바구니 삭제 이벤트 발생시 DB삭제
	public void deleteCart(String itemNumber) {
		Connection conn = jdt.getConnection();
		
		try {
			cartDao.deleteCart(conn, itemNumber);
		} catch (DataAccessException e) {
			jdt.rollback(conn);
		}finally {
			jdt.close(conn);
		}
	}
	
	public void updateCartItemCnt(int itemCnt, String userId) {
		Connection conn = jdt.getConnection();
		
		try {
			cartDao.updateCartItemCnt(conn, itemCnt, userId);
		} catch (DataAccessException e) {
			jdt.rollback(conn);
		}finally {
			jdt.close(conn);
		}
	}
	
	public void updateCartRcpPrice(int rcpPrice, String rcpItemNumber) {
		Connection conn = jdt.getConnection();
		
		try {
			cartDao.updateCartRcpPrice(conn, rcpPrice, rcpItemNumber);
		} catch (DataAccessException e) {
			jdt.rollback(conn);
		}finally {
			jdt.close(conn);
		}
	}
}
