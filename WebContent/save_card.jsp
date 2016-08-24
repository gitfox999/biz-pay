<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0047)http://www.7378b.com/Member/Money/Save_Card.php -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Welcome</title>
<link rel="stylesheet" type="text/css" href="resource/css/general.css">
<script type="text/javascript" src="resource/js/jquery.js"></script>
<script type="text/javascript" src="resource/js/member.js"></script>
<script type="text/javascript" src="resource/js/City.js"></script>
</head>
  <body><div class="ui-moneyBox">
    <ul>
        <table width="100%" border="0" cellspacing="0" cellpadding="5">
        <form id="MyForm" action="class/save_card.jsp" method="post">
          <tbody><tr>
            <td align="right">会员账号：</td>
            <td>ASDFQWER</td>
          </tr>
          <tr>
            <td width="150" align="right">总账户余额：</td>
            <td><font style="font-size:14px;color:#F00; font-weight:bold">0</font></td>
          </tr>
          <tr>
            <td colspan="2" align="left" bgcolor="#384967" style="font-size:14px; color:#FF0">以下为您的收款信息，请认真核对填写，填写后将无法修改，如果要修改您的收款银行账户，请联络我们的客服人员！</td>
          </tr>
          <tr>
            <td width="150" align="right">收款人姓名：</td>
            <td><input type="text" id="trueName" name="trueName" value="" class="Input_250"></td>
          </tr>

          <tr>
            <td align="right">收款银行：</td>
            <td><input type="text" id="Bank" name="Bank" value="" class="Input_250">
           </td>
          </tr>
          <tr>
            <td align="right">银行账号：</td>
            <td><input type="text" id="BankNum" name="BankNum" value="" class="Input_250"></td>
          </tr>
          <tr>
            <td align="right">开户行地址：</td>
            <td><select id="Address_1" name="Address_1" runat="server" onchange="selectCity();" style="height:26px;border:1px solid #d7d7d7;margin-top:2px;"><option value="北京市">北京市</option><option value="天津市">天津市</option><option value="河北省">河北省</option><option value="山西省">山西省</option><option value="内蒙古区">内蒙古区</option><option value="辽宁省">辽宁省</option><option value="吉林省">吉林省</option><option value="黑龙江省">黑龙江省</option><option value="上海市">上海市</option><option value="江苏省">江苏省</option><option value="浙江省">浙江省</option><option value="安徽省">安徽省</option><option value="福建省">福建省</option><option value="江西省">江西省</option><option value="山东省">山东省</option><option value="河南省">河南省</option><option value="湖北省">湖北省</option><option value="湖南省">湖南省</option><option value="广东省">广东省</option><option value="广西区">广西区</option><option value="海南省">海南省</option><option value="重庆市">重庆市</option><option value="四川省">四川省</option><option value="贵州省">贵州省</option><option value="云南省">云南省</option><option value="西藏区">西藏区</option><option value="陕西省">陕西省</option><option value="甘肃省">甘肃省</option><option value="青海省">青海省</option><option value="宁夏区">宁夏区</option><option value="新疆区">新疆区</option><option value="台湾省">台湾省</option><option value="香港特区">香港特区</option><option value="澳门特区">澳门特区</option></select>
            <select id="Address_2" name="Address_2" runat="server" onchange="selectcounty()" style="height:26px;border:1px solid #d7d7d7;margin-top:2px;"><option value="北京辖区">北京辖区</option><option value="北京辖县">北京辖县</option></select>
            <select id="Address_3" name="Address_3" runat="server" style="height:26px;border:1px solid #d7d7d7; margin-top:2px;"><option value="东城区">东城区</option><option value="西城区">西城区</option><option value="崇文区">崇文区</option><option value="宣武区">宣武区</option><option value="朝阳区">朝阳区</option></select>
            <input name="Address_4" type="text" class="Input_250" id="Address_4" value="XX街XX支行" onfocus="this.value=\"\"" onblur="if(!value){value=defaultValue;}"></td>
          </tr>
          <tr>
            <td colspan="2" align="left" style="padding-left:160px;"><input type="button" onclick="sub()" name="button" id="button" value="确认录入" class="m_btn"></td>
          </tr>
        </tbody></table>
        </form>
    </ul>
  </div>
<script type="text/javascript">
Init('','','')

function sub(){
	if(confirm("确认提交该信息吗？提交后将无法修改！")){
		$("#MyForm").submit();
	}
}
</script>

</body></html>