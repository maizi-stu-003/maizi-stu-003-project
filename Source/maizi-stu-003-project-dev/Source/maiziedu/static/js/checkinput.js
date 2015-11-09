function checkform() 
{

checkName();
checkPass();
checkInputcaptcha()
}

function clearTips()
{
    document.getElementById('tips').style.display = "none";
    document.getElementById('tips').innerHTML = '';
    document.getElementById('button').disabled = false;
}

function showTips(msg)
{
    tipObj = document.getElementById('tips');
    tipObj.style.display = "block";
    tipObj.innerHTML = msg;
    document.getElementById('button').disabled = true;
}

function checkName()
{
    var name = document.getElementById('email').value;
//    if(name === null ) {
//        showTips('请输入用户名'); 
//        return false; 		
//    }

    if (name.length <= 0) {
        showTips('用户名不能为空');
        return false;
    }

	
    var emailReg = /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/; 
	var regu =/^[1][3|4|5|8][0-9]{9}$/gi; 
    var re = new RegExp(regu); 
	
    //if( !emailReg.test(name) || !re.test(name) ){ 
    if( !emailReg.test(name) ){ 
        showTips('该账号格式不正确，请重新输入')
        return false; 
    } 

}


function checkPass()
{
    var pass = document.getElementById('password').value;
    if (pass.length <= 0) {
        showTips('请输入密码');
        return false; 
    }
    
}
//check inputcaptcha
function checkInputcaptcha()
{
    var pass = document.getElementById('inputcaptcha').value;
    if (pass.length <= 0) {
        showTips('请输入验证码');
        return false;
    }

}
