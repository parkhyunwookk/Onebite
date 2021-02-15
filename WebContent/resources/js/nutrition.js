

//식품영양정보 표시

document.querySelector('#btn_search').addEventListener('click', async () => {
	let sel = document.querySelector('#select_info>option:checked').value;
	alert(sel);//확인용
	if(sel =='nutri_info'){
	const API_KEY = "83679b5f006e4ce497f6";
	let keyword = document.querySelector('#keyword').value;
	const url = "http://openapi.foodsafetykorea.go.kr/api/" + API_KEY + "/I2790/json/1/1000/DESC_KOR=" + keyword;
	const config = {
		method: "get"
	};

	let response = await fetch(url, config);
	let obj = await response.json();
	alert(JSON.stringify(obj.I2790.RESULT));
	let FoodName;
	let nutrCnt1;
	let nutrCnt2;
	let nutrCnt3;
	let nutrCnt4;
	let nutrCnt5;
	let nutrCnt6;
	let nutrCnt7;
	let nutrCnt8;
	let nutrCnt9;

	let nutriName = ['식품명 : ', '열량 : ', '탄수화물 : ', '단백질 : ', '지방 : ', '당류 : ', '나트륨 : ', '콜레스테롤 : ', '포화지방산 : ', '트랜스지방 : '];
	let nutriContent;

	let regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/gi;//특수문자제거
	

	
	for (let i = 0; i < 1000; i++) {
		if ((JSON.stringify(obj.I2790.row[i].DESC_KOR).replace(regExp, '') == keyword) === true) {
			FoodName = JSON.stringify(obj.I2790.row[i].DESC_KOR).replace(regExp, '');
			nutrCnt1 = JSON.stringify(obj.I2790.row[i].NUTR_CONT1).replace(regExp, '');
			nutrCnt2 = JSON.stringify(obj.I2790.row[i].NUTR_CONT2).replace(regExp, '');
			nutrCnt3 = JSON.stringify(obj.I2790.row[i].NUTR_CONT3).replace(regExp, '');
			nutrCnt4 = JSON.stringify(obj.I2790.row[i].NUTR_CONT4).replace(regExp, '');
			nutrCnt5 = JSON.stringify(obj.I2790.row[i].NUTR_CONT5).replace(regExp, '');
			nutrCnt6 = JSON.stringify(obj.I2790.row[i].NUTR_CONT6).replace(regExp, '');
			nutrCnt7 = JSON.stringify(obj.I2790.row[i].NUTR_CONT7).replace(regExp, '');
			nutrCnt8 = JSON.stringify(obj.I2790.row[i].NUTR_CONT8).replace(regExp, '');
			nutrCnt9 = JSON.stringify(obj.I2790.row[i].NUTR_CONT9).replace(regExp, '');

			nutriContent = [
				FoodName,
				nutrCnt1,
				nutrCnt2,
				nutrCnt3,
				nutrCnt4,
				nutrCnt5,
				nutrCnt6,
				nutrCnt7,
				nutrCnt8,
				nutrCnt9
			];
			//alert(nutriContent);//확인용
				//비워주기
			document.querySelector('.info_page').innerHTML = '';
			document.querySelector('#keyword').value = '';
			for(let j = 0; j < nutriName.length; j++){
			document.querySelector('.info_page').innerHTML += '<p>' + nutriName[j] +  nutriContent[j] + '</p>';
		}
			
			break;

		}
	}
			document.querySelector('.info_page').innerHTML +=  '<p>(1회 제공량기준)</p>';
}
});

