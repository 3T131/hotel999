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

function removeLvke(pid,e){

    var hit=$(e).parents(".roomRow").find(".roomIdx");
    var selectRoomId=hit.val();
    var passengerIdRoomId = $("#passengerIdRoomId").val();
    var array1 = null;
    var sx = [];
    if (passengerIdRoomId != null && passengerIdRoomId != '' && passengerIdRoomId != undefined) {
        array1 = JSON.parse(passengerIdRoomId);
        for (var i = 0, l = array1.length; i < l; i++) {
            for (var item in array1[i]) {
                if (item == selectRoomId) {
                    var zz=array1[i][item];
                    sx=array1[i][item];
                    for (var j = 0, k = zz.length; j < k; j++) {
                        if(zz[j]==pid){
                            sx.remove(zz[j]);
                            break;
                        }
                    }
                    sx.sort().unique();
                    array1[i][item] = sx;
                }
            }
        }
        var json1 = JSON.stringify(array1);
        $("#passengerIdRoomId").val(json1);
        var lvke = $(e).parents(".lvke24");

        $.ajax({
            cache: false,
            type: "POST",
            url: getRootPath() + '/StayRegister/confirmPassenger.do',
            data: "ids=" + sx,
            async: false,
            dataType: "json",
            success: function (data) {
                var span = '';
                if (data != null) {
                    for (var i = 0, l = data.length; i < l; i++) {
                        span += ' <span style="color: #E75E55">'+data[i].name+'<span onclick="removeLvke('+data[i].pId+',this)" style="cursor: pointer;"  class="icon-remove icon-red"></span> </span>';
                    }
                }
                lvke.html(span);
            },
            error: function (data) {
                alert("数据访问错误！");
            }
        });

    }

}
var biaoji=null;
var selectRoomId=null;
function selectRow(e){
    var hit=$(e).parents(".roomRow");
    biaoji=$(hit);
    selectRoomId= $(hit).find(".roomIdx").val();
}

function souSuo(){
    var name=document.getElementById("txtnameid").value;
    $("#tbody").empty();
    $.ajax({
        cache:false,
        type: "post",
        url: getRootPath()+'/StayRegister/selectPassenger.do',
        data:"name="+name,
        async:false,
        dataType:"json",
        success: function (data) {
            var tr='';
            if(data!=null) {
                for (var i = 0, l = data.length; i < l; i++) {
                    tr += '   <tr>\n' +
                        '      <td><input type="checkbox" name="xxxid" value="' + data[i].pId + '"></td>\n' +
                        '      <td>' + data[i].name + '</td>\n' +
                        '      <td>' + data[i].genderName + '</td>\n' +
                        '      <td>' + data[i].papersName + '</td>\n' +
                        '      <td>' + data[i].papersNumber + '</td>\n' +
                        '      </tr>';
                }
            }
            $("#tbody").html(tr);
        },
        error: function(data) {
        }
    });
}


function passengerQd() {
    var chk_value = [];
    $('input[name="xxxid"]:checked').each(function () {
        chk_value.push($(this).val());
    });

    if (chk_value != "") {
        var passengerIdRoomId = $("#passengerIdRoomId").val();
        var array1 = null;
        var sx = [];
        if (passengerIdRoomId != null && passengerIdRoomId != '' && passengerIdRoomId != undefined) {
            array1 = JSON.parse(passengerIdRoomId);
            for (var i = 0, l = array1.length; i < l; i++) {
                for (var item in array1[i]) {
                    if (item == selectRoomId) {
                        var zz=array1[i][item];
                        for (var j = 0, k = zz.length; j < k; j++) {
                            sx.push(zz[j])
                        }
                        for (var j = 0, k = chk_value.length; j < k; j++) {
                            sx.push(chk_value[j])
                        }
                        sx.sort().unique();
                        array1[i][item] = sx;
                    }
                }
            }
            var json1 = JSON.stringify(array1);
            $("#passengerIdRoomId").val(json1);
            var lvke = $(biaoji).find(".lvke24");

            $.ajax({
                cache: false,
                type: "POST",
                url: getRootPath() + '/StayRegister/confirmPassenger.do',
                data: "ids=" + sx,
                async: false,
                dataType: "json",
                success: function (data) {
                    var span = '';
                    if (data != null) {
                        for (var i = 0, l = data.length; i < l; i++) {
                            span += ' <span style="color: #E75E55">'+data[i].name+'<span onclick="removeLvke('+data[i].pId+',this)" style="cursor: pointer;"  class="icon-remove icon-red"></span> </span>';
                        }
                    }
                    lvke.html(span);
                },
                error: function (data) {
                    alert("数据访问错误！");
                }
            });


        } else {
            alert("你还没有选择旅客哦！");
        }
    }
}

var shijian="";
var guestRoomLevelID=0;
function verify(){
}

function deletefunction(){

    var chk_value=[];
    $('input[name="roomids"]:checked').each(function(){
        chk_value.push($(this).val());
    });

    var ids=$("#roomIds").val();
    var array1= ids.split(",");

    for(var i=0,l=chk_value.length;i<l;i++) {
        array1.remove(chk_value[i])
    }

    var array2 = array1.sort().unique();
    array2.remove("");

    $("#roomIds").val(array2.join(','));

    $.ajax({
        cache:false,
        type: "POST",
        url: getRootPath()+'/StayRegister/confirmRoom.do',
        data:"roomIds="+array2,
        async:false,
        dataType:"json",
        success: function (data) {
            var tr='';
            var ixx='[';
            if(data!=null){
                var total1=0;
                var total2=0;
                for(var i=0,l=data.length;i<l;i++) {
                    tr += ' <tr class="roomRow">\n' +
                        '  <td><input class="roomIdx" type="checkbox" name="roomids" value="' + data[i].roomId + '"></td>\n' +
                        '  <td>' + data[i].roomNumber + '</td>\n' +
                        '  <td>' + data[i].guestRoomLevelName + '</td>\n' +
                        '  <td>' + data[i].roomName + '</td>\n' +
                        '  <td>' + data[i].roomAmount + '</td>\n' +
                        '  <td>￥' + data[i].standardPriceDay + '</td>\n' +
                        '  <td>￥' + data[i].standardPrice + '</td>\n' +
                        '  <td>' + data[i].firstDuration + '</td>\n' +
                        ' <td style="width: auto" class="lvke24">\n' +
                        '</td>\n' +
                        '<td><a href="#lvke"  data-toggle="modal" class="btn btn-info btn-small"  onmousedown="selectRow(this)"  onclick="souSuo()">\n' +
                        '<li class="icon-plus icon-white"></li><span>选择旅客</span></a>\n' +
                        '</td>'+
                        '  </tr>';
                    total1+=parseFloat(data[i].standardPriceDay);
                    total2+=parseFloat(data[i].standardPrice);
                    ixx+='{"'+data[i].roomId+'":""},';
                }
                ixx=ixx.substring(0,ixx.length-1);
                ixx+=']';
                var s=JSON.parse(ixx);
                $("#passengerIdRoomId").val(JSON.stringify(s));
            }
            roomMoney(total1,total2);
            changeRoomMoney();
            deposit();

            $("#tbody15").html(tr);
        },
        error: function(data) {
        }
    })
}

function suibian(ss){
    if(ss.children[1].value==1){

        var ids=$("#roomIds").val();
        var array1= ids.split(",");

        array1.push(ss.children[0].value);

        var array2 = array1.sort().unique();
        array2.remove("");
        $("#roomIds").val(array2.join(','));


        $.ajax({
            cache:false,
            type: "POST",
            url: getRootPath()+'/StayRegister/confirmRoom.do',
            data:"roomIds="+array2,
            async:false,
            dataType:"json",
            success: function (data) {
                var tr='';
                var ixx='[';
                if(data!=null){
                    var total1=0;
                    var total2=0;
                    for(var i=0,l=data.length;i<l;i++) {
                        tr += ' <tr class="roomRow">\n' +
                            '  <td><input class="roomIdx" type="checkbox" name="roomids" value="' + data[i].roomId + '"></td>\n' +
                            '  <td>' + data[i].roomNumber + '</td>\n' +
                            '  <td>' + data[i].guestRoomLevelName + '</td>\n' +
                            '  <td>' + data[i].roomName + '</td>\n' +
                            '  <td>' + data[i].roomAmount + '</td>\n' +
                            '  <td>￥' + data[i].standardPriceDay + '</td>\n' +
                            '  <td>￥' + data[i].standardPrice + '</td>\n' +
                            '  <td>' + data[i].firstDuration + '</td>\n' +
                            ' <td style="width: auto" class="lvke24">\n' +
                            '</td>\n' +
                            '<td><a href="#lvke"  data-toggle="modal" class="btn btn-info btn-small"  onmousedown="selectRow(this)"  onclick="souSuo()">\n' +
                            '<li class="icon-plus icon-white"></li><span>选择旅客</span></a>\n' +
                            '</td>'+
                            '  </tr>';
                        total1+=parseFloat(data[i].standardPriceDay);
                        total2+=parseFloat(data[i].standardPrice);

                        ixx+='{"'+data[i].roomId+'":""},';
                    }
                    ixx=ixx.substring(0,ixx.length-1);
                    ixx+=']';
                    var s=JSON.parse(ixx);
                    $("#passengerIdRoomId").val(JSON.stringify(s));
                }
                roomMoney(total1,total2);
                changeRoomMoney();
                deposit();
                $("#tbody15").html(tr);
            },
            error: function(data) {
            }
        });

//   		var parentNodes=ss.parentNode.children;
//   		for(var i=0;i<parentNodes.length;i++){
//   			parentNodes[i].style.borderColor="#666666";
//   		}
//   		ss.style.borderColor="#00FFFF";
//   		document.getElementById("roomId").value=ss.children[0].value;
//   		document.getElementById("roomNameId").value=ss.children[2].textContent;
//   		document.getElementById("biaoZhunFangJiaId").value=ss.children[5].textContent;
//   		document.getElementById("zhongDianFangId").value='￥'+ss.children[6].value;
//   		document.getElementById("shouDuanJiaGeId").value='￥'+ss.children[7].value;
//   		document.getElementById("shouDuanShiChangId").value=ss.children[8].value;
    }else{
        alert("不是空房不可以安排房间的哦！");
    }


    var roomid=ss.children[0].value;  //获取这个
}

function tijiaoroom(){
    if(document.getElementById("registerTime").value==""){
        alert("登记时间  是必填项，不能为空哦！");
        document.getElementById("registerTime").focus();
        return false;
    }else if(document.getElementById("stayNumberId").value==""){
        alert("住店天数/小时  是必填项，不能为空哦！");
        document.getElementById("stayNumberId").focus();
        return false;
    }else if(document.getElementById("depositId").value==""){
        alert("押金  是必填项，不能为空哦！");
        document.getElementById("depositId").focus();
        return false;
    }else if(document.getElementById("stayNumberId").value.length>10){
        alert("你输入的    住店天数/小时   太过长了  请不要超出  10 位长度");
        document.getElementById("stayNumberId").focus();
        return false;
    }else if(document.getElementById("depositId").value.length>8){
        alert("你输入的   押金  太过长了  请不要超出  8 位长度  ");
        document.getElementById("depositId").focus();
        return false;
    }

    var roomIds=$("#roomIds").val().split(",");
    roomIds.remove("");
    if(roomIds==null||roomIds==undefined||roomIds.length<=0){
        alert("还没有选择房间哦！");
        return false;
    }
    var passengerIdRoomId=$("#passengerIdRoomId").val();
    var array1=null;
    if (passengerIdRoomId != null && passengerIdRoomId != '' && passengerIdRoomId != undefined) {
        array1 = JSON.parse(passengerIdRoomId);
    }
    if(array1==null||array1==undefined||array1.length<=0){
        alert("还没有选择旅客哦！");
        return false;
    }else{
        for (var j=0;j<array1.length ;j++ ){
            for(var item in array1[j]){
                if(array1[j][item]==''||array1[j][item]==null
                    ||array1[j][item]==undefined){
                    alert("还没有选择旅客哦！");
                    return false;
                }
            }
        }
    }

    $("#form1228").submit();
}



function pickedFunc() {
    shijian = $dp.cal.getNewDateStr();
}

function allroomfunction(){
    guestRoomLevelID=0;
    tenfunction();
}

function onefunction(){
    guestRoomLevelID=8;
    tenfunction();
}

function twofunction(){
    guestRoomLevelID=9;
    tenfunction();
}

function threefunction(){
    guestRoomLevelID=10;
    tenfunction();
}

function fourfunction(){
    guestRoomLevelID=11;
    tenfunction();
}

function fivefunction(){
    guestRoomLevelID=12;
    tenfunction();
}

function sixfunction(){
    guestRoomLevelID=13;
    tenfunction();
}

function sevenfunction(){
    guestRoomLevelID=14;
    tenfunction();
}
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

function tenfunction(){
    $("#div1").empty();
    $.ajax({
        cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
        type: "POST",                                           //上面3行都是必须要的
        url: getRootPath()+'/StayRegister/guestRoomLevelSelectRoom.do',       //地址 type 带参数
        data:"guestRoomLevelID="+guestRoomLevelID,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
        async:false,                                          // 是否 异步 提交
        dataType:"json",
        success: function (result) {                          // 不出现异常 进行立面方
            if(result!=null){
                for(var i=0,l=result.length;i<l;i++) {
                    var item = result[i];
                    if(item.roomStateID==1){
                        var btn=$("<button onclick='suibian(this)' style='width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#99FF99;'>"+
                            "<input style='display: none;' value="+item.roomId+" />"+
                            "<input style='display: none;' value="+item.roomStateID+" />"+
                            "<label>"+item.roomNumber+"</label>"+
                            "<label style='margin-top:-5px;'>"+item.roomName+"</label>"+
                            "<label style='margin-top:-5px;'>"+item.guestRoomLevelName+"</label>"+
                            "<label style='margin-top:-5px;'>"+"￥"+item.standardPriceDay+"</label>"+
                            "<input style='display: none;' value="+item.standardPrice+" />"+
                            "<input style='display: none;' value="+item.firstPrice+" />"+
                            "<input style='display: none;' value="+item.firstDuration+" />"+
                            "</button>")
                        $("#div1").append(btn);
                    }
                    if(item.roomStateID==2){
                        var btn=$("<button onclick='suibian(this)' style='width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#DDDDDD;'>"+
                            "<input style='display: none;' value="+item.roomId+" />"+
                            "<input style='display: none;' value="+item.roomStateID+" />"+
                            "<label>"+item.roomNumber+"</label>"+
                            "<label style='margin-top:-5px;'>"+item.roomName+"</label>"+
                            "<label style='margin-top:-5px;'>"+item.guestRoomLevelName+"</label>"+
                            "<label style='margin-top:-5px;'>"+"￥"+item.standardPriceDay+"</label>"+
                            "<input style='display: none;' value="+item.standardPrice+" />"+
                            "<input style='display: none;' value="+item.firstPrice+" />"+
                            "<input style='display: none;' value="+item.firstDuration+" />"+
                            "</button>")
                        $("#div1").append(btn);
                    }
                    if(item.roomStateID==4){
                        var btn=$("<button onclick='suibian(this)' style='width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#99FFFF;'>"+
                            "<input style='display: none;' value="+item.roomId+" />"+
                            "<input style='display: none;' value="+item.roomStateID+" />"+
                            "<label>"+item.roomNumber+"</label>"+
                            "<label style='margin-top:-5px;'>"+item.roomName+"</label>"+
                            "<label style='margin-top:-5px;'>"+item.guestRoomLevelName+"</label>"+
                            "<label style='margin-top:-5px;'>"+"￥"+item.standardPriceDay+"</label>"+
                            "<input style='display: none;' value="+item.standardPrice+" />"+
                            "<input style='display: none;' value="+item.firstPrice+" />"+
                            "<input style='display: none;' value="+item.firstDuration+" />"+
                            "</button>")
                        $("#div1").append(btn);
                    }
                    if(item.roomStateID==5){
                        var btn=$("<button onclick='suibian(this)' style='width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#BBBB00;'>"+
                            "<input style='display: none;' value="+item.roomId+" />"+
                            "<input style='display: none;' value="+item.roomStateID+" />"+
                            "<label>"+item.roomNumber+"</label>"+
                            "<label style='margin-top:-5px;'>"+item.roomName+"</label>"+
                            "<label style='margin-top:-5px;'>"+item.guestRoomLevelName+"</label>"+
                            "<label style='margin-top:-5px;'>"+"￥"+item.standardPriceDay+"</label>"+
                            "<input style='display: none;' value="+item.standardPrice+" />"+
                            "<input style='display: none;' value="+item.firstPrice+" />"+
                            "<input style='display: none;' value="+item.firstDuration+" />"+
                            "</button>")
                        $("#div1").append(btn);
                    }
                    if(item.roomStateID==6){
                        var btn=$("<button onclick='suibian(this)' style='width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#FF7744;'>"+
                            "<input style='display: none;' value="+item.roomId+" />"+
                            "<input style='display: none;' value="+item.roomStateID+" />"+
                            "<label>"+item.roomNumber+"</label>"+
                            "<label style='margin-top:-5px;'>"+item.roomName+"</label>"+
                            "<label style='margin-top:-5px;'>"+item.guestRoomLevelName+"</label>"+
                            "<label style='margin-top:-5px;'>"+"￥"+item.standardPriceDay+"</label>"+
                            "<input style='display: none;' value="+item.standardPrice+" />"+
                            "<input style='display: none;' value="+item.firstPrice+" />"+
                            "<input style='display: none;' value="+item.firstDuration+" />"+
                            "</button>")
                        $("#div1").append(btn);
                    }
                    if(item.roomStateID==7){
                        var btn=$("<button onclick='suibian(this)' style='width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#FF0088;'>"+
                            "<input style='display: none;' value="+item.roomId+" />"+
                            "<input style='display: none;' value="+item.roomStateID+" />"+
                            "<label>"+item.roomNumber+"</label>"+
                            "<label style='margin-top:-5px;'>"+item.roomName+"</label>"+
                            "<label style='margin-top:-5px;'>"+item.guestRoomLevelName+"</label>"+
                            "<label style='margin-top:-5px;'>"+"￥"+item.standardPriceDay+"</label>"+
                            "<input style='display: none;' value="+item.standardPrice+" />"+
                            "<input style='display: none;' value="+item.firstPrice+" />"+
                            "<input style='display: none;' value="+item.firstDuration+" />"+
                            "</button>")
                        $("#div1").append(btn);
                    }
                    if(item.roomStateID==65){
                        var btn=$("<button onclick='suibian(this)' style='width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#FF00FF;'>"+
                            "<input style='display: none;' value="+item.roomId+" />"+
                            "<input style='display: none;' value="+item.roomStateID+" />"+
                            "<label>"+item.roomNumber+"</label>"+
                            "<label style='margin-top:-5px;'>"+item.roomName+"</label>"+
                            "<label style='margin-top:-5px;'>"+item.guestRoomLevelName+"</label>"+
                            "<label style='margin-top:-5px;'>"+"￥"+item.standardPriceDay+"</label>"+
                            "<input style='display: none;' value="+item.standardPrice+" />"+
                            "<input style='display: none;' value="+item.firstPrice+" />"+
                            "<input style='display: none;' value="+item.firstDuration+" />"+
                            "</button>")
                        $("#div1").append(btn);
                    }
                }
            }

        },
        error: function(data) {

        }

    });
}

function onchangeStayNumberId(){
    //住店天数/小时
    if(document.getElementById("stayNumberId").value!=""){

        if(!document.getElementById("stayNumberId").value.trim().match("^[0-9]*[1-9][0-9]*$"))
        {
            document.getElementById("stayNumberId").focus();
            document.getElementById("stayNumberId").value="";

            alert("住店天数/小时:请输入正整数");
        }else{
            changeRoomMoney();
        }
    }
}



function onchangeOne(){
    //登记时间


    //押金
    if(document.getElementById("depositId").value!=""){

        if(!document.getElementById("depositId").value.trim().match("^[0-9]+(\\.[0-9]+)?$"))
        {
            document.getElementById("depositId").focus();
            document.getElementById("depositId").value="";
            alert("押金 :请输入正数");
        }else{
            deposit();
        }
    }else{

    }
}