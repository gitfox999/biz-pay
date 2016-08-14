<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<script type="text/javascript" src="resource/js/jquery.js"></script>
<script type="text/javascript" src="resource/js/top.js"></script>
<script type="text/javascript" src="resource/js/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="resource/js/jquery.jBox-zh-CN.js"></script>
<link type="text/css" rel="stylesheet" href="resource/css/jbox.css">
<script type="text/javascript" src="resource/js/cq_ssc.js"></script>
<link href="resource/css/ssc.css" rel="stylesheet" type="text/css">
<style type="text/css">
body,td,th {
	font-size: 12px;
}
body {
	background:transparent;
    margin-left: 0px;
    margin-top: 0px;
    margin-right: 0px;
    margin-bottom: 0px;
}
	.drpbg{width:60px;position:absolute; background:#021e37;text-align:center;top:25px;left:674px; height:42px; border:1px solid white; border-top:none;}
	.drpbg ul{margin:0px; padding:0px; height:42px; width:60px;}
	.drpbg li{margin:0px;text-align:center;width:60px; height:21px; line-height:20px;}
	.drpbg .ca{font-size:12px; color:White;text-decoration:none;}
	.drpbg .ca:hover{color:#ccc;}
</style>

<body>
<div class="block" style="padding:0px 0px;">
<div class="lottery_main" style="margin:10px;float:left;">
<div class="ssc_right">
  <div id="auto_list"></div>
</div>
<div class="ssc_left">

<div class="jsq">
    <span class="time">第 <font id="open_qihao">20160807098</font> 期<br>
        剩余<font id="whataction">投注</font>时间</span>
    <span class="ssc">重庆时时彩<br>
        第 <font id="numbers">20160807096</font> 期</span>
    <span class="zh" id="autoinfo"><span>正在开奖...</span></span><font>
    <span class="sj" id="cqc_time" style="color: red;">02:37</span>
    <div class="open_number"><img src="resource/images/lhj.gif"><img src="resource/images/lhj.gif"><img src="resource/images/lhj.gif"><img src="resource/images/lhj.gif"><img src="resource/images/lhj.gif"></div>
    <span id="cqc_sound" off="0"><img src="resource/images/on.png" title="关闭/打开声音"></span>
</font></div><font>


<table width="760" border="0" cellspacing="0" cellpadding="0" align="center" height="40">
  <tbody><tr class="button_a">
      <td width="359" align="right" valign="middle" class="kg_a"><a href="http://www.89899b.com/app/member/Lottery/list.php" title="开奖结果" target="_blank"></a></td>
      <td width="10">&nbsp;</td>
      <td width="391" align="left" valign="middle" class="gz_a"><a href="http://www.89899b.com/Rule/Rule_Cqssc.html" title="游戏规则" target="_blank"></a></td>

  </tr>
</tbody></table>

    <div class="touzhu">
<form name="orders" action="order" method="post" target="OrderFrame">
    	<ul id="menu_hm">
        	<li class="current_n" onclick="hm_odds(1)">第一球<span>(万位)</span></li>
            <li class="current_n" onclick="hm_odds(2)">第二球<span>(千位)</span></li>
            <li class="current_n" onclick="hm_odds(3)">第三球<span>(百位)</span></li>
            <li class="current_n" onclick="hm_odds(4)">第四球<span>(十位)</span></li>
            <li class="current" onclick="hm_odds(5)">第五球<span>(个位)</span></li>
		</ul>
<table class="bian" border="0" cellpadding="0" cellspacing="1">
            <tbody><tr class="bian_tr_title">
                <td>号码</td>
                <td>赔率</td>
                <td width="70">金额</td>
                <td>号码</td>
                <td>赔率</td>
                <td width="70">金额</td>
                <td>号码</td>
                <td>赔率</td>
                <td width="70">金额</td>
                <td>号码</td>
                <td>赔率</td>
                <td width="70">金额</td>
              <td>号码</td>
              <td>赔率</td>
              <td width="70">金额</td>
            </tr>
            <tr class="bian_tr_txt">
            	<%
            		for(int i=0;i<10;i++){
       			%>
	       			<td class="bian_td_qiu"><img src="resource/images/<%=i %>.png"></td>
	                <td class="bian_td_odds" id="ball_1_h<%=i+1 %>" width="40">9.8</td>
	                <td class="bian_td_inp" id="ball_1_t<%=i+1 %>"><input name="ball_1_<%=i+1 %>" id="ball_1_<%=i+1 %>" class="inp1" onkeyup="digitOnly(this)" onfocus="this.className=&#39;inp1m&#39;" onblur="this.className=&#39;inp1&#39;;" type="text" maxlength="5"></td>
	                
         		<%
         				if(i == 4){
         					%>
         					</tr> <tr class="bian_tr_txt">
         					<%
         				}
            		}
            	%>
            </tr>
            <tr class="bian_tr_txt">
              <td class="bian_td_qiu">大</td>
              <td class="bian_td_odds" id="ball_1_h11">1.98</td>
              <td class="bian_td_inp" id="ball_1_t11"><input name="ball_1_11" id="ball_1_11" class="inp1" onkeyup="digitOnly(this)" onfocus="this.className=&#39;inp1m&#39;" onblur="this.className=&#39;inp1&#39;;" type="text" maxlength="5"></td>
              <td class="bian_td_qiu">小</td>
              <td class="bian_td_odds" id="ball_1_h12">1.98</td>
              <td class="bian_td_inp" id="ball_1_t12"><input name="ball_1_12" id="ball_1_12" class="inp1" onkeyup="digitOnly(this)" onfocus="this.className=&#39;inp1m&#39;" onblur="this.className=&#39;inp1&#39;;" type="text" maxlength="5"></td>
              <td class="bian_td_qiu">单</td>
              <td class="bian_td_odds" id="ball_1_h13">1.98</td>
              <td class="bian_td_inp" id="ball_1_t13"><input name="ball_1_13" id="ball_1_13" class="inp1" onkeyup="digitOnly(this)" onfocus="this.className=&#39;inp1m&#39;" onblur="this.className=&#39;inp1&#39;;" type="text" maxlength="5"></td>
              <td class="bian_td_qiu">双</td>
              <td class="bian_td_odds" id="ball_1_h14">1.98</td>
              <td class="bian_td_inp" id="ball_1_t14"><input name="ball_1_14" id="ball_1_14" class="inp1" onkeyup="digitOnly(this)" onfocus="this.className=&#39;inp1m&#39;" onblur="this.className=&#39;inp1&#39;;" type="text" maxlength="5"></td>
              <td colspan="3">&nbsp;</td>
            </tr>
      </tbody></table>
    	<table class="bian" border="0" cellpadding="0" cellspacing="1" style="margin-top:20px;">
        <tbody><tr class="bian_tr_bg">
              <td colspan="12">总和 龙虎和</td>
              </tr>
            <tr class="bian_tr_title">
              <td>选项</td>
                <td>赔率</td>
                <td width="70">金额</td>
              <td>选项</td>
                <td>赔率</td>
                <td width="70">金额</td>
              <td>选项</td>
                <td>赔率</td>
                <td width="70">金额</td>
              <td>选项</td>
                <td>赔率</td>
              <td width="70">金额</td>
            </tr>
            <tr class="bian_tr_txt">
                    <td width="50" class="bian_td_qiu">总和大</td>
                    <td class="bian_td_odds" id="ball_6_h1">1.98</td>
                    <td width="70" class="bian_td_inp" id="ball_6_t1"><input name="ball_6_1" id="ball_6_1" class="inp1" onkeyup="digitOnly(this)" onfocus="this.className=&#39;inp1m&#39;" onblur="this.className=&#39;inp1&#39;;" type="text" maxlength="5"></td>
                    <td width="50" class="bian_td_qiu">总和小</td>
                    <td class="bian_td_odds" id="ball_6_h2">1.97</td>
                    <td width="70" class="bian_td_inp" id="ball_6_t2"><input name="ball_6_2" id="ball_6_2" class="inp1" onkeyup="digitOnly(this)" onfocus="this.className=&#39;inp1m&#39;" onblur="this.className=&#39;inp1&#39;;" type="text" maxlength="5"></td>
                    <td width="50" class="bian_td_qiu">总和单</td>
                    <td class="bian_td_odds" id="ball_6_h3">1.98</td>
                    <td width="70" class="bian_td_inp" id="ball_6_t3"><input name="ball_6_3" id="ball_6_3" class="inp1" onkeyup="digitOnly(this)" onfocus="this.className=&#39;inp1m&#39;" onblur="this.className=&#39;inp1&#39;;" type="text" maxlength="5"></td>
                    <td width="50" class="bian_td_qiu">总和双</td>
                    <td class="bian_td_odds" id="ball_6_h4">1.97</td>
                    <td width="70" class="bian_td_inp" id="ball_6_t4"><input name="ball_6_4" id="ball_6_4" class="inp1" onkeyup="digitOnly(this)" onfocus="this.className=&#39;inp1m&#39;" onblur="this.className=&#39;inp1&#39;;" type="text" maxlength="5"></td>
              </tr>
              <tr class="bian_tr_txt">
                    <td width="50" class="bian_td_qiu">龙</td>
                    <td class="bian_td_odds" id="ball_6_h5">1.98</td>
                    <td width="70" class="bian_td_inp" id="ball_6_t5"><input name="ball_6_5" id="ball_6_5" class="inp1" onkeyup="digitOnly(this)" onfocus="this.className=&#39;inp1m&#39;" onblur="this.className=&#39;inp1&#39;;" type="text" maxlength="5"></td>
                    <td width="50" class="bian_td_qiu">虎</td>
                    <td class="bian_td_odds" id="ball_6_h6">1.97</td>
                    <td width="70" class="bian_td_inp" id="ball_6_t6"><input name="ball_6_6" id="ball_6_6" class="inp1" onkeyup="digitOnly(this)" onfocus="this.className=&#39;inp1m&#39;" onblur="this.className=&#39;inp1&#39;;" type="text" maxlength="5"></td>
                    <td width="50" class="bian_td_qiu">和</td>
                    <td class="bian_td_odds" id="ball_6_h7">8.88</td>
                    <td width="70" class="bian_td_inp" id="ball_6_t7"><input name="ball_6_7" id="ball_6_7" class="inp1" onkeyup="digitOnly(this)" onfocus="this.className=&#39;inp1m&#39;" onblur="this.className=&#39;inp1&#39;;" type="text" maxlength="5"></td>
                    <td colspan="3">&nbsp;</td>
              </tr>
           </tbody></table>
   	  <ul id="menu_s" style="margin-top:20px;">
        	<li class="current" onclick="s_odds(7)">前三球</li>
            <li class="current_n" onclick="s_odds(8)">中三球</li>
            <li class="current_n" onclick="s_odds(9)">后三球</li>
		</ul>
    	<table class="bian" border="0" cellpadding="0" cellspacing="1">
            <tbody><tr class="bian_tr_title">
                <td>选项</td>
                <td>赔率</td>
                <td width="70">金额</td>
                <td>选项</td>
                <td>赔率</td>
                <td width="70">金额</td>
                <td>选项</td>
                <td>赔率</td>
                <td width="70">金额</td>
                <td>选项</td>
                <td>赔率</td>
                <td width="70">金额</td>
              <td>选项</td>
              <td>赔率</td>
              <td width="70">金额</td>
            </tr>
            <tr class="bian_tr_txt">
                <td class="bian_td_qiu">豹子</td>
                <td class="bian_td_odds" id="ball_7_h1" width="40">66.01</td>
                <td class="bian_td_inp" id="ball_7_t1"><input name="ball_7_1" id="ball_7_1" class="inp1" onkeyup="digitOnly(this)" onfocus="this.className=&#39;inp1m&#39;" onblur="this.className=&#39;inp1&#39;;" type="text" maxlength="5"></td>
                <td class="bian_td_qiu">顺子</td>
                <td class="bian_td_odds" id="ball_7_h2" width="40">12.01</td>
                <td class="bian_td_inp" id="ball_7_t2"><input name="ball_7_2" id="ball_7_2" class="inp1" onkeyup="digitOnly(this)" onfocus="this.className=&#39;inp1m&#39;" onblur="this.className=&#39;inp1&#39;;" type="text" maxlength="5"></td>
                <td class="bian_td_qiu">对子</td>
                <td class="bian_td_odds" id="ball_7_h3" width="40">2.81</td>
                <td class="bian_td_inp" id="ball_7_t3"><input name="ball_7_3" id="ball_7_3" class="inp1" onkeyup="digitOnly(this)" onfocus="this.className=&#39;inp1m&#39;" onblur="this.className=&#39;inp1&#39;;" type="text" maxlength="5"></td>
                <td class="bian_td_qiu">半顺</td>
                <td class="bian_td_odds" id="ball_7_h4" width="40">2.01</td>
                <td class="bian_td_inp" id="ball_7_t4"><input name="ball_7_4" id="ball_7_4" class="inp1" onkeyup="digitOnly(this)" onfocus="this.className=&#39;inp1m&#39;" onblur="this.className=&#39;inp1&#39;;" type="text" maxlength="5"></td>
                <td class="bian_td_qiu">杂六</td>
                <td class="bian_td_odds" id="ball_7_h5" width="40">2.21</td>
                <td class="bian_td_inp" id="ball_7_t5"><input name="ball_7_5" id="ball_7_5" class="inp1" onkeyup="digitOnly(this)" onfocus="this.className=&#39;inp1m&#39;" onblur="this.className=&#39;inp1&#39;;" type="text" maxlength="5"></td>
            </tr>
      </tbody></table>
      <div class="button_body"><a onclick="reset()" class="button again" title="重填"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="button submit" onclick="order();" title="下注"></a></div>

	   
      </form>
    </div>
    <div class="lottery_clear"></div>
</font></div><font>
</font></div><font>
<div class="lottery_clear"></div>

</font></div><font>

<div id="endtime"></div>
<script type="text/javascript">loadinfo();</script>
<iframe id="OrderFrame" name="OrderFrame" border="0" marginwidth="0" framespacing="0" src="" frameborder="0" noresize="" width="0" scrolling="AUTO" height="0" vspale="0" style="display:none"></iframe>
<div style="display:none" id="look"><embed width="0" height="0" src="js/2.swf" type="application/x-shockwave-flash" hidden="true"></div>

<script language="javascript" src="resource/js/load_results_cqssc.js"></script>
<script>
function cs_table(tag,el,id,element,num){
	var tagsContent = document.getElementById(tag);
	var tagsLi = tagsContent.getElementsByTagName(el);

	var tagContent = document.getElementById(id);
	var tagLi = tagContent.getElementsByTagName(element);
	var len= tagsLi.length;
	var back_img,n_img;
	for(var i=0; i<len; i++){				
		if(i == '0'){
			back_img = 'fiest_bg01.png';
			n_img = 'fiest_bg02.png';
		}else if(i+1 == len){
			back_img = 'wu_bg02.png';
			n_img = 'wu_bg01.png';
		}else{
			back_img = 'top_bg02.png';
			n_img = 'top_bg.png';
		}
		if(i == num){
			tagsLi[i].style.background = 'url(images/'+back_img+') repeat-x';
			tagsLi[i].style.fontWeight = 'bold';
			tagLi[i].style.display="block"; 
		}else{
			tagsLi[i].style.background = 'url(images/'+n_img+') repeat-x';
			tagsLi[i].style.fontWeight = 'normal';
			tagLi[i].style.display="none"; 
		}
	}
	if(tag=='tag4'){
		window.scrollTo(0,document.body.scrollHeight);
	}
}
</script>
<script type="text/javascript" language="javascript" src="resource/js/left_mouse.js"></script>
</font>
</body>
</html>