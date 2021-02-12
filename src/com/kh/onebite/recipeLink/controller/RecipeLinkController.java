package com.kh.onebite.recipeLink.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.kh.onebite.member.model.vo.Member;
import com.kh.onebite.recipeLink.model.service.CartService;
import com.kh.onebite.recipeLink.model.vo.Cart;

/**
 * Servlet implementation class RecipeLinkController
 */
@WebServlet("/recipelink/*")
public class RecipeLinkController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    CartService cartService = new CartService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeLinkController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] uriArr = request.getRequestURI().split("/");
		
		switch (uriArr[uriArr.length-1]) {
		case "link_page": likePage(request, response);
			break;
		case "steak" : steakPage(request, response);
			break;
		case "recipeImpl" : recipeImpl(request, response);
			break;
		case "koreanBeaf" : koreanBeafPage(request, response);
			break;
		case "saltPepper" : saltPepperPage(request, response);
			break;
		case "cart" : cartPage(request, response);
			break;
		
		
		default: response.setStatus(404);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void likePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/recipe_link/link_page.jsp")
		.forward(request, response);
	}
	
	private void steakPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/recipe_link/steak.jsp")
		.forward(request, response);
	}
	
	private void koreanBeafPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/recipe_link/koreanBeaf.jsp")
		.forward(request, response);
	}
	
	private void saltPepperPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/recipe_link/saltPepper.jsp")
		.forward(request, response);
	}
	
	private void recipeImpl(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jsonData = request.getParameter("data");
		
		Gson gson = new Gson(); 
		Map<String,Object> jsonMap = gson.fromJson(jsonData, Map.class);
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("userId");
		session.setAttribute("data", jsonData);
		
		if(member != null ) {
			Cart cart = new Cart();
			String itemNumber = (String) jsonMap.get("itemNumber");
			double itemCnt = (double) jsonMap.get("itemCnt");
			
			cart.setUserId(member.getUserId());
			cart.setItemNumber(itemNumber);
			cart.setItemCnt(itemCnt); 
			
			//cartService.insertCart(cart); //장바구니 cart테이블 저장			
			

			response.getWriter().print("success");
		}else {
			response.getWriter().print("fail");
		}
		
	}
	
	private void cartPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("userId");
		
		//재료테이블에 재료넘버를 가져와서 선택한 재료를 뿌려주기 위한 session
		String jsonData = (String) session.getAttribute("data");
		
		Gson gson = new Gson(); 
		Map<String,Object> jsonMap = gson.fromJson(jsonData, Map.class);
		
		String user = member.getUserId();
		String itemNumber = (String) jsonMap.get("itemNumber");
		//장바구니에 글씨를 출력해주는 역할
		// [update 예정] userId에 저장한 데이터만 출력 하기 위해선 itemNumber는 필요없다
		// 일단 다른곳에서 먼저 손을 본 후에 작업하자.
		Map<String,Object> commandMap = cartService.selectCartDetail(user, itemNumber);
		request.setAttribute("cartData", commandMap);
		
		request.getRequestDispatcher("/WEB-INF/view/recipe_link/cart.jsp")
		.forward(request, response);
	}

}
