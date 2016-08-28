<%@page import="com.util.CurOrder"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
	String dateNow = dateFormat.format(new Date());
	long curTime = (new Date()).getTime();
%>
<div id="page-header">
    ﻿<style type="text/css">
*:focus {outline: none} 
</style>
    <script type="text/javascript" src="resource/js/popwin.js"></script>
    <script>
function wap() {
   
		popWin.showWin("800","600","WAP手机版隆重上线-手机APP版近期上线！","/mobile/");

};
</script> 
<script type="text/javascript">
function AG(){
	alert("请先登录！");
}
function XTD(){
	alert("请先登录！");
}
function BB(){
	alert("请先登录！");
}
function VIP(){
	alert("请先登录！");
}
function MG(){
	alert("请先登录！");
}
function OG(){
	alert("请先登录！");
}
function PT(){
	alert("请先登录！");
}
function OB(){
    alert("请先登录！");
}
function ABA(){
        alert("请先登录！");
    }

function bstiyu(){
  alert('请先登入！');
}


function GD(){
    alert("请先登录！");
}

function HB(){
    alert("请先登录！");
}




    function OnlineServer() {       //去掉main.js的OnlineService
        window.open('http://messenger3.providesupport.com/messenger/1w7kkfrfbnfry1l2fns9xvfwoh.html', "newFramekf");
    }



function crownsports(){
		window.location.href='/sports.php';
	
}
function shabacrownsports(){
		window.location.href='/sbsports.php';
	
}



$(document).ready(function (e) {
        $('#screensize').val(screen.width + 'x' + screen.height);
    });


</script>
<input type="hidden" id="screensize" name="screensize" value="1280x800">
<div class="header clearfix">
        <!-- LOGO -->
        <div class="header-logo floatL" style="margin-top: -15px;">
                                                            
        
<object type="application/x-shockwave-flash" id="logo-flash" title="金沙国际 首页" onmousedown="top.mem_index.location.href=&#39;/home.php&#39;" data="http://www.js9588.com/cdn/logo.swf" width="280" height="100"><param name="wmode" value="transparent"><param name="quality" value="high"></object>

<style>
    #ele-logo-wrap,
    #ele-logo-img {
        width: 280px;
        height: 100px;
        background: url('/cdn/logo.swf') 100% 100% no-repeat;
        display: block;
        cursor: pointer;
    }
    #ele-logo-img { background-position: 0 0; }
</style>
<script type="text/javascript">
        var current = <%=curTime%> || 0;

        /**
         * 即時時間顯示
         **/
        function dispTime(){
            current += 1000;
            var dateObj = new Date(current);
            var Y = dateObj.getFullYear();

            var Mh = dateObj.getMonth() + 1;
            if(Mh > 12) Mh = 01;
            if(Mh < 10) Mh = '0'+Mh;

            var D = dateObj.getDate()  < 10 ? '0'+dateObj.getDate():dateObj.getDate();
            var H = dateObj.getHours() < 10 ? '0'+dateObj.getHours():dateObj.getHours();
            var M = dateObj.getMinutes() < 10 ? '0'+dateObj.getMinutes():dateObj.getMinutes();
            var S = dateObj.getSeconds() < 10 ? '0'+dateObj.getSeconds():dateObj.getSeconds();
            document.getElementById('EST_reciprocal').innerHTML = '美东时间：'+Y+'/'+Mh+'/'+D+' - '+H+':'+M+':'+S;
        }
        var timerID = setInterval("dispTime()",1000);
</script>
<script>
    (function(){
        var flashvars = {},
            params = {
                wmode: 'transparent',
                quality: 'high'
            },
            attributes = {
                id: 'logo-flash',
                title: '金沙国际 首页',
                onmousedown: "top.mem_index.location.href='/home.php'"
            };
        swfobject.embedSWF('/cdn/logo.swf', 'ele-logo-wrap', '280', '100', '8.0.35.0', '/cl/tpl/commonFile/swf/expressInstall.swf', flashvars, params, attributes);
    })(); 

</script>       



      



 </div>
        <!-- 登入 -->
        <div class="header-right floatR">
            <div class="header-top clearfix floatR">
                                <!-- lang -->
                                        <span class="lang-wrap floatR"><style>
.ele-lang-wrap {
    height: 20px;
    vertical-align: middle;
    display: inline-block; *display: inline; *zoom: 1;
}
.ele-lang-option{
    width: 22px;
        height: 16px;
        vertical-align: top;
    *margin-left: 4px;
    background: url('resource/images/lang_rect.png') no-repeat;
    display: inline-block; *display: inline; *zoom: 1;
}
.ele-lang-zh-cn { background-position: 0 -40px; }
.ele-lang-en    { background-position: 0 -80px; }
.ele-lang-ja    { background-position: 0 -120px; }
.ele-lang-ko    { background-position: 0 -160px; }
.ele-lang-vi    { background-position: 0 -200px; }
.ele-lang-th    { background-position: 0 -240px; }
.topTime {
	font-size: 14px;
	color:black;
}
</style>
<span class="ele-lang-wrap">
        <a class="ele-lang-option ele-lang-zh-tw" title="繁體中文"></a>
        <a class="ele-lang-option ele-lang-zh-cn" title="简体中文"></a>
        <a class="ele-lang-option ele-lang-en" title="English"></a>
    </span>


</span>



                                    <a href="javascript:f_com.bookmarksite('<%=CurOrder.url %>','金沙国际');" title="加入最爱">加入最爱</a>
                    &nbsp;|&nbsp;
                    <a href="javascript:alert('计划正在拟定中，谢谢您的关注！')" title="代理合作">代理合作</a>
                    &nbsp;|&nbsp;
                    <a href="javascript:f_com.setHomepage('<%=CurOrder.url %>');" title="设为首页">设为首页</a>
                    
                <!-- est --><p class="topTime b_r" id="EST_reciprocal">美东时间：<%=dateNow %></p>
                <div class="est-wrap">
                 
                                   </div>                                  
            </div>
            <div class="slogan floatR"></div>
            <!-- 主選單 -->
            
<style type="text/css">
.subnav11{
position: absolute;
margin: 0px -25px;
background: url('/images/211jnav.png');
width: 150px;
height: 36px;
z-index: 999999999;
}
.subnav11 span a {float: left; color:#FF0; background-image: none;width: 72px;line-height: 33px;height: 33px;}
.subnav11 span a:hover {float: left; color:#FF0; background-image: none;}


</style>
<script language="javascript"> 
function xsc(){document.getElementById('123-gq').style.display='block'; }
function gbc() { document.getElementById('123-gq').style.display='none'; }
</script>
            

            
            
            <div class="mainnav-wrap floatR">
                <ul class="mainnav clearfix">
                    <li>
                        <a href="javascript:GoTo('1','main');" class="current">首页</a>
                    </li>
                    <li>
                        <a href="javascript:GoTo('1','rule');">游戏规则</a>
                    </li>
                    
                    <li>
                        <a href="javascript:GoTo('1','reg');">申请开户</a>
                    </li>
                    <li>
                        <a href="javascript:void(0);" onclick="GoToMember(1,0);return false">我要充值</a>
                    </li>
                    <li>
                        <a href="javascript:void(0);" onclick="GoToMember(1,1);return false">我要提款</a>
                    </li>
                    <li>
                        <a href="javascript:alert('请用手机访问即可');">手机下注</a>
                    </li>
                    <li>
                        <a href="javascript:GoTo('1','Hot');" id="nav-promotions" style="color: rgb(255, 255, 0);">在线客服</a>
                    </li>
                </ul>
                <!-- L-Sub -->
            </div>
        </div>
    </div>                        <div class="header-title-bg">
                <div class="header-title  floatL"></div>
            </div>
            <!-- 最新消息 -->
            <div class="news-bg" style="margin: -4px auto;width: 1028px;height: 33px;background: url(&#39;resource/images/newsbg.png&#39;) no-repeat 0 center;">
                <div class="news-wrap">
                    <div class="news-item floatL">
                                                                        <marquee id="ele-msgNews" behavior="scroll" scrollamount="1" direction="left" style="height:100%;  width: 750px;margin: 2px -10px;">
                                                                        <%=CurOrder.infos.notic %></marquee>
<script src="resource/js/marquee.js"></script>
<style>
.ele-news-txt{
    cursor: pointer;
}
</style>
                    </div>
                </div>
            </div>
                                    <div class="login-wrap" style="margin: 1px auto;">
                                    <%
                                    	if(session.getAttribute("id") == null){
                                    %>
                <form name="LoginForm" id="LoginForm" class="clearfix">
                    <p class="login-unit login-unit-user floatL">
                        <label name="username" for="username" class="login-placeholder" style="opacity: 1;">帐号</label>
                        <input name="username" type="text" size="12" id="username" maxlength="15" class="login-input" tabindex="1" pattern="[a-zA-Z0-9]{4,12}" required="">
                    </p>
                    <p class="login-unit login-unit-pwd floatL">
                        <label name="password" for="password" class="login-placeholder" style="opacity: 1;">密码</label>
                        <input name="password" type="password" size="13" id="password" maxlength="14" class="login-input" tabindex="2" pattern="[a-z0-9]{6,13}" required="">
                    </p>
                    <input name="Submit" type="button" value="" class="login-submit floatL" tabindex="4" onclick="Login();">
                    <a href="reg.jsp" class="login-joinus floatL"></a>
                    &nbsp;&nbsp;&nbsp;
                    <a href="http://www.js9588.com/Lottery/Csc.php###" onclick="Go_forget_pwd();" class="login-forget">忘记密码</a>
                </form>
                <%
                                    	}else{
                %>
                <div class="mem-info floatL">
                会员帐号：<strong class="logged-data"><%=session.getAttribute("name").toString() %></strong>
                                &nbsp;&nbsp;|&nbsp;&nbsp;账户余额：<strong class="logged-data" id="user_money"><%=session.getAttribute("money").toString() %></strong>
                                &nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:void(0);" onclick="GoToMember(1,0);return false"><font color="#FFFFFF">线上存款</font></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:void(0);" onclick="GoToMember(1,1);return false"><font color="#FFFFFF">申请提款</font></a>&nbsp;&nbsp;
                            </div>
                 <!--  sub  -->
	            <div class="SU-Menual floatR">
	                <ul class="login-Menual clearfix">
	                    <li><a href="javascript:void(0);" onclick="GoToMember(2,0);return false"><font color="#FFFFFF">投注记录</font></a> | <a href="javascript:void(0);" onclick="GoToMember(3,0);return false"><font color="#FFFFFF">历史报表</font></a> | <a href="javascript:void(0);" onclick="GoToMember(0 ,0);return false"><font color="#FFFFFF">会员中心</font></a> | <a href="javascript:void(0);" onclick="GoToMember(4,0);return false"><font color="#FFFFFF">站内短信（<font id="user_sms">0</font>）</font></a> | <a href="javascript:void(0);" onclick="GoTo(1,'class/loginout');return false"><font color="#FFFFFF">退出登录</font></a></li>
	                                </ul>
	            </div>
                <%} %>
            </div>            </div>
            <script>
            LoadUserInfo();
            </script>