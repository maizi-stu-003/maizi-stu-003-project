$(function(){
	$("#searchname").keyup(function(){
        	$("ul li").remove();
                var kword = $(this).val();
                if(kword.length == 0){
                    return;
                }else{

       			$.post( "/search/", $( "#searchform" ).serialize(),function(data1) {
       				//alert("返回的对象date1: " + data1);
       				//jsonstr = JSON.stringify(data1);
       				//alert("返回的字符串jsonstr: " + jsonstr)
       				for(var str in data1){ 
           				//alert(str+'='+data1[str]); 


           				$(".inform_ul").append("<li class='li_ctnt'>" + data1[str] + "</li>");
           				$(".li_ctnt").on("click", function(){
                                               $("#searchname").val($(this).html());
                                               $(".inform_ul").css("display", "none");
                                               });
       					}
       				$(".inform_ul").css("display", "block");
                     		},'json' );

         	}

	});

});
