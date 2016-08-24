<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0046)http://www.js9588.com/Member/User/PassWord.php -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Welcome</title>
<link rel="stylesheet" type="text/css" href="resource/css/general.css">
<script type="text/javascript" src="resource/js/jquery.js"></script>
<script type="text/javascript" src="resource/js/member.js"></script>
</head>
<body>
  <div class="ui-moneyBox">
  <ul>
        <table width="100%" border="0" cellspacing="0" cellpadding="5">
            <tbody><tr>
            <th width="50%">修改登录密码</th>
            <th width="50%">修改资金密码</th>
          </tr>
            <tr>
            <form id="form1" name="form1" method="post" action="http://www.js9588.com/Member/User/PassWord.php?action=login"></form>
              <td height="200" align="center">
              <div style="width:340px; height:40px; margin:0 auto; line-height:40px; text-align:left; border-bottom:1px #CCCCCC solid; padding-left:10px;">请输入原登录密码：<input name="LoginPass_1" maxlength="16" type="password" class="Input_200" id="LoginPass_1">
              </div>
              <div style="width:340px; height:40px; margin:0 auto; line-height:40px; text-align:left; border-bottom:1px #CCCCCC solid; padding-left:10px;">请输入新登录密码：<input name="LoginPass_2" maxlength="16" type="password" class="Input_200" id="LoginPass_2">
              </div>
              <div style="width:340px; height:40px; margin:0 auto; line-height:40px; text-align:left; border-bottom:1px #CCCCCC solid; padding-left:10px;">请确认新登录密码：<input name="LoginPass_3" maxlength="16" type="password" class="Input_200" id="LoginPass_3">
              </div>
              <div style="width:350px; height:50px; margin:0 auto; line-height:40px; text-align:center; padding-top:10px;">
                
                  <input name="button" type="submit" class="m_btn" id="button" value="确认修改">
                
              </div>
              </td>
              
              <form id="form2" name="form2" method="post" action="http://www.js9588.com/Member/User/PassWord.php?action=money"></form>
              <td height="200" align="center">
              <div style="width:340px; height:40px; margin:0 auto; line-height:40px; text-align:left; border-bottom:1px #CCCCCC solid; padding-left:10px;">请输入原资金密码：
                <input name="MoneyPass_1" maxlength="16" type="password" class="Input_200" id="MoneyPass_1">
              </div>
              <div style="width:340px; height:40px; margin:0 auto; line-height:40px; text-align:left; border-bottom:1px #CCCCCC solid; padding-left:10px;">请输入新资金密码：
                <input name="MoneyPass_2" maxlength="16" type="password" class="Input_200" id="MoneyPass_2">
              </div>
              <div style="width:340px; height:40px; margin:0 auto; line-height:40px; text-align:left; border-bottom:1px #CCCCCC solid; padding-left:10px;">请确认新资金密码：
                <input name="MoneyPass_3" maxlength="16" type="password" class="Input_200" id="MoneyPass_3">
              </div>
              <div style="width:350px; height:50px; margin:0 auto; line-height:40px; text-align:center; padding-top:10px;">
                
                  <input name="button" type="submit" class="m_btn" id="button" value="确认修改">
                
              </div>
              </td>
              
          </tr>
      </tbody></table>
    </ul>
</div>
<script type="text/javascript">
setTimeout("LoadMoney()",1000);
</script>

</body></html>