//项目绝对路径
function getRootPath(){
    //获取当前网址，如： http://localhost:8083/proj/meun.jsp
    var curWwwPath = window.document.location.href;
    //获取主机地址之后的目录，如： proj/meun.jsp
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPath = curWwwPath.substring(0, pos);
    return(localhostPath );
}
var path="";
$(document).ready(function() {

     path = getRootPath();
});
    function registerfunction() {

      parent.document.getElementById('Mainid').src=path+'/StayRegister/toregister.do';
    }

    function teamRegisterfunction() {
        var chk_value = [];
        var table = document.getElementById("tbody");
        var selectedIndex = "";
        var roomNumber = "";
        var TOF = 0;
        $('input[name="id"]:checked').each(function () {
            chk_value.push($(this).val());
            selectedIndex = this.parentNode.parentNode.rowIndex;
            roomNumber = table.rows[selectedIndex - 1].cells[1].innerHTML;
            TOF = table.rows[selectedIndex - 1].cells[12].innerHTML;
        });
        if (TOF == 69) {
            alert("很抱歉！该数据已经结账没法进行此操作！");
            return;
        }
        if (chk_value != "") {
            if (chk_value.toString().indexOf(",") > 0) {
                alert("登记只能根据一个房间登记");
            } else {
                parent.document.getElementById("Mainid").src = '${ctx}/StayRegister/toregister.do?id=' + chk_value +
                    '&roomNumber=' + roomNumber + '&LvKeLeiXingId=' + 56;
            }
        } else {
            alert("请选择一条房间进行登记");
        }
        /* parent.document.getElementById('Mainid').src='/StayRegister/toregister.do'; */
    }


    function addfunction() {
        parent.document.getElementById('Mainid').src = '${ctx}/Predetermine/toadd.do';
    }

    function arrangefunction() {
        parent.document.getElementById('Mainid').src = path+'/StayRegister/toarrangeroom.do';
    }

    function teamArrangefunction() {
        var tuanDuiID = document.getElementById("tuanDuiId").value;
        if (tuanDuiID != "") {
            parent.document.getElementById('Mainid').src = '${ctx}/StayRegister/toarrangeroom.do?tuanDuiID=' + tuanDuiID +
                '&LvKeLeiXingId=' + 56;
        } else {
            alert("请选择对象再安排房间！");
        }
    }

    function changroomfunction(chk_value) {
       parent.document.getElementById('Mainid').src = getRootPath()+'/StayRegister/tochangroom.do?stayRegisterId=' +chk_value
    }

    function teamChangroomfunction() {
        var chk_value = [];
        var table = document.getElementById("tbody");
        var selectedIndex = "";
        var lvKeName = "";
        var TOF = 0;
        $('input[name="id"]:checked').each(function () {
            chk_value.push($(this).val());
            selectedIndex = this.parentNode.parentNode.rowIndex;
            lvKeName = table.rows[selectedIndex - 1].cells[5].innerHTML;
            TOF = table.rows[selectedIndex - 1].cells[12].innerHTML;
        });
        if (TOF == 69) {
            alert("很抱歉！该数据已经结账没法进行此操作！");
            return;
        }
        if (chk_value != "") {
            if (chk_value.toString().indexOf(",") > 0) {
                alert("只能选择一个房间进行换房哦");
            } else {
                parent.document.getElementById('Mainid').src = '${ctx}/StayRegister/tochangroom.do?id=' +
                    chk_value + '&lvKeName=' + lvKeName + '&LvKeLeiXingId=' + 56;
            }
        } else {
            alert("请选择一条数据进行换房");
        }
    }


    function depositfunction() {
        var chk_value = [];
        var table = document.getElementById("tbody");
        var selectedIndex = "";
        var lvKeName = "";
        var roomNumber = "";
        var depoistId="";
        $('input[name="id"]:checked').each(function () {
            chk_value.push($(this).val());
            selectedIndex = this.parentNode.parentNode.rowIndex;
            lvKeName = table.rows[selectedIndex - 1].cells[5].innerHTML;
            roomNumber = table.rows[selectedIndex - 1].cells[1].innerHTML;
            depoistId = table.rows[selectedIndex - 1].cells[11].innerHTML;
        });
        if (chk_value != "") {
            if (chk_value.toString().indexOf(",") > 0) {
                alert("只能选择一个房间查看押金记录哦");
            } else {
                parent.document.getElementById('Mainid').src = getRootPath()+'/StayRegister/todeposit.do?stayRegisterId=' +
                    chk_value + '&passengerName=' + lvKeName + '&LvKeLeiXingId=' + 55+'&roomNumber='+roomNumber+'&dpId='+depoistId;
            }
        } else {
            alert("请选择一条数据进行查看押金记录");
        }
    }

    function teamDepositfunction() {
        var chk_value = [];
        var table = document.getElementById("tbody");
        var selectedIndex = "";
        var lvKeName = "";
        $('input[name="id"]:checked').each(function () {
            chk_value.push($(this).val());
            selectedIndex = this.parentNode.parentNode.rowIndex;
            lvKeName = table.rows[selectedIndex - 1].cells[5].innerHTML;
        });
        if (chk_value != "") {
            if (chk_value.toString().indexOf(",") > 0) {
                alert("只能选择一个房间查看押金记录哦");
            } else {
                parent.document.getElementById('Mainid').src = '${ctx}/StayRegister/todeposit.do?id=' +
                    chk_value + '&lvKeName=' + lvKeName + '&LvKeLeiXingId=' + 56;
            }
        } else {
            alert("请选择一条数据进行查看押金记录");
        }
    }


    function consumptionfunction() {
        var chk_value = [];
        var table = document.getElementById("tbody");
        var selectedIndex = "";
        var lvKeName = "";
        var roomNumber = "";
        var TOF = 0;
        $('input[name="id"]:checked').each(function () {
            chk_value.push($(this).val());
            selectedIndex = this.parentNode.parentNode.rowIndex;
            lvKeName = table.rows[selectedIndex - 1].cells[5].innerHTML;
            roomNumber = table.rows[selectedIndex - 1].cells[1].innerHTML;
            TOF = table.rows[selectedIndex - 1].cells[10].innerHTML;
        });
        if (chk_value != "") {
            if (chk_value.toString().indexOf(",") > 0) {
                alert("只能选择一个房间添加消费哦");
            } else {
                if (lvKeName == "") {
                    alert("请先登记");
                } else {
                    parent.document.getElementById('Mainid').src = getRootPath()+'/StayRegister/toconsumption.do?stayRegisterId=' +
                        chk_value + '&passengerName=' + lvKeName + '&LvKeLeiXingId=' + 56 + '&roomNumber=' + roomNumber + '&isBillID=' + TOF;
                }
            }
        } else {
            alert("请选择一条数据进行添加消费");
        }
    }

    function teamConsumptionfunction() {
        var chk_value = [];
        var table = document.getElementById("tbody");
        var selectedIndex = "";
        var lvKeName = "";
        var roomNumber = "";
        var TOF = 0;
        $('input[name="id"]:checked').each(function () {
            chk_value.push($(this).val());
            selectedIndex = this.parentNode.parentNode.rowIndex;
            lvKeName = table.rows[selectedIndex - 1].cells[5].innerHTML;
            roomNumber = table.rows[selectedIndex - 1].cells[1].innerHTML;
            TOF = table.rows[selectedIndex - 1].cells[10].innerHTML;
        });
        if (chk_value != "") {
            if (chk_value.toString().indexOf(",") > 0) {
                alert("只能选择一个房间添加消费哦");
            } else {
                if (lvKeName == "") {
                    alert("请先登记");
                } else {
                    parent.document.getElementById('Mainid').src = '${ctx}/StayRegister/toconsumption.do?stayRegisterId=' +
                        chk_value + '&passengerName=' + lvKeName + '&LvKeLeiXingId=' + 56 + '&roomNumber=' + roomNumber + '&isBillID=' + TOF;
                }
            }
        } else {
            alert("请选择一条数据进行添加消费");
        }
    }


    function payfunction(sId) {
       parent.document.getElementById('Mainid').src = getRootPath()+'/StayRegister/topay.do?stayRegisterId=' + sId ;
    }

function tuiFangfunction(sId) {
    parent.document.getElementById('Mainid').src = getRootPath()+'/StayRegister/tuiFang.do?stayRegisterId=' + sId ;
}

    function volumeroomfunction() {
        var tuanDuiID = document.getElementById("tuanDuiId").value;
        var teamName = document.getElementById("teamNameId").value;
        if (tuanDuiID != "") {
            parent.document.getElementById('Mainid').src = '${ctx}/StayRegister/tovolumeroom.do?tuanDuiID=' +
                tuanDuiID + '&teamName=' + teamName;
        } else {
            alert("请选择对象再安排房间！");
        }
    }

    function teamdepositfunction() {
        parent.document.getElementById('Mainid').src = '${ctx}/StayRegister/toteamdeposit.do';
    }

    function teampayfunction() {
        var tuanDuiID = document.getElementById("tuanDuiId").value;
        var teamIsBillId = document.getElementById("teamIsBillId").value;
        if (teamIsBillId == 69) {
            alert("很抱歉！该状态为已结账没法进行此操作！");
            return;
        }
        if (tuanDuiID != "") {
            parent.document.getElementById('Mainid').src = '${ctx}/StayRegister/toteampay.do?tuanDuiID=' + tuanDuiID;
        } else {
            alert("请选择对象再结账！");
        }
    }

    function shiftpersonagefunction() {
        var id = [];
        var table = document.getElementById("tbody");
        var selectedIndex = "";
        var stayregisterdetailsId = "";
        $('input[name="id"]:checked').each(function () {
            id.push($(this).val());
            selectedIndex = this.parentNode.parentNode.rowIndex;
            stayregisterdetailsId = table.rows[selectedIndex - 1].cells[13].innerHTML;
        });
        if (stayregisterdetailsId == "") {
            alert("此房间还没有登记哦！不能进行此操作");
            return false;
        }
        if (id != "") {
            if (id.toString().indexOf(",") > 0) {
                alert("转为散客只能选择一条");
            } else {
                parent.document.getElementById('Mainid').src = '${ctx}/StayRegister/toshiftpersonage.do?id=' + id +
                    '&stayregisterdetailsId=' + stayregisterdetailsId
            }
        } else {
            alert("请选择一条数据进行转为散客");
        }
    }


    function shiftteamfunction() {
        var id = [];
        var table = document.getElementById("tbody");
        var selectedIndex = "";
        var stayregisterdetailsId = "";
        $('input[name="id"]:checked').each(function () {
            id.push($(this).val());
            selectedIndex = this.parentNode.parentNode.rowIndex;
            stayregisterdetailsId = table.rows[selectedIndex - 1].cells[13].innerHTML;
        });
        if (stayregisterdetailsId == "") {
            alert("此房间还没有登记哦！不能进行此操作");
            return false;
        }
        if (id != "") {
            if (id.toString().indexOf(",") > 0) {
                alert("转入团队只能选择一条");
            } else {
                parent.document.getElementById('Mainid').src = '${ctx}/StayRegister/toshiftteam.do?id=' + id +
                    '&stayregisterdetailsId=' + stayregisterdetailsId;
            }
        } else {
            alert("请选择一条数据进行转入团队");
        }
    }


    function updatefunction() {
        var chk_value = [];
        $('input[name="id"]:checked').each(function () {
            chk_value.push($(this).val());
        });
        if (chk_value != "") {
            if (chk_value.toString().indexOf(",") > 0) {
                alert("修改只能选择一条");
            } else {
                parent.document.getElementById("Mainid").src = getRootPath()+'/StayRegister/toModify.do?stayRegisterId=' + chk_value;
            }
        } else {
            alert("请选择一条数据进行修改");
        }
    }

    function deletefunction() {
        var chk_value = [];
        var table = document.getElementById("tbody");
        var selectedIndex = "";
        var TOF = 0;
        $('input[name="id"]:checked').each(function () {
            chk_value.push($(this).val());
            selectedIndex = this.parentNode.parentNode.rowIndex;
            TOF = table.rows[selectedIndex - 1].cells[10].innerHTML;
        });
        if(TOF!=69){
            alert("该条记录未结账或未退房，不能删除")
            return;
        }else{
            if (chk_value != "") {
                var flag = window.confirm("注意：您确定要永久删除该信息吗?");
                if (flag) {
                    parent.document.getElementById("Mainid").src = getRootPath()+'/StayRegister/delete.do?ids=' + chk_value;
                }
            } else {
                alert("请选择一条或多条数据进行删除");
            }
        }


    }


    function selectChange() {
        var isBillID = document.getElementById("isBillID").value;
        var LvKeLeiXingId = document.getElementById("LvKeLeiXingId").value;
        parent.document.getElementById("Mainid").src = getRootPath()+'/StayRegister/tolist.do?isBillID=' + isBillID +
            '&LvKeLeiXingId=' + LvKeLeiXingId;
    }


    function selectfunction() {
        var isBillID = document.getElementById("isBillID").value;
        var txtname = document.getElementById("txtnameid").value;
        parent.document.getElementById("Mainid").src = '${ctx}/StayRegister/tolist.do?LvKeLeiXingId=' + 55 +
            '&isBillID=' + isBillID + "&txtname=" + txtname;
    }


    function teamSelect() {
        var isBillID = document.getElementById("teamIsBillId").value;
        var txtname = document.getElementById("roomNumberId").value;
        var tuanDuiID = document.getElementById("tuanDuiId").value;
        var teamNameId = document.getElementById("teamNameId").value;
        var teamCodeId = document.getElementById("teamCodeId").value;
        var principalId = document.getElementById("principalId").value;
        var contactPhoneNUmberId = document.getElementById("contactPhoneNUmberId").value;
        var registerTimeId = document.getElementById("registerTimeId").value;
        parent.document.getElementById("Mainid").src = '${ctx}/StayRegister/toteamlist.do?LvKeLeiXingId=' + 56 +
            '&isBillID=' + isBillID + "&txtname=" + txtname + "&tuanDuiID=" + tuanDuiID + "&teamNameId=" + teamNameId
            + "&teamCodeId=" + teamCodeId + "&principalId=" + principalId +
            "&contactPhoneNUmberId=" + contactPhoneNUmberId + "&registerTimeId=" + registerTimeId;
    }


    teamfunction = function () {
        var isBillID = document.getElementById("isBillID").value;
        parent.document.getElementById("Mainid").src = path+'/StayRegister/tolist.do?LvKeLeiXingId=' + 56+'&isBillID='+isBillID;
    };
    lvKefunction = function () {
        var isBillID = document.getElementById("isBillID").value;
        parent.document.getElementById("Mainid").src = path+'/StayRegister/tolist.do?LvKeLeiXingId=' + 55+'&isBillID='+isBillID;
    };


    function selectTarget() {
        var tbody = document.getElementById("tbodyTwo");
        var name = document.getElementById("txtnameidTwo").value;
        var i = 0;
        $("#tbodyTwo").empty();
        $.ajax({
            cache: false,
            type: "POST",
            url: '${ctx}/Predetermine/selectTarget.do',
            data: "txtname=" + name,
            async: false,
            success: function (result) {
                for (var key in result) {
                    i++;
                    var item = result[key];
                    var tr = tbody.insertRow(-1);            // FireFox必须使用-1这个参数

                    var tdcheckbox = tr.insertCell(-1);      // Table 有多少列就添加多少个这个
                    var tdTargetTypeName = tr.insertCell(-1);
                    var tdTeamName = tr.insertCell(-1);
                    var tdTeamCode = tr.insertCell(-1);
                    var tdPrincipal = tr.insertCell(-1);
                    var tdRegisterTime = tr.insertCell(-1);
                    var tdContactPhoneNUmber = tr.insertCell(-1);

                    tdcheckbox.innerHTML = "<input type='radio' name='idTwo' value='" + item.id + "'>";
                    tdTargetTypeName.innerHTML = item.targetTypeName;
                    tdTeamName.innerHTML = item.teamName;
                    tdTeamCode.innerHTML = item.teamCode;         //中间这个是数据
                    tdPrincipal.innerHTML = item.principal;
                    tdRegisterTime.innerHTML = new Date(item.registerTime).Format("yyyy-MM-dd hh:mm:ss");
                    tdContactPhoneNUmber.innerHTML = item.contactPhoneNUmber;
                }
                if (i == 0) {
                    alert("很抱歉！没有查找到你要找的数据");
                }
            },
            error: function (data) {
            }
        });
    }


    function confirmRarget() {
        var chk_value = [];
        var table = document.getElementById("tbodyTwo");
        var selectedIndex = "";
        var teamName = "";
        var teamCode = "";
        var principal = "";
        var contactPhoneNUmber = "";
        var registerTime = "";
        $('input[name="idTwo"]:checked').each(function () {
            chk_value.push($(this).val());
            selectedIndex = this.parentNode.parentNode.rowIndex;         // 获取选中的索引 单装他的变量不是数组，可以为数组
            teamName = table.rows[selectedIndex - 1].cells[2].innerHTML;     // 获取选中的索引的 单元格的值
            teamCode = table.rows[selectedIndex - 1].cells[3].innerHTML;     // 获取选中的索引的 单元格的值
            principal = table.rows[selectedIndex - 1].cells[4].innerHTML;     // 获取选中的索引的 单元格的值
            contactPhoneNUmber = table.rows[selectedIndex - 1].cells[6].innerHTML;     // 获取选中的索引的 单元格的值
            registerTime = table.rows[selectedIndex - 1].cells[5].innerHTML;     // 获取选中的索引的 单元格的值
        });
        document.getElementById("tuanDuiId").value = chk_value;
        document.getElementById("teamNameId").value = teamName;
        document.getElementById("teamCodeId").value = teamCode;
        document.getElementById("principalId").value = principal;
        document.getElementById("contactPhoneNUmberId").value = contactPhoneNUmber;
        document.getElementById("registerTimeId").value = registerTime;

        var isBillID = document.getElementById("teamIsBillId").value;
        var tuanDuiID = document.getElementById("tuanDuiId").value;
        teamSelect();
        /* $.ajax({
              cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
            type: "POST",                                           //上面3行都是必须要的
            url: '/StayRegister/ajaxSelectTeamSumcont.do',   //地址 type 带参数
            data:"tuanDuiID="+tuanDuiID+"&isBillID="+isBillID,     // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
            async:false,                                          // 是否 异步 提交
            success: function (result) {
               document.getElementById("sumConstId").value=result;
            },
            error: function(data) {
          }
        }); */
    }




