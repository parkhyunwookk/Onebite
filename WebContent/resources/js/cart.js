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
	document.querySelectorAll("input[name='checkRow']:checked").forEach((e)=>{
		let check = confirm("정말 삭제 하시겠습니까?");
		if(check){
			e.parentElement.parentElement.remove();
		}
	})
});
// 삭제 버튼 누르면 행 삭제
let buttonList = () =>{
	document.querySelectorAll("button:hover").forEach((e)=>{
		let check = confirm("정말 삭제 하시겠습니까?");
		if(check){
			
			let xhr = new XMLHttpRequest();
			xhr.open('POST','/recipelink/cartDelete');
			xhr.setRequestHeader("content-type","application/x-www-form-urlencoded");
			xhr.send("data=" + e.value);
			
			e.parentElement.parentElement.remove();
		}
		
	});
}




