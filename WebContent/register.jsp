<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0043)http://www.js9588.com/Register/Register.php -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title></title>
            
            <meta http-equiv="imagetoolbar" content="no">
            <script type="text/javascript" language="JavaScript" src="resource/js/jquery-1.7.2.min.js"></script>
            <script type="text/javascript" language="JavaScript" src="resource/js/layer.js"></script>
            <link type="text/css" rel="stylesheet" href="resource/css/layer.css" id="skinlayercss">
            <script type="text/javascript" language="JavaScript" src="resource/js/main.js"></script>
            <link href="resource/css/demo.css" type="text/css" rel="stylesheet">
            <link href="resource/css/jqtransform.css" type="text/css" rel="stylesheet">
            <link href="resource/css/Validform.css" type="text/css" rel="stylesheet">
            <style type="text/css">
                <!--
                fieldset {
                    padding:10px;
                    border:1px solid #000000;
                    width:90%;
                    margin:0 auto;
                    text-align:left;
                }
                fieldset legend {
                    color:#000000;
                    font-weight:bold;
                    padding:5px 3px;
                    text-align:left;
                }
                .clear {
                    clear:both; height:0px; width:0px; padding:0; margin:0;
                }
                -->
            </style>
        </head>
        <body style="background: #fff;">
            <form class="registerform jqtransformdone" method="post" action="class/check.jsp">
                <fieldset>
                    <legend>会员登录信息</legend>
                    <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
                        <tbody>
                        <tr>
                            <td width="150" align="right"><font style="color:#F00;">*</font>登录账号：</td>
                            <td width="200"><div class="jqTransformInputWrapper" style="width: 206px;"><div class="jqTransformInputInner"><div><input type="text" onkeyup="value = value.replace(/[^\w\/]/ig, &#39;&#39;)" maxlength="10" name="name" class="inputxt jqtranformdone jqTransformInput" ajaxurl="class/valid.jsp" datatype="s6-10" nullmsg="请设置您的登录账号！" errormsg="账号只能是6-10位，由数字或字母组成！"></div></div></div></td>
                            <td><div class="Validform_checktip">请输入6-10位数字或字母组合的字符！</div></td>
                        </tr>
                        <tr>
                            <td width="150" align="right"><font style="color:#F00;">*</font>登录密码：</td>
                            <td width="200"><div class="jqTransformInputWrapper" style="width: 206px;"><div class="jqTransformInputInner"><div><input type="password" value="" name="password" class="inputxt jqtranformdone jqTransformInput" datatype="*6-16" maxlength="16" nullmsg="请设置您的登录密码！" errormsg="密码范围在6~16位之间！"></div></div></div></td>
                            <td><div class="Validform_checktip">请输入6-10位数字或字母组合的字符！</div></td>
                        </tr>
                        <tr>
                            <td width="150" align="right"><font style="color:#F00;">*</font>确认登录密码：</td>
                            <td width="200"><div class="jqTransformInputWrapper" style="width: 206px;"><div class="jqTransformInputInner"><div><input type="password" value="" name="password2" class="inputxt jqtranformdone jqTransformInput" datatype="*" maxlength="16" recheck="password" nullmsg="请再输入一次密码！" errormsg="您两次输入的账号密码不一致！"></div></div></div></td>
                            <td><div class="Validform_checktip">请再次输入您的登录密码！</div></td>
                        </tr>
                        <tr>
                        <td>&nbsp;</td>
                        <td colspan="2" align="left" style="padding:10px 0 10px 0;">
                            <button id="" name="" type="submit" class=" jqTransformButton"><span><span> 提 交 </span></span></button> <button id="" name="" type="reset" class=" jqTransformButton"><span><span> 重 置 </span></span></button>
                        </td>
                    </tr>
                    </tbody></table>
                    <div class="clear"></div> 
                </fieldset>
        </form>
        <script type="text/javascript" src="resource/js/Validform.js"></script>
        <script type="text/javascript" src="resource/js/jquery.jqtransform-min.js"></script>
        <!--[if IE]><script type="text/javascript" src="js/jquery.bgiframe.min.js"></script><![endif]-->
        <script type="text/javascript">
                            $(function () {
                                //$(".registerform").Validform();  //就这一行代码！;

                                $(".registerform").Validform({
                                    tiptype: function (msg, o, cssctl) {
                                        if (!o.obj.is("form")) {
                                            var objtip = o.obj.parents("td").next().find(".Validform_checktip");
                                            cssctl(objtip, o.type);
                                            objtip.text(msg);
                                        }

                                    },
                                    usePlugin: {
                                        jqtransform: {}
                                    }
                                });
                            })
        </script>
        <script>
$(document).ready(function (e) {
                $('#screensize').val(screen.width + 'x' + screen.height);
            });
            </script>
    
</body></html>