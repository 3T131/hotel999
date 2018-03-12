function removeLvke(pId,e){
    var ids=$("#passengerIds").val();
    var array1= ids.split(",");
    array1.remove("");
    if(array1.length<=1){
        alert("旅客不能少于一位！")
        return false;
    }else{
        for(var i=0;i<array1.length;i++){
            if(array1[i]==pId){
                array1.remove(array1[i]);
                break;
            }
        }
        //		 array1.remove(pId);
        var array2 = array1.sort().unique();
        $("#passengerIds").val(array2.join(','));
        $(e).parents(".fff").remove();
    }


}

Array.prototype.remove = function(val) {
    var index = this.indexOf(val);
    if (index > -1) {
        this.splice(index, 1);
    }
};

Array.prototype.unique = function (isStrict) {
    if (this.length < 2)
        return [this[0]] || [];
    var tempObj = {}, newArr = [];
    for (var i = 0; i < this.length; i++) {
        var v = this[i];
        var condition = isStrict ? (typeof tempObj[v] != typeof v) : false;
        if ((typeof tempObj[v] == "undefined") || condition) {
            tempObj[v] = v;
            newArr.push(v);
        }
    }
    return newArr;
};

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

function passengerQd() {
    var chk_value = [];
    $('input[name="xxxid"]:checked').each(function () {
        chk_value.push($(this).val());
    });

    if (chk_value != "") {
        var ids=$("#passengerIds").val();
        var array1= ids.split(",");

        for(var i=0,l=chk_value.length;i<l;i++) {
            array1.push(chk_value[i]);
        }

        var array2 = array1.sort().unique();
        array2.remove("");
        $("#passengerIds").val(array2.join(','));

        $.ajax({
            cache: false,
            type: "POST",
            url: getRootPath() + '/StayRegister/confirmPassenger.do',
            data: "ids=" + array2,
            async: false,
            dataType: "json",
            success: function (data) {
                var span = '';
                if (data != null) {
                    for (var i = 0, l = data.length; i < l; i++) {
                        span += '<span class="fff"> <span style="color: #E75E55">'+data[i].name+'<span onclick="removeLvke('+data[i].pId+',this)" style="cursor: pointer;"  class="icon-remove icon-red"></span> </span></span>';
                    }
                }
                $("#lvkess").html(span);
            },
            error: function (data) {
                alert("数据访问错误！");
            }
        });


    } else {
        alert("你还没有选择旅客哦！");
    }

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





function payfunction(){
    if(changRoomMoney()
      &&accommodation()
        &&onchangeStayNumberId()
        &&onchangeOne()){
        var ids=$("#passengerIds").val();
        var array1= ids.split(",");
        var array2 = array1.sort().unique();
        array2.remove("");
        $("#passengerIds").val(array2.join(','));
         $("#form222").submit();
    }
}

function deletefunction(){
    parent.document.getElementById('Mainid').src='${ctx}/StayRegister/tolist.do';
}

function onchangeStayNumberId(){
    //住店天数/小时
    if(document.getElementById("stayNumberId").value!=""){

        if(!document.getElementById("stayNumberId").value.trim().match("^[0-9]*[1-9][0-9]*$"))
        {
            document.getElementById("stayNumberId").focus();
            document.getElementById("stayNumberId").value="";
            alert("住店天数/小时:请输入正整数");
            return false;
        }else{
            return true;
        }
    }
    alert("住店天数/小时:请输入正整数");
    return false;
}

function changingRoomNumber(){
    //住店天数/小时
    if(document.getElementById("changingRoomNumber").value!=""){
        if(!document.getElementById("changingRoomNumber").value.trim().match("^[0-9]*[1-9][0-9]*$"))
        {
            document.getElementById("changingRoomNumber").focus();
            document.getElementById("changingRoomNumber").value="";
            alert("换房次数:请输入正整数");
            return false;
        }else{
            return true;
        }
    }else{
        return true;
    }

}

function changRoomMoney(){
    if(document.getElementById("changRoomMoney").value!=""){
        if(!document.getElementById("changRoomMoney").value.trim().match("^[0-9]+(\\.[0-9]+)?$"))
        {
            document.getElementById("changRoomMoney").focus();
            document.getElementById("changRoomMoney").value="";
            alert("换房金额:请输入正数");
            return false;
        }else{
            return true;
        }
    }else{
        return true;
    }

}

function accommodation(){
    if(document.getElementById("accommodation").value!=""){
        if(!document.getElementById("accommodation").value.trim().match("^[0-9]+(\\.[0-9]+)?$"))
        {
            document.getElementById("accommodation").focus();
            document.getElementById("accommodation").value="";
            alert("住宿费:请输入正数");
            return false;
        }else{
            return true;
        }
    }
    alert("住宿费:请输入正数");
    return false;
}

function onchangeOne(){
    //押金
    if(document.getElementById("depositId").value!=""){
        if(!document.getElementById("depositId").value.trim().match("^[0-9]+(\\.[0-9]+)?$"))
        {
            document.getElementById("depositId").focus();
            document.getElementById("depositId").value="";
            alert("押金:请输入正数");
            return false;
        }else{
            return true;
        }
    }
    alert("押金:请输入正数");
    return false;
}
