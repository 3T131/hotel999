
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

function confirmfunction(){
    var chk_value=[];
    var table=document.getElementById("tbodyThree");
    var selectedIndex="";
    var name="";
    var pId="";

    $('input[name="idThree"]:checked').each(function(){
        chk_value.push($(this).val());
        selectedIndex=this.parentNode.parentNode.rowIndex;         // 获取选中的索引 单装他的变量不是数组，可以为数组
        pId=$(table.rows[selectedIndex-1].cells[0]).find("input").val();// 获取选中的索引的 单元格的值
        name=table.rows[selectedIndex-1].cells[1].innerHTML;
    });

    $("#pName").val(name);
    $("#pId").val(pId);

}

function souSuo(){
    var name=document.getElementById("txtnameidThree").value;
    $("#tbodyThree").empty();
    $.ajax({
        cache:false,
        type: "POST",
        url:getRootPath()+ '/Predetermine/selectPassenger.do',
        data:"name="+name,
        async:false,
        dataType:"json",
        success: function (result) {
            if(result!=null){
                var tr=' ';
                for(var i=0,l=result.length;i<l;i++){
                    tr+='  <tr>\n' +
                        '        <td><input type="radio" name="idThree" value="'+result[i].pId +'"></td>\n' +
                        '     <td>'+result[i].name +'</td>\n' +
                        '          <td>'+result[i].genderName +'</td>\n' +
                        '        <td>'+ result[i].papersName+'</td>\n' +
                        '        <td>'+ result[i].phoneNumber+'</td>\n' +

                        '       </tr>';
                }
                $("#tbodyThree").html(tr);
            }

        },
        error: function(data) {
            alert("访问错误")
        }
    });
}

function suibian(ss){
    if(ss.children[1].value==1) {

        $.ajax({
            cache: false,
            type: "POST",
            url: getRootPath() + '/StayRegister/confirmRoom.do',
            data: "roomIds=" + ss.children[0].value,
            async: false,
            dataType: "json",
            success: function (data) {
                if (data != null) {
                    for (var i = 0, l = data.length; i < l; i++) {
                        $("#roomId22").val(data[i].roomId)
                        $("#roomNumber").val(data[i].roomNumber)
                        $("#biaoZhunFangJiaId").val(data[i].standardPriceDay)
                        $("#zhongDianFangId").val(data[i].standardPrice)
                        $("#roomAmount").val(data[i].roomAmount)
                        $("#guestRoomLevel").val(data[i].guestRoomLevelName)

                    }
                }
            },
            error: function (data) {
                alert("访问错误!");

            }
        });
    }else{
        alert("不是空房不可以安排房间的哦！");
    }
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


var shijian="";
function pickedFunc() {
    shijian = $dp.cal.getNewDateStr();
}

function selectRoom(){
    var tbody = document.getElementById("tbodyTwo");
    var name=document.getElementById("txtnameid").value;
    var i=0;
    $("#tbodyTwo").empty();                              // 删除 tbody 所有行
    $.ajax({
        cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
        type: "POST",                                           //上面3行都是必须要的
        url: getRootPath()+'/Predetermine/selectRoom.do',       //地址 type 带参数
        data:"roomNumber="+name,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
//        dataType:"json",                                       // json 数据类型提交
        async:false,                                          // 是否 异步 提交
        success: function (result) {
            for (var key in result) {
                i++;
                var item = result[key];
                var tr = tbody.insertRow(-1);            // FireFox必须使用-1这个参数

                var tdcheckbox = tr.insertCell(-1);      // Table 有多少列就添加多少个这个
                var tdroomNumber = tr.insertCell(-1);
                var tdguestRoomLevelName = tr.insertCell(-1);
                var tdroomName = tr.insertCell(-1);
                var tdroomAmount = tr.insertCell(-1);
                var tdstandardPriceDay = tr.insertCell(-1);

                tdcheckbox.innerHTML = "<input type='checkbox' name='idTwo' value='"+item.id+"'>";
                tdroomNumber.innerHTML = item.roomNumber;
                tdguestRoomLevelName.innerHTML = item.guestRoomLevelName;
                tdroomName.innerHTML =item.roomName;         //中间这个是数据
                tdroomAmount.innerHTML =item.roomAmount;
                tdstandardPriceDay.innerHTML ='￥'+item.standardPriceDay;
            }
            if(i==0){
                alert("很抱歉！没有查找到你要找的数据");
            }
        },
        error: function(data) {

        }
    });
}



function addfunction(){
    if(document.getElementById("predetermineDayId").value==""){
        alert("预订天数  是必填项，不能为空哦！");
        document.getElementById("predetermineDayId").focus();
        return false;
    }else if(document.getElementById("depositId").value==""){
        alert("押金  是必填项，不能为空哦！");
        document.getElementById("depositId").focus();
        return false;
    }else if(document.getElementById("predetermineDayId").value.length>10){
        alert("你输入的   预订天数   太过长了  请不要超出  10 位长度");
        document.getElementById("predetermineDayId").focus();
        return false;
    }else if(document.getElementById("depositId").value.length>8){
        alert("你输入的   押金   太过长了  请不要超出  8 位长度");
        document.getElementById("depositId").focus();
        return false;
    }
    if(document.getElementById("roomId22").value==0||
        document.getElementById("roomId22").value==undefined||
        document.getElementById("roomId22").value==""){
        alert("还没有添加房间哦！请选择房间");
        return false;
    }
    if(document.getElementById("pId").value==null||
        document.getElementById("pId").value==undefined||
        document.getElementById("pId").value==""){
        alert("还没有添加旅客哦！请旅客");
        return false;
    }

    $("#form12").submit();
}

function lastStep(){
    parent.document.getElementById('Mainid').src=getRootPath()+'/Predetermine/select.do';
}



//验证
function onchangeOne(){
    //预订天数
    if(document.getElementById("predetermineDayId").value!=""){
        document.getElementById("divOne").style.display="none";
        if(!document.getElementById("predetermineDayId").value.trim().match("^[0-9]*[1-9][0-9]*$"))
        {
            document.getElementById("predetermineDayId").focus();
            document.getElementById("predetermineDayId").value="";
            document.getElementById("divOne").style.display="block"; //显示
            alert("预订天数:请输入正整数");
        }
    }else{
        document.getElementById("divTwo").style.display="block"; //显示
    }
    //押金
    if(document.getElementById("depositId").value!=""){
        document.getElementById("divTwo").style.display="none";
        if(!document.getElementById("depositId").value.trim().match("^[0-9]+(\\.[0-9]+)?$"))
        {
            document.getElementById("depositId").focus();
            document.getElementById("depositId").value="";
            document.getElementById("divTwo").style.display="block"; //显示
            alert("押金 :请输入正数");
        }
    }else{
        document.getElementById("divTwo").style.display="block"; //显示
    }
    //抵达时间
    if(document.getElementById("arriveTimeId").value!=""){
        document.getElementById("divThree").style.display="none";
    }else{
        document.getElementById("divThree").style.display="block"; //显示
    }
}