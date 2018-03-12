
var Name="";
$(function(){
    Name=document.getElementById("commodityNameId").value;
});
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
    if(document.getElementById("commodityNameId").value==""){
        alert("商品名称  是必填项，不能为空哦！");
        document.getElementById("commodityNameId").focus();
        return false;
    }else if(document.getElementById("salePriceId").value==""){
        alert("销售价格  是必填项，不能为空哦！");
        document.getElementById("salePriceId").focus();
        return false;
    }else if(document.getElementById("commodityNameId").value.length>25){
        alert("你输入的   商品名称  太过长了  请不要超出  25 位长度");
        document.getElementById("commodityNameId").focus();
        return false;
    }else if(document.getElementById("salePriceId").value.length>8){
        alert("你输入的   销售价格   太过长了  请不要超出  8 位长度");
        document.getElementById("salePriceId").focus();
        return false;
    }else{
        return true;
    }
}


function deletefunction(){
    parent.document.getElementById('Mainid').src='${ctx}/Commodity/tolist.do';
}

function onchangeOne(){
    //商品名称
    if(document.getElementById("commodityNameId").value!=""){
        document.getElementById("divOne").style.display="none";
    }else{
        document.getElementById("divOne").style.display="block"; //显示
    }
    //销售价格
    if(document.getElementById("salePriceId").value!=""){
        document.getElementById("divTwo").style.display="none";
        if(!document.getElementById("salePriceId").value.trim().match("^[0-9]+(\\.[0-9]+)?$"))
        {
            document.getElementById("salePriceId").focus();
            document.getElementById("salePriceId").value="";
            document.getElementById("divTwo").style.display="block"; //显示
            alert("销售价格:请输入正数");
        }
    }else{
        document.getElementById("divTwo").style.display="block"; //显示
    }
}


function YZ(value){
    if(value!=""){
        $.ajax({
            cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
            type: "POST",                                           //上面3行都是必须要的
            url: '${ctx}/Commodity/YZ.do',       //地址 type 带参数
            data:"commodityName="+value,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
            async:false,                                          // 是否 异步 提交
            success: function (result) {                          // 不出现异常 进行立面方
                if(Name==document.getElementById("commodityNameId").value){

                }else if(result>=1){
                    alert("已存在此商品名称，请另取商品名称！");                     //提示框
                    document.getElementById("commodityNameId").value="";     //这个id的文本框的值 将会清空
                    document.getElementById("commodityNameId").focus();      // 给这个id的文本框提供焦点
                    document.getElementById("divOne").style.display="block"; //显示
                }else{ }
            },
            error: function(data) { }
        });
    }
}