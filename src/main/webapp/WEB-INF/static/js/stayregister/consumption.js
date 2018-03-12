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

function verify(){
}

function returnfunction(){
    var LvKeLeiXingId=document.getElementById("LvKeLeiXingId").value
    parent.document.getElementById('Mainid').src=getRootPath()+'/StayRegister/tolist.do?LvKeLeiXingId='+55;
}

function deletefunction(){
    var isBillID=document.getElementById("isBillID").value;
    if(isBillID==69){
        alert("很抱歉！该数据已经结账没法进行此操作！");
        return;
    }
    var chk_value=[];                                                      // 设置数组变量
    var consumptionStayRegisterID=document.getElementById("consumptionStayRegisterID").value;
    $('input[name="id"]:checked').each(function(){             // 遍历获取input被checked的
        chk_value.push($(this).val());                             // 获取选中的ID
    });
    if(chk_value!=""){
        parent.document.getElementById('Mainid').src=getRootPath()+'/StayRegister/consumptionDelete.do?id='
            +chk_value+'&consumptionStayRegisterID='+consumptionStayRegisterID;
    }else{
        alert("还没有选择数据删除哦");
    }
}

function ajaxConsumptionSelect(){
    var isBillID=document.getElementById("isBillID").value;
    if(isBillID==69){
        alert("很抱歉！该数据已经结账没法进行此操作！");
        $("#dd").removeAttr("href");
        return;
    }
    var name=document.getElementById("commodityName").value;
    var cboid=document.getElementById("selectCboId").value;
    $.ajax({
        cache:false,
        type: "POST",
        url: getRootPath()+'/StayRegister/tianJiaShangPin.do',
        data:"commodityName="+name+"&commodityTypeID="+cboid,
        async:false,
        dataType:"json",
        success: function (data) {
            var tr='';
            if(data!=null) {
                for (var i = 0, l = data.length; i < l; i++) {
                    tr+= ' <tr>\n' +
                        '  <td><input type="checkbox" name="CommIds" value="' + data[i].commodityId + '"></td>\n' +
                        '  <td>' + data[i].commodityName + '</td>\n' +
                        '  <td>' + data[i].commodityType + '</td>\n' +
                        '  <td>' + data[i].uOM + '</td>\n' +
                        '  <td>' + data[i].salePrice + '</td>\n' +
                        '  <td style="width:20%">' +
                        '<input class="number2" value="1" type="text" style="width:50%;" >\n' +
                        '</td>\n' +
                        '  </tr>';
                }
            }
            $("#tbodyComm").html(tr);
        },
        error: function(data) {
            alert("访问错误")
        }
    });
}

function confirmFunction(){
    var chk_value=[];
    var table=document.getElementById("tbodyComm");
    var selectedIndex="";
    var Number=[];
    var i=0;
    var consumptionStayRegisterID=document.getElementById("consumptionStayRegisterID").value;
    $('input[name="CommIds"]:checked').each(function(){
        chk_value.push($(this).val());
        selectedIndex=this.parentNode.parentNode.rowIndex;
        Number.push(table.rows[selectedIndex-1].cells[5].childNodes[0].value);
        if(table.rows[selectedIndex-1].cells[5].childNodes[0].value==""){
            i=1;
        }
    });
    if(Number=="" || Number==null){
        return false;
    }else if(i==1){
        return false;
    }
    for (var j=0;j<Number.length ;j++ )
    {
        if(!parseInt(Number[j])){
            alert("你输入的数量不是正整数。请仔细检查！");
            return false;
        }else{
            if(Number[j].length>8){
                alert("你输入的数量太大了，请注意控制为 8 位长度");
                return false;
            }
        }
    }
    if(chk_value!=""){
        parent.document.getElementById("Mainid").src=getRootPath()+'/StayRegister/consumption.do?cids='+chk_value
            +'&numbers='+Number+'&stayRegisterId='+consumptionStayRegisterID;
    }else{
    }
}


