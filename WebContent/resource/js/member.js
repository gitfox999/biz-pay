document.oncontextmenu = new Function("event.returnValue=false;");
function digitOnly($this) {
    var n = $($this);
    var r = /^\+?[1-9][0-9]*$/;
    if (!r.test(n.val())) {
        n.val("");
    }
}
//数字验证 过滤非法字符
function clearNoNum(obj) {
    //先把非数字的都替换掉，除了数字和.
    obj.value = obj.value.replace(/[^\d.]/g, "");
    //必须保证第一个为数字而不是.
    obj.value = obj.value.replace(/^\./g, "");
    //保证只有出现一个.而没有多个.
    obj.value = obj.value.replace(/\.{2,}/g, ".");
    //保证.只出现一次，而不能出现两次以上
    obj.value = obj.value.replace(".", "$#$").replace(/\./g, "").replace("$#$", ".");
    if (obj.value != '') {
        var re = /^\d+\.{0,1}\d{0,2}$/;
        if (!re.test(obj.value))
        {
            obj.value = obj.value.substring(0, obj.value.length - 1);
            return false;
        }
    }
}
function isChinese(str) {
    return /[\u4E00-\u9FA0]/.test(str);
}
function Go(url) {
    window.location.href = url;
}

//表格各行换色
function bianse(o, a, b, c, d) {
    var t = document.getElementById(o).getElementsByTagName("tr");
    for (var i = 1; i < t.length - 1; i++) {
        t[i].style.backgroundColor = (t[i].sectionRowIndex % 2 == 0) ? a : b;
        t[i].onclick = function () {
            if (this.x != "1") {
                this.x = "1";//本来打算直接用背景色判断，FF获取到的背景是RGB值，不好判断 
                this.style.backgroundColor = d;
            } else {
                this.x = "0";
                this.style.backgroundColor = (this.sectionRowIndex % 2 == 0) ? a : b;
            }
        }
        t[i].onmouseover = function () {
            if (this.x != "1")
                this.style.backgroundColor = c;
        }
        t[i].onmouseout = function () {
            if (this.x != "1")
                this.style.backgroundColor = (this.sectionRowIndex % 2 == 0) ? a : b;
        }
    }
}
//二级联动
var strArea = new Array();
strArea[0] = ['总账户', '0', 'A', 'ALL'];
strArea[1] = ['AG旗舰厅', '1', 'A', 'AG'];
strArea[2] = ['BB娱乐场', '2', 'A', 'BBIN'];
strArea[3] = ['VIP国际厅', '3', 'A', 'VIP'];
strArea[4] = ['新天地旗舰厅', '4', 'A', 'XTD'];
strArea[5] = ['MG娱乐场', '5', 'A', 'MG'];
strArea[6] = ['OG娱乐场', '6', 'A', 'OG'];
strArea[7] = ['OB娱乐场', '7', 'A', 'OB'];
strArea[8] = ['PT娱乐场', '8', 'A', 'PT'];
strArea[9] = ['HB娱乐场', '9', 'A', 'HB'];
strArea[10] = ['GD娱乐场', '10', 'A', 'GD'];
strArea[11] = ['BS体育', '11', 'A', 'MBA'];
strArea[12] = ['ABA娱乐场', '12', 'A', 'ABA'];
strArea[13] = ['APT娱乐场', '13', 'A', 'APT'];
strArea[14] = ['PNG娱乐场', '14', 'A', 'PNG'];

strArea[15] = ['AG旗舰厅', '15', '0', 'AG'];
strArea[16] = ['BB娱乐场', '16', '0', 'BBIN'];
strArea[17] = ['VIP国际厅', '17', '0', 'VIP'];
strArea[18] = ['新天地旗舰厅', '18', '0', 'XTD'];
strArea[19] = ['MG娱乐场', '19', '0', 'MG'];
strArea[20] = ['OG娱乐场', '20', '0', 'OG'];
strArea[21] = ['OB娱乐场', '21', '0', 'OB'];
strArea[22] = ['PT娱乐场', '22', '0', 'PT'];
strArea[23] = ['HB娱乐场', '23', '0', 'HB'];
strArea[24] = ['GD娱乐场', '24', '0', 'GD'];
strArea[25] = ['BS体育', '25', '0', 'MBA'];
strArea[26] = ['ABA娱乐场', '26', '0', 'ABA'];
strArea[27] = ['APT娱乐场', '27', '0', 'APT'];
strArea[28] = ['PNG娱乐场', '28', '0', 'PNG'];

strArea[29] = ['总账户', '29', '1', 'ALL'];
strArea[30] = ['总账户', '30', '2', 'ALL'];
strArea[31] = ['总账户', '31', '3', 'ALL'];
strArea[32] = ['总账户', '32', '4', 'ALL'];
strArea[33] = ['总账户', '33', '5', 'ALL'];
strArea[34] = ['总账户', '34', '6', 'ALL'];
strArea[35] = ['总账户', '35', '7', 'ALL'];
strArea[36] = ['总账户', '36', '8', 'ALL'];
strArea[37] = ['总账户', '37', '9', 'ALL'];
strArea[38] = ['总账户', '38', '10', 'ALL'];
strArea[39] = ['总账户', '39', '11', 'ALL'];
strArea[40] = ['总账户', '40', '12', 'ALL'];
strArea[41] = ['总账户', '41', '13', 'ALL'];
strArea[42] = ['总账户', '42', '14', 'ALL'];

function ddl_Clear(ddl_name) {
    var obj = document.getElementById(ddl_name);
    for (var i = obj.options.length - 1; i >= 0; i--) {
        obj.options[i] = null;
    }
}
function ddl_selected(ddl_name, match_val, isValue) {
    var obj = document.getElementById(ddl_name);
    for (var i = 0; i < obj.options.length; i++) {
        var matchobj = obj.options[i].value;
        if (!isValue) {
            matchobj = obj.options[i].Text;
        }
        if (match_val == matchobj) {
            obj.options[i].selected = "selected";
        }
    }
}
function delspace(findstr) {
    var myfind = findstr;
    for (var i = 0; i < findstr.length; i++) {
        var myfind = myfind.replace(" ", "");
    }
    return myfind;
}
function ddl_Bind(ddl_name, bindData, keyword) {
    var obj = document.getElementById(ddl_name);
    for (var i = 0; i < bindData.length; i++) {
        if (bindData[i][2] == keyword) {
            if (i == 0) {
                if (bindData[i][0] != "") {
                    obj.add(new Option(bindData[i][0], bindData[i][1]));
                }
            } else {
                obj.add(new Option(bindData[i][0], bindData[i][1]));
            }
        }
    }
    var num = 0;
    var subValue = obj.options[num].value;
    ddl_selected(ddl_name, num, true)
    ddl_changed('To', subValue, strArea);
}
function ddl_changed(ddl_name, keywords, ddl_data) {
    var obj = document.getElementById(ddl_name);
    var m = 0;

    ddl_Clear(ddl_name);
    for (var i = 0; i < ddl_data.length; i++) {
        if (ddl_data[i][2] == keywords) {
            obj.options[m] = (new Option(ddl_data[i][0], ddl_data[i][3]));
            m = m + 1;
        }
    }
    obj.fireEvent("onchange");
}
function GoToMoney() {
    var Money = $("#GoToMoney").val();
    var Go = $("#Go").val();
    var To = $("#To").val();
    var Key = $("#Key").val();
    var GoToType = $("#GoToType").val();
    if (Money == '') {
        alert("请输入要转换的金额！");
        return false;
    }
    $("#loading").show();
    $("#button").attr("disabled", "true");
    $.post("GoTo_Money.php", {T: Math.random(), Go: Go, To: To, Money: Money, Key: Key, GoToType: GoToType}, function (data)
    {
        alert(data.txt);
        $("#loading").hide();
        location.reload();
    }, "json");
}
function TakeMoney() {
    var Money = $("#Money").val();
    var MoneyPass = $("#MoneyPass").val();
    var Key = $("#Key").val();
    var Num = $("#Num").val();
    if (Money == '') {
        alert("请输入提款金额！");
        return false;
    }
    $("#loading").show();
    if (Num > 5) {
        if (confirm('您今日的提款已经超过【5次】！\n\n每笔提款我们将收取50元手续费作为行政费用！\n\n您确定还要继续提款吗？')) {
            $("#button").attr("disabled", "true");
            $.post("class/take.jsp", {T: Math.random(), Money: Money, MoneyPass: MoneyPass, Key: Key, Num: Num}, function (data)
            {
                if (data.ok > 0) {
                    $("#loading").hide();
                    alert('提款申请成功！\n\n财务部门将在审核过后，将您的提款金额存入您的提款账号中！\n\n您也可以到会员中心【提现记录】里查询您的提款状态！');
                    Go('takelist.jsp');
                    return false;
                }
                if (data.ok == 0) {
                    $("#loading").hide();
                    alert(data.txt);
                    location.reload();
                    return false;
                }
            }, "json");
        } else {
            return false;
        }
    } else {
        $("#button").attr("disabled", "true");
        $.post("class/take.jsp", {T: Math.random(), Money: Money, MoneyPass: MoneyPass, Key: Key, Num: Num}, function (data)
        {
            if (data.ok > 0) {
                $("#loading").hide();
                alert('提款申请成功！\n\n财务部门将在审核过后，将您的提款金额存入您的提款账号中！\n\n您也可以到会员中心【提现记录】里查询您的提款状态！');
                Go('takelist.jsp');
                return false;
            }
            if (data.ok == 0) {
                $("#loading").hide();
                alert(data.txt);
                location.reload();
                return false;
            }
        }, "json");
    }

}
var type_money_id = 'All_Money';
function LoadMoney(type_money_id) {
    $("#" + type_money_id).html('<img src="../Images/load.gif"/></span>');
    if (type_money_id == 'All_Money') {
        $.post("../Money/Load_Money.php", {type: 0, t: Math.random()}, function (data)
        {
            $("#All_Money").html(data.money);
        }, "json");
    }
    if (type_money_id == 'Vip_Money') {
        $.post("../Money/Load_Money.php", {type: 3, t: Math.random()}, function (data)
        {
            $("#Vip_Money").html(data.money);
        }, "json");
    }
    if (type_money_id == 'Ag_Money') {
        $.post("../Money/Load_Money.php", {type: 1, t: Math.random()}, function (data)
        {
            $("#Ag_Money").html(data.money);
        }, "json");
    }
    if (type_money_id == 'Bb_Money') {
        $.post("../Money/Load_Money.php", {type: 2, t: Math.random()}, function (data)
        {
            $("#Bb_Money").html(data.money);
        }, "json");
    }
    if (type_money_id == 'Xtd_Money') {
        $.post("../Money/Load_Money.php", {type: 4, t: Math.random()}, function (data)
        {
            $("#Xtd_Money").html(data.money);
        }, "json");
    }
    if (type_money_id == 'Mg_Money') {
        $.post("../Money/Load_Money.php", {type: 5, t: Math.random()}, function (data)
        {
            $("#Mg_Money").html(data.money);
        }, "json");
    }
    if (type_money_id == 'Og_Money') {
        $.post("../Money/Load_Money.php", {type: 6, t: Math.random()}, function (data)
        {
            $("#Og_Money").html(data.money);
        }, "json");
    }
    if (type_money_id == 'ALLBO_Money') {
        $.post("../Money/Load_Money.php", {type: 7, t: Math.random()}, function (data)
        {
            $("#ALLBO_Money").html(data.money);
        }, "json");
    }
    if (type_money_id == 'PT_Money') {
        $.post("../Money/Load_Money.php", {type: 8, t: Math.random()}, function (data)
        {
            $("#PT_Money").html(data.money);
        }, "json");
    }
    if (type_money_id == 'HB_Money') {
        $.post("../Money/Load_Money.php", {type: 9, t: Math.random()}, function (data)
        {
            $("#HB_Money").html(data.money);
        }, "json");
    }
    if (type_money_id == 'GD_Money') {
        $.post("../Money/Load_Money.php", {type: 10, t: Math.random()}, function (data)
        {
            $("#GD_Money").html(data.money);
        }, "json");
    }
    if (type_money_id == 'MBA_Money') {
        $.post("../Money/Load_Money.php", {type: 11, t: Math.random()}, function (data)
        {
            $("#MBA_Money").html(data.money);
        }, "json");
    }
    if (type_money_id == 'ABA_Money') {
        $.post("../Money/Load_Money.php", {type: 12, t: Math.random()}, function (data)
        {
            $("#ABA_Money").html(data.money);
        }, "json");
    }
    //20160619添加的2个游戏 cqq
    if (type_money_id == 'APT_Money') {
        $.post("../Money/Load_Money.php", {type: 13, t: Math.random()}, function (data)
        {
            $("#APT_Money").html(data.money);
        }, "json");
    }
    if (type_money_id == 'PNG_Money') {
        $.post("../Money/Load_Money.php", {type: 17, t: Math.random()}, function (data)
        {
            $("#PNG_Money").html(data.money);
        }, "json");
    }
}
function SubInfo() {
    var Money = $('#Money').val();
    var IntoBank = $('#IntoBank').val();
    var cn_date = $('#cn_date').val();
    var InType = $('#InType').val();
    var v_Name = $('#v_Name').val();
    var v_site = $('#v_site').val();
    if (Money == '' || IntoBank == '' || cn_date == '' || InType == '' || v_Name == '' || v_site == '') {
        alert('请填写完整表单！');
        return false;
    }
    if (Money < 100) {
        alert('公司入款最低100元！');
        return false;
    }
    $('#form1').submit();
}