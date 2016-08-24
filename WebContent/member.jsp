<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0045)http://www.js9588.com/Member/?Args1=2&Args2=0 -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="resource/css/style.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="resource/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" language="javascript" src="resource/js/marquee.js"></script>
<script type="text/javascript" language="javascript" src="resource/js/kxbdMarquee.js"></script>
<script type="text/javascript" src="resource/js/member.js"></script>
<script type="text/javascript" language="JavaScript" src="resource/js/main.js"></script>

<title>会员中心</title>
<script type="text/javascript">
$(document).ready(function () {
	$("#scrollDiv").kxbdMarquee({isEqual:false,loop:0,scrollDelay:50});
});
$(function () {
	$(".ui-search li a").click(function () {
		var lang = $(this).attr("lang");
		$("#MainFrameb").attr("src", lang);
		$(".ui-search li").removeClass("ui-hover");
		$(this).parent().addClass("ui-hover");
		var topBody = window.document.body;
		var rightBody = window.frames["MainFrameb"].document.body;
		var loadingDiv = $("#loading", rightBody);
		if (loadingDiv.length == 0) {
			loadingDiv = $("<div id='loading'><img id='loadingImg' src='/member/images/loading.gif'/></div>");
			loadingDiv.css("position", "absolute");
			loadingDiv.css("z-index", "999");
			loadingDiv.css("background", "#fff");
			loadingBankDiv = $("<div id='bankDiv'></div>");
			loadingBankDiv.width($(rightBody).width() + 120);
			loadingBankDiv.height($(topBody).height() - 100);
			loadingBankDiv.css("position", "absolute");
			loadingBankDiv.css("z-index", "998");
			loadingBankDiv.css("background-color", "#fff");
			loadingBankDiv.css("filter", "alpha(opacity=90)");
			loadingBankDiv.append(loadingDiv);
			$(rightBody).append(loadingBankDiv);
			loadingBankDiv.css("left", 0);
			loadingBankDiv.css("top", 0);
			loadingDiv.css("left", 70);
			loadingDiv.css("top", ($(topBody).height() - 86) / 2 - 100);
		}
	});
	var Args = getArgs();
	$(".ui-nav li").eq(Args["Args1"]).click();
	$(".ui-body .ui-search").eq(Args["Args1"]).find("li").eq(Args["Args2"]).find("a").click();
});
function changetab(id){
   $(".ui-search").css("display","none");
   $(".ui-nav li").removeClass();
   $("#Nav_"+id).addClass("ui-header-active");
   $("#subjsshow"+id).css("display","block");
   $(".ui-body .ui-search").eq(id).find("li").eq(0).find("li").click();
}
function getArgs() {
	var args = new Object();
	var query = location.search.substring(1);     // Get query string
	var pairs = query.split("&");                 // Break at ampersand
	for (var i = 0; i < pairs.length; i++) {
		var pos = pairs[i].indexOf('=');          // Look for "name=value"
		if (pos == -1) continue;                  // If not found, skip
		var argname = pairs[i].substring(0, pos);  // Extract the name
		var value = pairs[i].substring(pos + 1);    // Extract the value
		value = decodeURIComponent(value);        // Decode it, if needed
		args[argname] = value;                    // Store as a property
	}
	return args;                                  // Return the object
}
</script>
</head>
<body>
	<!-- 内容框 -->
	<div class="ui-main">
		<!-- 头部 -->
		<div class="ui-header">
			<div class="ui-headerBox">
				<!-- logo -->
				<a class="ui-icon-logo ui-logo" id="Logo"></a>
				<!-- 导航 -->
				<ul class="ui-nav">
					<li id="Nav_0" onclick="changetab(0)">
						<a href="javascript:void(0)" title="会员首页">
							<span class="ui-icon ui-icon-home ui-icon-50"></span>
						</a>
					</li>
					<li id="Nav_1" onclick="changetab(1)">
						<a href="javascript:void(0)" title="财务管理">
							<span class="ui-icon ui-icon-recharge ui-icon-50"></span>
						</a>
					</li>
					<li id="Nav_2" onclick="changetab(2)" class="ui-header-active">
						<a href="javascript:void(0)" title="游戏记录">
							<span class="ui-icon ui-icon-gameNote ui-icon-50"></span>
						</a>
					</li>
                   <!-- <li>
						<a href="javascript:void(0)" onclick="OnlineService()" title="客服中心">
							<span class="ui-icon ui-icon-online ui-icon-50"></span>
						</a>
					</li>-->
				</ul>
				<ul class="ui-function">
					<!--<li>
						<a href="#">
							<span class="ui-icon ui-icon-down ui-icon-20" id="Menu"></span>
						</a>
					</li>
					<li>
						<a href="#">
							<span class="ui-icon ui-icon-min ui-icon-20"></span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0)" id="Logout">
							<span class="ui-icon ui-icon-max ui-icon-20"></span>
						</a>
					</li>-->
				</ul>
			</div>
		</div>
		<!-- 中部 -->
		<div class="ui-body">

		<div class="ui-search" id="subjsshow0" style="display: none;">
        <span>会员首页</span>
        	<ul>
                <li><a href="javascript:void(0)" lang="password.jsp">修改密码</a></li>
              <!--  <li><a href="javascript:void(0)" lang="/LogOut.php">退出登录</a></li> -->
			</ul>
		</div>

        <div class="ui-search" id="subjsshow1" style="display: none;"> 
        <span>财务管理</span>
			<ul>
                <li><a href="javascript:void(0)" lang="pay.jsp">账户充值</a></li>
                <li><a href="javascript:void(0)" lang="take.jsp">申请提款</a></li>
                <li><a href="javascript:void(0)" lang="paylist.jsp">充值记录</a></li>
                <li><a href="javascript:void(0)" lang="takelist.jsp">提现记录</a></li>
			</ul>
		</div>

        <div class="ui-search" id="subjsshow2" style="display: block;"> 
        <span>游戏记录</span>
			<ul>
                <li class="ui-hover"><a href="javascript:void(0)" lang="lottery.jsp">彩票游戏</a></li>
			</ul>
		</div>
         <iframe id="MainFrameb" scrolling="no" frameborder="0" width="100%" height="475" allowtransparency="true" src="lottery.jsp"></iframe>         
		
		<!--尾部 -->
		<div class="ui-footer">
			<span class="ui-icon ui-icon-announces ui-announces"></span>
			<div id="scrollDiv" class="announce">
			       <ul id="scroll" style="width: 6400px;">
                       <li><span style="line-height:1.5;font-family:微软雅黑;">尊敬的会员您好，我公司李方工行已暂时停用回收。请您存款时查询目前正在使用的银行卡账号！~以免造成额度丢失，给您造成不便，请谅解~！~&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;尊敬的玩家您好，【AG游戏厅】于每周一【 11:30 - 13:30】，新天地厅【11:00 – 16:00】进行例行维护,请您耐心等待，维护期间暂时无法进行额度转换以及游戏，给您带来不便请谅解，谢谢！~&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;尊敬的会员，请注意！！BBIN厅于周三【09:00 ~ 12:30 】进行例行维护。【欧博维护通知】尊敬的客戶 : 為了提供更好的服務，我們每週三的維護期將變更為於08:00至12:30维护期间将无法进行游戏！给您带来不便，敬请见谅！！！O(∩_∩)O~&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
                   <li><span style="line-height:1.5;font-family:微软雅黑;">尊敬的会员您好，我公司李方工行已暂时停用回收。请您存款时查询目前正在使用的银行卡账号！~以免造成额度丢失，给您造成不便，请谅解~！~&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;尊敬的玩家您好，【AG游戏厅】于每周一【 11:30 - 13:30】，新天地厅【11:00 – 16:00】进行例行维护,请您耐心等待，维护期间暂时无法进行额度转换以及游戏，给您带来不便请谅解，谢谢！~&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;尊敬的会员，请注意！！BBIN厅于周三【09:00 ~ 12:30 】进行例行维护。【欧博维护通知】尊敬的客戶 : 為了提供更好的服務，我們每週三的維護期將變更為於08:00至12:30维护期间将无法进行游戏！给您带来不便，敬请见谅！！！O(∩_∩)O~&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></li></ul>
			</div>
		</div>
	</div>

</div></body></html>