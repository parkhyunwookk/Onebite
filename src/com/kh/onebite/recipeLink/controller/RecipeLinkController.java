package com.kh.onebite.recipeLink.controller;

import java.io.IOException;
import java.util.List;
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
import com.kh.onebite.recipeLink.model.service.RecipeService;
import com.kh.onebite.recipeLink.model.vo.Cart;

/**
 * Servlet implementation class RecipeLinkController
 */
@WebServlet("/recipelink/*")
public class RecipeLinkController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    CartService cartService = new CartService();
    private RecipeService recipeService = new RecipeService();
    
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
		case "cartDelete" : cartDelete(request, response);
			break;
		case "cartUpdate" : cartUpdate(request, response);
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
		
		session.setAttribute("userData", jsonData); //userId 정보가 다른곳에서 필요할 경우 사용
		
		if(member != null ) {
			Cart cart = new Cart();
			String itemNumber = (String) jsonMap.get("itemNumber");
			double doubleitemCnt = (double) jsonMap.get("itemCnt");
			int itemCnt = (int) doubleitemCnt;
			
			cart.setUserId(member.getUserId());
			cart.setItemNumber(itemNumber);
			cart.setItemCnt(itemCnt); 
			
			cartService.insertCart(cart); //장바구니 cart테이블 저장	
			
			response.getWriter().print("success");
			
		}else {
			response.getWriter().print("fail");
		}
		
	}
	
	private void cartPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("userId");
		String user = member.getUserId();
		
		//장바구니에 글씨를 출력해주는 역할
		List<Cart> cartList = cartService.selectCartList(user);
		request.setAttribute("cartList", cartList);
		
		//래시피 가격 합계 계산 
		int price = 0;
		for (Cart cart : cartList) {
			price += cart.getRecipe().getRcpPrice();
			
		}
		request.setAttribute("sum", price);
		
		request.getRequestDispatcher("/WEB-INF/view/recipe_link/cart.jsp")
		.forward(request, response);
	}
	
	private void cartDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jsonData = request.getParameter("data");
		
		Gson gsonDelete = new Gson();
		Map<String, Object> jsonMap = gsonDelete.fromJson(jsonData, Map.class);
		
		String itemNumber = (String) jsonMap.get("itemNumber");
		double doublePrice = (double) jsonMap.get("price");
		int price = (int) doublePrice;
		//System.out.println("price : " + stringPrice);
		//USER가 있을때만 삭제 
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("userId"); 
		session.setAttribute("itemNumber", itemNumber);
		
		if(member != null && itemNumber != null) {  
			//재료 삭제 하면서 가격을 리셋 한다.
			recipeService.updateRecipePrice(price, itemNumber);
			//그이후 삭제 한다.
			cartService.deleteCart(itemNumber);
			
			response.getWriter().print("delete");
		}
	}
	
	private void cartUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jsonData = request.getParameter("data");
		
		Gson gsonUpdate = new Gson();
		Map<String,Object> jsonMap = gsonUpdate.fromJson(jsonData, Map.class);
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("userId");
		
		
		if(member != null ) {
			
			// 수량 업데이트 
			String doublecountUpdate = (String) jsonMap.get("countUpdate");
			int countUpdate = Integer.parseInt(doublecountUpdate);
			String userId = member.getUserId();
			
			// 수량 * 가격 = 합계 업데이트 
			double doublesumUpdate = (double) jsonMap.get("sumUpdate");
			int sumUpdate = (int) doublesumUpdate;
			
			String rcpItemNumber = (String) jsonMap.get("itemNumber");
			
			cartService.updateCartItemCnt(countUpdate, userId);
			cartService.updateCartRcpPrice(sumUpdate, rcpItemNumber);
			
			response.getWriter().print("success");
			
		}else {
			//response.getWriter().print("fail");
		}
	}

}
