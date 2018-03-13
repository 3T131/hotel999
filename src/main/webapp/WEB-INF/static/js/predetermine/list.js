
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
$('#duixiang').modal().css({
    'width':'72%',
    'margin-left':function(){
        return -($(this).width()/2);
    }
});
$('#duixiang').modal('hide');

function addfunction(){
    parent.document.getElementById('Mainid').src=getRootPath()+'/Predetermine/toadd.do';
}

function updatefunction(){
    var chk_value=[];
    var roomId = null;

    $('input[name="id"]:checked').each(function(){
        chk_value.push($(this).val());
        roomId = $(this).parent().next("td").html();

    });
    if(chk_value!=""){
        if(chk_value.toString().indexOf(",")>0){
            alert("修改只能选择一条");
        }else{
            parent.document.getElementById("Mainid").src=getRootPath()+'/Predetermine/toupdate.do?id='+chk_value+'&roomNumber='+roomId;
        }
    }else{
        alert("请选择一条数据进行修改");
    }
}

function deletefunction(){
    var chk_value=[];
    $('input[name="id"]:checked').each(function(){
        chk_value.push($(this).val());
    });
    if(chk_value!=""){
        var flag=window.confirm("注意：删除该预订信息会扣除该房间的押金的哦！您确定要永久删除该信息吗?");
        if(flag){
            parent.document.getElementById("Mainid").src=getRootPath()+'/Predetermine/delete.do?id='+chk_value;
        }
    }else{
        alert("请选择一条或多条数据进行删除");
    }
}



function souSuo(){
    var name=document.getElementById("txtnameidThree").value;
    var i=0;
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
                        '         <td>'+result[i].papersNumber +'</td>\n' +
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
function confirmfunction(){
    var chk_value=[];
    var table=document.getElementById("tbodyThree");
    var selectedIndex="";
    var name="";
    var papersType="";
    var rId="";
    var phone="";
    document.getElementById("rId").value=null;
    document.getElementById("principalId").value=null;
    document.getElementById("teamCodeId").value=null;
    document.getElementById("contactPhoneNUmberId").value=null;
    $('input[name="idThree"]:checked').each(function(){
        chk_value.push($(this).val());
        selectedIndex=this.parentNode.parentNode.rowIndex;         // 获取选中的索引 单装他的变量不是数组，可以为数组
        rId=table.rows[selectedIndex-1].cells[0].innerHTML;// 获取选中的索引的 单元格的值
        name=table.rows[selectedIndex-1].cells[1].innerHTML;
        papersType=table.rows[selectedIndex-1].cells[3].innerHTML;     // 获取选中的索引的 单元格的值
        papersNumber=table.rows[selectedIndex-1].cells[4].innerHTML;     // 获取选中的索引的 单元格的值
        phone=table.rows[selectedIndex-1].cells[5].innerHTML;     // 获取选中的索引的 单元格的值
    });
    document.getElementById("nameId").value=name;
    document.getElementById("papersTypeId").value=papersType;
    document.getElementById("papersNumberId").value=papersNumber;
    document.getElementById("contactPhoneNumber").value=phone;

    $("#form22").submit();

}
function selectTarget(){
    var name=document.getElementById("txtnameidTwo").value;
    var i=0;
    $("#tbodyTwo").empty();
    $.ajax({
        cache:false,
        type: "POST",
        url: getRootPath()+'/Predetermine/selectTarget.do',
        data:"name="+name,
        async:false,
        dataType:"json",
        success: function (result) {
            if(result!=null){
                var tr=' ';
                for(var i=0,l=result.length;i<l;i++){
                    tr+='  <tr>\n' +
                        '        <td><input type="radio" name="idTwo" value="'+result[i].receiveTargetId +'"></td>\n' +
                        '          <td>'+result[i].principal +'</td>\n' +
                        '     <td>'+result[i].teamCode +'</td>\n' +
                        '         <td>'+result[i].contactPhoneNUmber +'</td>\n' +
                        '       </tr>';
                }
                $("#tbodyTwo").html(tr);
            }

        },
        error: function(data) {
            alert("访问错误")
        }
    });
}
function gaiBian(o){
    $("#leiXin").val(o);
    document.getElementById("rId").value=null;
    document.getElementById("principalId").value=null;
    document.getElementById("teamCodeId").value=null;
    document.getElementById("contactPhoneNUmberId").value=null;
    document.getElementById("nameId").value=null;
    document.getElementById("papersTypeId").value=null;
    document.getElementById("papersNumberId").value=null;
    document.getElementById("contactPhoneNumber").value=null;
        $("#form22").submit();
}

function confirmRarget(){
    var chk_value=[];
    var table=document.getElementById("tbodyTwo");
    var selectedIndex="";
    var teamCode="";
    var principal="";
    var contactPhoneNUmber="";
    document.getElementById("nameId").value=null;
    document.getElementById("papersTypeId").value=null;
    document.getElementById("papersNumberId").value=null;
    document.getElementById("contactPhoneNumber").value=null;
    $('input[name="idTwo"]:checked').each(function(){
        chk_value.push($(this).val());
        selectedIndex=this.parentNode.parentNode.rowIndex;         // 获取选中的索引 单装他的变量不是数组，可以为数组
        teamCode=table.rows[selectedIndex-1].cells[2].innerHTML;     // 获取选中的索引的 单元格的值
        principal=table.rows[selectedIndex-1].cells[1].innerHTML;     // 获取选中的索引的 单元格的值
        contactPhoneNUmber=table.rows[selectedIndex-1].cells[3].innerHTML;     // 获取选中的索引的 单元格的值
    });
    document.getElementById("rId").value=chk_value;
    document.getElementById("principalId").value=principal;
    document.getElementById("teamCodeId").value=teamCode;
    document.getElementById("contactPhoneNUmberId").value=contactPhoneNUmber;

    $("#form22").submit();

}



function selectOne(){
    var txtname=document.getElementById("txtnameid").value;
    var state=document.getElementById("stateId").value;
    parent.document.getElementById("Mainid").src=getRootPath()+'/Predetermine/tolist.do?txtname='
        +txtname+'&state='+state;
}

function selectTwo(){
    $("#form22").submit();
}

function arrangeRoom(){
    var chk_value=[];
    $('input[name="id"]:checked').each(function(){
        chk_value.push($(this).val());
    });
    if(chk_value!=""){
       if(chk_value.toString().indexOf(",")>0){
           alert("请选择一条数据进行安排房间");
       }else{
           parent.document.getElementById("Mainid").src=getRootPath()+'/Predetermine/toPredeterRoom.do?predetermineId='+chk_value;
       }
    }else{
        alert("请选择一条数据进行安排房间");
    }
}