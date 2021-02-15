function $(selector,text) {
	if(text){
		document.querySelector(selector).innerHTML += `${text}<br>`;
	}
		
	return document.querySelector(selector);
}

// 체크박스 전체 선택
$('.all').addEventListener('click', ()=>{
	document.querySelectorAll('.item_recipe').forEach((e)=>{
		if($('.all').checked){
			e.checked = true;
		}else{
			e.checked = false;
		}
	})
});

// 체크박스 선택 삭제
$('.button_clear').addEventListener('click', ()=>{
	let check = confirm("정말 삭제 하시겠습니까?");
	
	if(check){
		document.querySelectorAll("input[name='checkRow']:checked").forEach((e)=>{
			
			let priceValue = e.parentElement.parentElement.querySelector("#priceValue").value;
			let count = e.parentElement.parentElement.querySelector("#itemButton").value;
			let divisionPrice = priceValue / count;
			
			let deleteRecipe = {};
			deleteRecipe.itemNumber = e.value;
			deleteRecipe.price = divisionPrice;
			
			let xhr = new XMLHttpRequest();
			xhr.open('POST','/recipelink/cartDelete');
			xhr.setRequestHeader("content-type","application/x-www-form-urlencoded");
			xhr.send("data=" + JSON.stringify(deleteRecipe));
			
			xhr.onreadystatechange = () =>{
				if(xhr.status == 200){
					if(xhr.responseText == "delete"){
						location.href = "/recipelink/cart";
					}
				}else{
					error.alertMessge();
				}
			}
			
			e.parentElement.parentElement.remove();
		})
	}
	
});

// 삭제 버튼 누르면 행 삭제
let buttonList = () =>{
	document.querySelectorAll("button:hover").forEach((e)=>{
		let check = confirm("정말 삭제 하시겠습니까?");
		if(check){
			
			let priceValue = e.parentElement.parentElement.querySelector("#priceValue").value;
			let count = e.parentElement.parentElement.querySelector("#itemButton").value;
			let divisionPrice = priceValue / count;
			
			let deleteRecipe = {};
			deleteRecipe.itemNumber = e.value;
			deleteRecipe.price = divisionPrice;
			
			let xhr = new XMLHttpRequest();
			xhr.open('POST','/recipelink/cartDelete');
			xhr.setRequestHeader("content-type","application/x-www-form-urlencoded");
			xhr.send("data=" + JSON.stringify(deleteRecipe));
			
			xhr.onreadystatechange = () =>{
				if(xhr.status == 200){
					if(xhr.responseText == "delete"){
						location.href = "/recipelink/cart";
					}
				}
			}
			
			e.parentElement.parentElement.remove();
			
			
		}
	});
}

// 수량 버튼 이벤트
let countList = () =>{
	document.querySelectorAll("input[type='number']:hover").forEach((e)=>{
		//수량 이벤트 숫자 +,- 
		let count = e.value;
		// 재료 가격
		let priceValue = e.parentElement.parentElement.querySelector("#priceValue").value;
		let number = e.parentElement.parentElement.querySelector("#itemButton").value;
		
		let sum = priceValue * count
		console.log(sum);
		
		if(count > 0){
			
			const url = "recplelink/cartUpdate";
			let countPirceUpdate = {};
			countPirceUpdate.countUpdate = count;
			countPirceUpdate.sumUpdate = sum;
			countPirceUpdate.itemNumber = number;
			
			let headerObj = new Headers();
			headerObj.append("content-type","application/x-www-form-urlencoded");
			
			fetch(url,{
				method:"post",
				headers:headerObj,
				body:"data=" + JSON.stringify(countPirceUpdate)
			})
			.then(response =>{
				if(response.ok){
					return response.text();
				}else{
					throw new AsyncResponseError(response.text());
				}
			})
			.then(text => {
				if(text == "success"){
					location.href = "/recipelink/cart";
				}
			}).catch((error)=>{
				error.alertMessge();
			})
		}else{
			count = 1;
		}
	});
}





