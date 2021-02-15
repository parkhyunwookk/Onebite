/**
 * 
 */

document.querySelector('#btn_search').addEventListener('click', async () => {
	let sel = document.querySelector('#select_info>option:checked').value;
	let regExp = /[\\?;:|"\*~`!^\-+<>@#$%&'\"n]/gi;//특수문자제거
	if (sel =='allergy_info') {
		//alert(sel);//확인용
		const API_KEY = "83679b5f006e4ce497f6";
		let keyword = document.querySelector('#keyword').value;
		const url = "http://openapi.foodsafetykorea.go.kr/api/" + API_KEY + "/COOKRCP01/json/1/50/RCP_NM=" + keyword;
		const config = {
			method: "get"
		};

		let response = await fetch(url, config);
		let obj = await response.json();
		alert(JSON.stringify(obj.COOKRCP01.RESULT));
		alert(JSON.stringify(obj.COOKRCP01.row[0].RCP_PARTS_DTLS));//
		let ingre = JSON.stringify(obj.COOKRCP01.row[0].RCP_PARTS_DTLS).replace(regExp, ',').split(',');
		document.querySelector('.info_page').innerHTML = '';
		document.querySelector('#keyword').value = '';
		
		document.querySelector('.info_page').innerHTML +=( '<h4>' + keyword + '</h4>' );
		let ingreArr = [];
		  for ( let j= 0; j <ingre.length; j++) {
			ingreArr[j] = ingre[j];
        document.querySelector('.info_page').innerHTML +=( '<p>' + ingre[j] + '</p>' );
      }
	}

})

/*function allergy_ingre () {
	//알레르기 유발 성분
	let allergy_ingre = [ '달걀', '우유', '메밀', '땅콩', '대두', '밀', '고등어', '게', '새우', '돼지고기', '복숭아', '토마토','호두', '닭고기', '쇠고기', '오징어', '조개류', '아황산염'];
	for(let i in ingreArr){
		if(ingreArr[i].indexOf(allergy_ingre[i])==0){
			 document.querySelector('.info_page').innerHTML += '알레르기 주의 물질 : ' + ingreArr[i];
		}
		
	}	
};
*/