let cart = () => {
	
	const url = "recipelink/recipeImpl";
	
	let saltPepper = {}
	saltPepper.itemNumber = "2";
	saltPepper.itemCnt = 1;
	
	let headerObj = new Headers();
	headerObj.append("content-type","application/x-www-form-urlencoded");
	
	fetch(url,{
		method: "post",
		headers:headerObj,
		body:"data=" + JSON.stringify(saltPepper)
	})
	.then(response => {
		if(response.ok){
			return response.text();
		}else{
			throw new AsyncResponseError(response.text());
		}
	})
	.then(text => {
		if(text == "success"){
			alert("장바구니에 추가 되었습니다.");
			location.href = "/recipelink/cart";
		}else if(text == "fail"){
			alert("로그인 후 이용 부탁드립니다.");
			history.back();
		}
	}).catch((error)=>{
		error.alertMessage();
	})
}