<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.SIPUSH"%>
<%@page import="com.util.CurOrder"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<!-- saved from url=(0037)http://www.js9588.com/Lottery/Csc.php -->
<html class="madvertis zh-cn at1"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">

<title>金沙国际</title>
<link href="resource/css/standard.css" rel="stylesheet">
<link href="resource/css/xinhao99.css" rel="stylesheet">
<style>/* header */
.slogan{background: url('resource/images/slogan02.png') no-repeat 0 bottom;}

.login-wrap{background: url('resource/images/loginbg02.png') no-repeat center 0;}
.is-login .login-wrap{background: url('resource/images/loginbg02.png') no-repeat center bottom;}
/* first */
.login-wrap-first{background: url('resource/images/slogan.png') no-repeat center 0;}
.login-joinus-first{background: url('resource/images/btn_joinus.png') no-repeat 0 0;}
.login-joinus-first:hover{background: url('resource/images/btn_joinus.png') no-repeat 0 bottom;}
.login-promotions-first{background: url('resource/images/btn_event.png') no-repeat 0 0;}
.login-promotions-first:hover{background: url('resource/images/btn_event.png') no-repeat 0 bottom;}
.login-submit-first{background: url('resource/images/btn_login.png') no-repeat 0 0;}
.login-submit-first:hover{background: url('resource/images/btn_login.png') no-repeat 0 bottom;}
.first .mem-info {background: url('resource/images/loginbg_acc.png') no-repeat 0 0;}
.news-wrap-first{background: url('resource/images/newsbg.png') no-repeat 0 center;}
/* first-game */
.first-game-live{background: url('resource/images/game01.png') no-repeat 0 0;}
.first-game-live:hover{background: url('resource/images/game01_over.png') no-repeat 0 0;}
.first-game-sport{background: url('resource/images/game02.png') no-repeat 0 0;}
.first-game-sport:hover{background: url('resource/images/game02_over.png') no-repeat 0 0;}
.first-game-casino{background: url('resource/images/game03.png') no-repeat 0 0;}
.first-game-casino:hover{background: url('resource/images/game03_over.png') no-repeat 0 0;}
.first-game-lottery{background: url('resource/images/game04.png') no-repeat 0 0;}
.first-game-lottery:hover{background: url('resource/images/game04_over.png') no-repeat 0 0;}
/* login */
.login-submit{background: url('resource/images/btn_login02.png') no-repeat 0 0;}
.login-submit:hover{background: url('resource/images/btn_login02.png') no-repeat 0 bottom;}
.login-joinus{background: url('resource/images/btn_joinus02.png') no-repeat 0 0;}
.login-joinus:hover{background: url('resource/images/btn_joinus02.png') no-repeat 0 bottom;}
/* sidemenu */
.sidemenu-header{background: url('resource/images/sidebar_top.png') no-repeat center 0;}
/*page-title*/
.header-title{
                    background: url('resource/images/title_lottery.png') no-repeat 0 0;
    }
.header-title.isTOP{background: url('resource/images/title_livetop.png') no-repeat 0 0;}
.header-title-bg{
                background: url('resource/images/ad_lottery.png') no-repeat 0 bottom;
    }
/* game */
#Game-left-prize .game-jackpot-style {background-image: url('resource/images/jackpot.png');}
.GameIcon-First {background-image: url('resource/images/First_zh-cn.png');}
/* footer */
.footer-download{background: url('resource/images/btn_download.png') no-repeat 0 0;}
.footer-download:hover{background: url('resource/images/btn_download.png') no-repeat 0 bottom;}
.footer-service{background: url('resource/images/btn_service.png') no-repeat 0 0;}
.footer-service:hover{background: url('resource/images/btn_service.png') no-repeat 0 bottom;}</style>

<script src="resource/js/jquery-1.7.2.min.js"></script>
<script src="resource/js/common.js"></script>
<script src="resource/js/upup.js"></script>
<script src="resource/js/float.js"></script>
<script src="resource/js/swfobject.js"></script>
<script src="resource/js/jquery.cookie.js"></script>
<script type="text/javascript" language="JavaScript" src="resource/js/main.js"></script>
<script type="text/javascript" language="JavaScript" src="resource/js/layer.js"></script>
<link type="text/css" rel="stylesheet" href="resource/css/layer.css" id="skinlayercss">
<link type="text/css" rel="stylesheet" href="resource/css/ssc_sj.css">
<script type="text/javascript" src="cq_ssc.js"></script>
<style type="text/css" media="screen">#ele-logo-wrap {visibility:hidden}</style></head>
<body>
            <div id="mainBody">
            <%@ include file="head_nofix.jsp" %>            <div id="page-container">
    <div id="page-body" class="clearfix">
   <div class="lottery_main">
<div class="ssc_right">
  <div id="auto_list"><table width="100%" border="0" cellspacing="1" cellpadding="0" class="clbian"><tbody><tr class="clbian_tr_title"><td colspan="2">开奖结果</td></tr><tr class="clbian_tr_title"><td>开奖期数</td><td>开奖号码</td></tr><tr class="clbian_tr_txt"><td class="qihao">20160814080</td><td class="haoma">8,0,4,5,8</td></tr><tr class="clbian_tr_txt"><td class="qihao">20160814079</td><td class="haoma">5,3,4,6,7</td></tr><tr class="clbian_tr_txt"><td class="qihao">20160814078</td><td class="haoma">0,1,5,9,6</td></tr><tr class="clbian_tr_txt"><td class="qihao">20160814077</td><td class="haoma">8,2,5,9,2</td></tr><tr class="clbian_tr_txt"><td class="qihao">20160814076</td><td class="haoma">7,9,0,4,4</td></tr><tr class="clbian_tr_txt"><td class="qihao">20160814075</td><td class="haoma">3,9,5,0,8</td></tr><tr class="clbian_tr_txt"><td class="qihao">20160814074</td><td class="haoma">9,0,0,4,2</td></tr><tr class="clbian_tr_txt"><td class="qihao">20160814073</td><td class="haoma">4,5,2,8,4</td></tr><tr class="clbian_tr_txt"><td class="qihao">20160814072</td><td class="haoma">1,2,1,1,5</td></tr><tr class="clbian_tr_txt"><td class="qihao">20160814071</td><td class="haoma">4,3,8,2,5</td></tr><tr class="clbian_tr_txt"><td class="qihao">20160814070</td><td class="haoma">8,6,8,8,7</td></tr><tr class="clbian_tr_txt"><td class="qihao">20160814069</td><td class="haoma">4,9,8,9,1</td></tr><tr class="clbian_tr_txt"><td class="qihao">20160814068</td><td class="haoma">6,5,0,0,3</td></tr><tr class="clbian_tr_txt"><td class="qihao">20160814067</td><td class="haoma">3,2,2,7,2</td></tr><tr class="clbian_tr_txt"><td class="qihao">20160814066</td><td class="haoma">6,3,7,5,9</td></tr></tbody></table></div>
</div>
<div class="ssc_left">
    <iframe id="mainframe" name="mainframe" allowTransparency="true"  frameborder="0" scrolling="no" width="810" src="ssc.jsp" height="940" style="background:transparent;"></iframe>
    <div class="lottery_clear"></div>
</div>
</div>
<div class="lottery_clear" style="height:20px;"></div>
</div>            <%@ include file="pagefooter.jsp" %>        </div>
<div id="endtime"></div>
<div style="display:none" id="look"></div>
<!-- <ul id="TplFloatPic_0" class="TplFloatSet" style="position:absolute;cursor:pointer;display:none;" picfloat="left" class="png_fix">
            <li><a  onclick="GoTo('1','Reg');">
            <img src="/images/zuo_01.png?77379" align="center" alt="" class="png_fix"/>
        </a></li>
		<li><a  onclick="GoTo('1','Reg');">
            <img src="/images/zuo_02.png?77379" align="center" alt="" class="png_fix"/>
        </a></li>
		<li><a  onclick="GoTo('1','Reg');">
            <img src="/images/zuo_03.png?77379" align="center" alt="" class="png_fix"/>
        </a></li>
		<li><a onclick="FloatClose(this);"><img src="/images/zuo_04.png" align="center"  class="png_fix"/></a></li>
        </ul> -->
    <ul id="TplFloatPic_1" class="TplFloatSet" style="position: absolute; cursor: pointer; z-index: 1000; top: 150px; right: 5px; width: 127px;" picfloat="right">
            <li><a onclick="OnlineServer();" style="width: 127px; height: 213px;">
            <img src="resource/images/you_01.png" align="center" alt="" class="png_fix" width="127" height="213">
        </a></li>
		 <!-- <li><a  onclick="OnlineServer();">
            <img src="/images/you_02.png?77379" align="center" alt="" class="png_fix"/>
        </a></li> -->
		 <li><a onclick="OnlineServer();" style="width: 127px; height: 44px;">
            <img src="resource/images/you_03.png" align="center" alt="" class="png_fix" width="127" height="44">
        </a></li>
		<li><a onclick="FloatClose(this);" style="width: 127px; height: 42px;"><img src="resource/images/you_04.png" align="center" class="png_fix" width="127" height="42"></a></li>
        </ul>
<style>
.TplFloatSet a{display:block;margin:0 auto;text-align:center;}
.TplFloatSet img{vertical-align:bottom;font-size:0px;}
.TplFloatSet li{list-style: none;}
</style>
<script type="text/javascript">
//關閉效果
function FloatClose(t){ event.cancelBubble = true;$(t).parents('.TplFloatSet').hide(); }
var left_top = 150, right_top = 150, float_list = [];
$(window).load(function() {
    // 廳主自改 - 浮動圖V2 -2013.7.19
            float_list['0'] = $('#TplFloatPic_0');
            float_list['1'] = $('#TplFloatPic_1');
        for (var i in float_list) {
        var self = float_list[i], 
            picfloat = (self.attr('picfloat') == 'right') ? 1 : 0;
        self.show().Float({'floatRight' : picfloat, 'topSide' : ((picfloat == 1) ? right_top : left_top)});
        var w = 0;        
            $.each(self.find('img'), function(){
            var width = $(this).width();
            w = (width > w) ? width : w;//取圖片最大寬度
            $(this).attr({
                'width' : width,
                'height': $(this).height()
    });
    });
        self.css('width', w);
        if (picfloat) {
            right_top = right_top + 10 + (self.height() || 250);
        } else {
            left_top = left_top + 10 + (self.height() || 250);
    }

        $('a', self).each(function(){
            $(this).css({'width' : $(this).find('img:first').width(),'height' : $(this).find('img:first').height()});
            $(this).hover(function() {
                $(this).find('img:first').hide();
                $(this).find('img:last').show();
            }, function() {
                $(this).find('img:last').hide();
                $(this).find('img:first').show();
            });
        });
}
});
function cancelMouse() {return false;}
document.oncontextmenu = cancelMouse;

// 加入最愛
f_com.bookmarksite = function(url,title) {
    if(window.sidebar||window.opera) {
        // for firfox
        window.sidebar.addPanel(title, url,"");
    }else if(document.all){
        // for IE
        window.external.AddFavorite( url, title);
    }else{
        alert("您的浏览器目前不支援此功能！!");
    }
}

$(function() {
    // 文字閃爍
    new toggleColor('#nav-promotions', ['#FFFFFF','#FFFF00'] , 500 );

    // 表單 label 字暫留效果
    $('#LoginForm').find('label').InputLabels();
});
var t = 541254478;
function formatCurrency(num) {
    num = num.toString().replace(/\$|\,/g,'');
    if(isNaN(num))
    num = "0";
    sign = (num == (num = Math.abs(num)));
    num = Math.floor(num);
    cents = num%100;
    num = Math.floor(num/100).toString();
    if(cents<10)
    cents = "0" + cents;
    for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
    num = num.substring(0,num.length-(4*i+3))+','+
    num.substring(num.length-(4*i+3));
    return (((sign)?'':'-') + num + '.' + cents);
}
function GameMeny(t){
	var s = Math.floor(Math.random()*5000+1);
	t = t + s;
	$(".js-ele-JP1").html(formatCurrency(t));
	setTimeout("GameMeny("+t+")",1000);
}
GameMeny(t)
$('.js-ele-JP1').html();
</script>


<!--[if IE 6]>
<script>
var downloadNewIE;
if('undefined' != typeof downloadvwin){
    downloadNewIE = downloadvwin;
}else{
    downloadNewIE = function(){
        window.open('http://windows.microsoft.com/en-us/internet-explorer/downloads/ie-8');
    }
}
</script>

    <div id="ie6-alertBox">
        <div id="ie6-infoBar">
                            系统侦测到您使用旧版浏览器,<span class="alert">本站预计于 2014/1/1 停止对 IE6 , IE7 维护与支援</span>,为了体验最佳的浏览品质与效果,建议立即至<a href="javascript:downloadNewIE();">「下载区」</a>升级您的浏览器。
                    </div>
            </div>
    <div id="ie6-overlay"></div>
    <style type="text/css">
        html{overflow-y:hidden;}
        .alert{color: red;}
        #ie6-overlay{
            background:#777777;
            filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=50);
            /*展示用*/
            -MS-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";
            -moz-opacity:0.5;
            opacity: 0.5;
            /*展示用*/
            position: absolute;
            top: 0;
            left: 0;
            z-index: 10;
        }
        #ie6-alertBox{
            position:absolute;
            font-size: 13px;
            width:300px;
            height:auto;
            padding:10px 10px 30px;
            left:50%;
            top:40%;
            line-height: 25px;
            margin-left:-160px;
            z-index: 11;
            color: #000;
            border:1px solid #777;
            background-color: #CCCCCC;
            /*展示用*/
            background-image: -moz-linear-gradient(top,white,#CCCCCC);
            background-image: -webkit-gradient(linear,0 0,0 100%,from(white),to(#CCCCCC));
            background-image: -webkit-linear-gradient(top,white,#CCCCCC);
            background-image: -o-linear-gradient(top,white,#CCCCCC);
            background-image: linear-gradient(to bottom,white,#CCCCCC);
            background-repeat: repeat-x;
            -webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.065);
            -moz-box-shadow: 0 1px 4px rgba(0,0,0,0.065);
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.065);
            /*展示用*/
            border: 1px solid #D4D4D4;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FFFFFF',endColorstr='#CCCCCC',GradientType=0);
            display:none;
        }
        #ie6-infoBar a,#ie6-alertBoxClose{color: #F57900;text-decoration: none;}
        #ie6-infoBar a:hover,#ie6-alertBoxClose:hover{color: #FF9A37;}
        #ie6-alertBoxClose{
            position:absolute;
            right:5px;
            bottom:5px;
            display: none;
        }
    </style>
    <script>

        
        function showalert(){
            $("#ie6-overlay").height($(window).height()).width($(window).width());
                            $("#ie6-alertBox").slideToggle();
                    }


        $(function(){
                            showalert();
                    });
    </script>
<![endif]--></div></body></html>