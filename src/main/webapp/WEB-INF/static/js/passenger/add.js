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
    if(document.getElementById("nameId").value==""){
        alert("姓名  是必填项，不能为空哦！");
        document.getElementById("nameId").focus();
        return false;
    }else if(document.getElementById("papersNumberId").value==""){
        alert("证件号码  是必填项，不能为空哦！");
        document.getElementById("papersNumberId").focus();
        return false;
    }else if(document.getElementById("nameId").value.length>10){
        alert("你输入的   姓名  太过长了  请不要超出  10  位长度");
        document.getElementById("nameId").focus();
        return false;
    }else if(document.getElementById("JGID").value.length>25){
        alert("你输入的   发证机关  太过长了  请不要超出  25  位长度");
        document.getElementById("JGID").focus();
        return false;
    }else if(document.getElementById("unitsOrAddressId").value.length>25){
        alert("你输入的   单位或住址  太过长了  请不要超出  25  位长度");
        document.getElementById("unitsOrAddressId").focus();
        return false;
    }else if(document.getElementById("papersValidityId").value.length>25){
        alert("你输入的   证件有效期  太过长了  请不要超出  25  位长度");
        document.getElementById("papersValidityId").focus();
        return false;
    }else if(document.getElementById("professionId").value.length>10){
        alert("你输入的   职业  太过长了  请不要超出  10  位长度");
        document.getElementById("professionId").focus();
        return false;
    }else if(document.getElementById("whereAreFromId").value.length>50){
        alert("你输入的   从何处来  太过长了  请不要超出  50 位长度");
        document.getElementById("whereAreFromId").focus();
        return false;
    }else if(document.getElementById("whereToGoId").value.length>50){
        alert("你输入的   到哪里去  太过长了  请不要超出  50 位长度");
        document.getElementById("whereToGoId").focus();
        return false;
    }else if(document.getElementById("remarks").value.length>50){
        alert("你输入的   备注  太过长了  请不要超出  50 位长度");
        document.getElementById("remarks").focus();
        return false;
    }else{
        return true;
    }
}

function deletefunction(){
    parent.document.getElementById('Mainid').src=getRootPath()+'/Passenger/tolist.do';
}

function onchangeOne(){
    //姓名
    if(document.getElementById("nameId").value!=""){
        document.getElementById("divOne").style.display="none";
    }else{
        document.getElementById("divOne").style.display="block"; //显示
    }
    //证件号码
    if(document.getElementById("papersNumberId").value!=""){
        document.getElementById("divTwo").style.display="none";
        if(document.getElementById("papersId").value==37){
            if(!document.getElementById("papersNumberId").value.trim().match(
                    "^[1-9][0-9]{5}(([1][9][0-9][0-9])|([2][0](([0][0-9])|([1][0-7]))))"+
                    "(([0][1-9])|([1][0,1,2]))(([0][1-9])|([1|2][0-9])|([3][0|1]))+[0-9]{3}([0-9]|[X]|[x])$"))
            {
                document.getElementById("papersNumberId").focus();
                document.getElementById("papersNumberId").value="";
                document.getElementById("divTwo").style.display="block"; //显示
                alert("你输入的身份证号码有误，请重新输入！");
            }
        }
    }else{
        document.getElementById("divTwo").style.display="block"; //显示
    }
    //联系电话
    if(document.getElementById("contactPhoneNumberId").value!=""){
        if(!document.getElementById("contactPhoneNumberId").value.trim().match("^[1][0-9]{10}$"))
        {
            document.getElementById("contactPhoneNumberId").focus();
            document.getElementById("contactPhoneNumberId").value="";
            alert("你输入的手机号码有误，请重新输入！");
        }
    }
}


function YZ(value){
    console.log(11);
    if(value!=""){
        $.ajax({
            cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
            type: "POST",                                           //上面3行都是必须要的
            url: '${ctx}/Passenger/YZ.do',       //地址 type 带参数
            data:"papersNumber="+value,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
            async:false,                                          // 是否 异步 提交
            success: function (result) {                          // 不出现异常 进行立面方

            },
            error: function(data) {  }
        });
    }
}