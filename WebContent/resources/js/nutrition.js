

//식품영양정보 표시

document.querySelector('#btn_search').addEventListener('click', async()=>{	
const API_KEY = "83679b5f006e4ce497f6";
let keyword = document.querySelector('#keyword').value;
let copy =  document.querySelector('.info_page').outerHTML;
const url = "http://openapi.foodsafetykorea.go.kr/api/" + API_KEY + "/I2790/json/1/1/DESC_KOR=" +keyword;
	 const config = {
		method: "get"   
	};
	
	let response = await fetch(url, config);
	let obj = await response.json();
	alert(JSON.stringify(obj.I2790.RESULT));
	console.log(JSON.stringify(obj.I2790.RESULT));
	
	function jsonTest(){
	let foodInfo = document.querySelector('.wrap').lastElementChild;
	foodInfo.children[0].innerHTML += " " + JSON.stringify(obj.I2790.row[0].DESC_KOR);
	foodInfo.children[1].innerHTML += " " + JSON.stringify(obj.I2790.row[0].NUTR_CONT1);
	foodInfo.children[2].innerHTML += " " + JSON.stringify(obj.I2790.row[0].NUTR_CONT2);
	foodInfo.children[3].innerHTML += " " + JSON.stringify(obj.I2790.row[0].NUTR_CONT2);
	foodInfo.children[4].innerHTML += " " + JSON.stringify(obj.I2790.row[0].NUTR_CONT2);
	foodInfo.children[5].innerHTML += " " + JSON.stringify(obj.I2790.row[0].NUTR_CONT2);
	foodInfo.children[6].innerHTML += " " + JSON.stringify(obj.I2790.row[0].NUTR_CONT2);
	foodInfo.children[7].innerHTML += " " + JSON.stringify(obj.I2790.row[0].NUTR_CONT2);
	foodInfo.children[8].innerHTML += " " + JSON.stringify(obj.I2790.row[0].NUTR_CONT2);
	foodInfo.children[9].innerHTML += " " + JSON.stringify(obj.I2790.row[0].NUTR_CONT2);
}
	jsonTest();
	
	

    });
    

	

