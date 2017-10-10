/**
 * 
 */
function checkBookInput(f) {
            var isbnregx = /^\d+(-\d+)*$/;
            var numregx =/^\d+\.?\d*$/;
            var isbn = document.getElementById("ISBN").value;
            var isisbn = isbnregx.test(isbn);
            var num = document.getElementById("Price").value;
            var isnum = numregx.test(num);
            var publisher = document.getElementById("Publisher").value;
            var title = document.getElementById("Title").value;
            var publishdate = document.getElementById("PublishDate").value;
            if(!isisbn){
                alert("请输入正确的ISBN！");
            }
            else if(!isnum){
                alert("请输入正确的价格！");
            }
            else if(publisher==""||title==""||publishdate==""){
            	alert("请将各项填写完整！！");
            }
            else{
            	f.form.submit();
            }
        }

function checkAuthorInput(f){
	var name = document.getElementById("AuthorName").value;
	var age = document.getElementById("Age").value;
	var country = document.getElementById("Country").value;
	var numregx = /^[1-9][0-9]*$/;
	var isnum = numregx.test(age);
	if(!isnum){
		alert("请输入正确的年龄！");
	}
	else if(name==""||country==""){
		alert("请将各项填写完整！！")
	}
	else{
		f.form.submit();
	}
}

function checkBookQuery(f){
	var isbnregx = /^\d+(-\d+)*$/;
    var numregx =/^\d+\.?\d*$/;
    var isbn = document.getElementById("ISBN").value;
    var pricemin = document.getElementById("PriceMin").value;
    var pricemax = document.getElementById("PriceMax").value;
    
    if(pricemin!=""&&(!numregx.test(pricemin))){
    	alert("请输入正确的价格！！");
    }
    else if(pricemax!=""&&(!numregx.test(pricemax))){
    	alert("请输入正确的价格！！");
    }
    else if(isbn!=""&&!isbnregx.test(isbn)){
    	alert("请输入正确的ISBN！！")
    }
    else{
    	f.form.submit();
    }
}

function checkAuthorQuery(f){
	var ageregx=/^[1-9][0-9]*$/;
	var agemin = document.getElementById("AgeMin").value;
	var agemax = document.getElementById("AgeMax").value;
	
	if(agemin!=""&&!ageregx.test(agemin)){
		alert("请输入正确的年龄！！");
	}
	else if(agemax!=""&&!ageregx.test(agemax)){
		alert("请输入正确的年龄！！");
	}
	else{
		f.form.submit();
	}
}