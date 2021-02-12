package com.kh.onebite.recipeLink.model.service;

import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import com.kh.onebite.common.exception.DataAccessException;
import com.kh.onebite.common.exception.ToAlertException;
import com.kh.onebite.common.template.JDBCTemplate;
import com.kh.onebite.recipeLink.model.dao.CartDao;
import com.kh.onebite.recipeLink.model.vo.Cart;

public class CartService {
	
	JDBCTemplate jdt = JDBCTemplate.getInstance();
	private CartDao cartDao = new CartDao();
	
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
	
	public Map<String,Object> selectCartDetail(String userId, String itemNumber){
		Map<String,Object> commandMap = new HashMap<String,Object>();
		Connection conn = jdt.getConnection();
		
		try {
			Cart cart = cartDao.selectCartDetail(conn, userId, itemNumber);
			commandMap.put("cart", cart);
		}finally {
			jdt.close(conn);
		}
		
		return commandMap;
	}
}
