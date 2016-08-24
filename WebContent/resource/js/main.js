function AboutUs(type){
	window.location.href='/AboutUs.php?type='+type;
	//window.open('/AboutUs/?type='+type,"newFrame");
}
function Mobile(){
	window.open("/Mobile.php","newFrame");
}

function addBookmark(title,url,msg,msgFF) {
	try {
		window.external.AddFavorite(url,title);
	} catch (e) {
		if (window.sidebar) { // Firefox
			//window.sidebar.addPanel(title, url, ""); //Dont use until the FF bug is fixed
			alert(msgFF);
		}
		else if(window.opera && window.print) { // Opera
			var elem = document.createElement('a');
			elem.setAttribute('href',url);
			elem.setAttribute('title',title);
			elem.setAttribute('rel','sidebar');
			elem.click();
		}
		else {alert(msg);}
	}
}
function setHomepage(obj,url,msg,msgFF) {
	try {
		obj.style.behavior='url(#default#homepage)';
		obj.setHomePage(url);
	} catch (e) {
		if (window.sidebar) {
			if(window.netscape) {
				try {
					netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
				} catch (e) {alert(msg);}
			}
			var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components. interfaces.nsIPrefBranch);
			prefs.setCharPref('browser.startup.homepage',url);
		}
		else {alert(msg);}
	}
}
function getKey(){
$("#vPic").attr("src","/Code/?t=" + Math.random());
}
function Login(){
	var un	=$("#username").val();
	if(un == "" || un == "会员账户"){
		$("#username").focus();
		return false;
	}
	var pw	=	$("#password").val();
	if(pw == "" || pw == "登录密码"){
		$("#password").focus();
		return false;
	}
//	var vc	=	$("#rmNum").val();
//	if(vc == "" || vc == "验证码" || vc.length<4){
//		alert("验证码不能为空！");
//		$("#rmNum").focus();
//		return false;
//	}
var screensize = $("#screensize").val();

    $.post("class/login.jsp", {r: Math.random(), action: "login", username: un, password: pw, screensize:screensize}, function (login_jg) {
        if (login_jg.indexOf("1") >= 0) { //验证码错误
            alert("验证码错误，请重新输入");
            $("#rmNum").select();
        } else if (login_jg.indexOf("2") >= 0) { //用户名称或密码
            alert("用户名或密码错误，请重新输入");
            $("#password").val('');
            $("#username").select();
        } else if (login_jg.indexOf("3") >= 0) { //停用，或被删除，或其它信息
            alert("账户异常无法登陆，如有疑问请联系在线客服");
        } else if (login_jg.indexOf("4") >= 0) { //登陆成功
            window.location.href = 'index.jsp';
        }
        //$("#submitbtn").attr("disabled",false); //按钮有效
    });
}

function GoTo(type,url,mulu){
	// class = 0 弹出新窗口
	// class = 1 根目录跳转
	// class = 2 直接跳转目录
	// class = 3 根据指定目录跳转
	debugger;
	if(type=='0'){
		window.open('/'+url+'.php',"newFrame");
	}
	if(type=='1'){
		window.location.href=''+url+'.jsp';
	}
	if(type=='2'){
		window.location.href='/'+url+'/';
	}
	if(type=='3'){
		window.location.href='/'+mulu+'/'+url+'.php';
	}
}
function LoadUserInfo(){
	$.get("/Load/UserMoney.php", {t:Math.random()}, function(data)
		{
				if(data.yz!=1){
					alert("您的账户长时间未操作自动退出或从其他地区登陆！");
					window.location.href='/LogOut.php';
					return false;
				}else{
					$("#user_money").html(data.money);
					$("#user_sms").html(data.sms);
					$("#shabasports1").html(data.shabasports1s);
                    $("#crownsports1").html(data.crownsports1s);
				}
				
		}, "json");
	setTimeout("LoadUserInfo()",15000);
}
function GoToMember(Args1,Args2){
	window.open('member.jsp?Args1='+Args1+'&Args2='+Args2,"newFrame");
}

function Go_forget_pwd() {
	alert("账户密码遗失请联系在线客服！");
}

var old_menu = '';
function menuclick(submenu) {
    if (old_menu != submenu) {
        if (old_menu != '') {
            document.getElementById(old_menu).style.display = 'none';
        }
        document.getElementById(submenu).style.display = 'block';
        old_menu = submenu;
    }else {
        document.getElementById(submenu).style.display = 'none';
        old_menu = '';
    }
}