<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0046)http://www.7378b.com/Member/Money/TakeList.php -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Welcome</title>
<link rel="stylesheet" type="text/css" href="resource/css/general.css">
<link rel="stylesheet" type="text/css" href="resource/css/jquery-ui.css">
<script type="text/javascript" src="resource/js/jquery.js"></script>
<script type="text/javascript" src="resource/js/member.js"></script>
<script type="text/javascript" src="resource/js/jquery-ui-datepicker.js"></script>
<script type="text/javascript">
$(function(){
	$("#S_date").datepicker({
		minDate: -31,
		maxDate: 0
	});
	$("#E_date").datepicker({
		minDate: -31,
		maxDate: 0
	});
});
</script>
</head>
<body>
  <div class="ui-moneyBox">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tbody><tr>
    <form id="MyForm" action="" method="get"></form>
      <td align="center"><table border="0" cellspacing="0" cellpadding="0">
        <tbody><tr>
          <td>查询类型：</td>
          <td>
            <select name="Type" id="Type">
              <option value="11,12" selected="selected">全部类型</option>
              <option value="11">会员提款</option>
              <option value="12">系统扣款</option>
            </select></td>
          <td>&nbsp;&nbsp;日期范围（近一个月）：</td>
          <td><input type="text" id="S_date" name="S_date" readonly="readonly" value="2016-08-16" class="Input_100 hasDatepicker"></td>
          <td align="center">&nbsp;~&nbsp;</td>
          <td><input type="text" id="E_date" name="E_date" readonly="readonly" value="2016-08-23" class="Input_100 hasDatepicker"></td>
          <td><input type="submit" name="Button" value="" id="Button" class="S_btn"></td>
        </tr>
      </tbody></table></td>
      
    </tr>
    </tbody></table>
    <ul style="margin-top:10px;">
        <table width="100%" border="0" cellspacing="0" cellpadding="5" id="thetable">
            <tbody><tr>
              <th>操作类型
              </th><th>提款时间（美东）
              </th><th>订单号
              </th><th>提款金额
              </th><th>提款状态
              </th><th>备注
            </th></tr>
	  <tr>
	  	<th colspan="6"><div class="Pagination"><a href="http://www.7378b.com/Member/Money/TakeList.php?page=1" class="tips" title="首页">首页</a> 
<a href="http://www.7378b.com/Member/Money/TakeList.php?page=-1" class="tips" title="上一页">上一页</a> 


<a href="javascript:void(0)" class="tips" title="下一页">下一页</a>
<a href="javascript:void(0)" class="tips" title="末页">末页</a>
</div></th>
	  </tr>
    </tbody></table>
    </ul>
  </div>
<script language="javascript">bianse("thetable","#F5F5F5","#FFFFFF","#FFFFCC","#FFFFCC");</script> 

<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div></body></html>