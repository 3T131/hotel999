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
    var Name="";
    function verify(){
    }



    var xingMing="";
    var xingBie="";
    var minZu="";
    var faZhengJiGuang="";
    var zhengJiaYouXiaoQi="";
    var jiYe="";
    var wenHuaChengDu="";
    var lvKeJiBie="";
    var zhengJianLeiXing="";
    var zhengJianHaoMa="";
    var danWeiHuoZhuChu="";
    var chuShengRiQi="";
    var shiYou="";
    var congHeChuLai="";
    var daoNaLiQu="";
    var lianXiDianHua="";
    var beiZhu="";





function tijiaoRegister(){
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
    }else if(document.getElementById("remarksId").value.length>50){
        alert("你输入的   备注  太过长了  请不要超出  50 位长度");
        document.getElementById("remarksId").focus();
        return false;
    }

    var tbody2 =$("#tbody2");

    $.ajax({
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: getRootPath()+"/StayRegister/register.do" ,//url
        data: $('#form1').serialize(),
        success: function (data) {
            if(data!=null) {
                var tr = '<tr>\n' +
                    '  <td><input type="checkbox" name="id" value="' + data.pId + '"></td>\n' +
                    '  <td>' + data.name + '</td>\n' +
                    '  <td>' + data.genderName + '</td>\n' +
                    '  <td>' + data.birthDate + '</td>\n' +
                    '  <td>' + data.nationName + '</td>\n' +
                    '  <td>' + data.passengerLevelName + '</td>\n' +
                    '  <td>' + data.papersName + '</td>\n' +
                    '  <td>' + data.papersNumber + '</td>\n' +
                    '  <td>' + data.phoneNumber + '</td>\n' +
                    '  </tr>';
                // var ids=$("#passengerIds").val();
                // var array1= [];
                // array1=ids.split(",");
                // array1.push(data.pId);
                // $("#passengerIds").val(array1.join(','));
            }
            tbody2.append(tr);

        },
        error : function() {
            alert("异常！");
        }
    });
}

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
Array.prototype.indexOf = function(val) {
    for (var i = 0; i < this.length; i++) {
        if (this[i] == val) return i;
    }
    return -1;
};
Array.prototype.remove = function(val) {
    var index = this.indexOf(val);
    if (index > -1) {
        this.splice(index, 1);
    }
};


// function removefunction(){
//     var chk_value=[];
//     $('input[name="sssid"]:checked').each(function(){
//         chk_value.push($(this).val());
//     });
//
//     if(chk_value!=""){
//
//         var ids=$("#passengerIds").val();
//         var array1= ids.split(",");
//
//         for(var i=0,l=chk_value.length;i<l;i++) {
//             array1.remove(chk_value[i])
//         }
//
//         var array2 = array1.sort().unique();
//         array2.remove("");
//         $("#passengerIds").val(array2.join(','));
//
//         $.ajax({
//             cache:false,
//             type: "POST",
//             url: getRootPath()+'/StayRegister/confirmPassenger.do',
//             data:"ids="+array2,
//             async:false,
//             dataType:"json",
//             success: function (data) {
//                 var tr='';
//                 if(data!=null) {
//                     for (var i = 0, l = data.length; i < l; i++) {
//                         tr += '<tr>\n' +
//                             '  <td><input type="checkbox" name="sssid" value="' + data[i].pId + '"></td>\n' +
//                             '  <td>' + data[i].name + '</td>\n' +
//                             '  <td>' + data[i].genderName + '</td>\n' +
//                             '  <td>' + data[i].birthDate + '</td>\n' +
//                             '  <td>' + data[i].nationName + '</td>\n' +
//                             '  <td>' + data[i].passengerLevelName + '</td>\n' +
//                             '  <td>' + data[i].papersName + '</td>\n' +
//                             '  <td>' + data[i].papersNumber + '</td>\n' +
//                             '  <td>' + data[i].phoneNumber + '</td>\n' +
//                             '  </tr>';
//                     }
//                 }
//                 $("#tbody2").html(tr);
//             },
//             error: function(data) {
//             }
//         });
//
//     }else{
//         alert("你还没有选择旅客哦！");
//     }
// }

    // function confirmfunction(){
    //     var chk_value=[];
    //     $('input[name="xxxid"]:checked').each(function(){
    //         chk_value.push($(this).val());
    //     });
    //
    //     if(chk_value!=""){
    //         var ids=$("#passengerIds").val();
    //         var array1= ids.split(",");
    //
    //         for(var i=0,l=chk_value.length;i<l;i++) {
    //             array1.push(chk_value[i]);
    //         }
    //
    //         var array2 = array1.sort().unique();
    //         array2.remove("");
    //         $("#passengerIds").val(array2.join(','));
    //             $.ajax({
    //                 cache:false,
    //                 type: "POST",
    //                 url: getRootPath()+'/StayRegister/confirmPassenger.do',
    //                 data:"ids="+array2,
    //                 async:false,
    //                 dataType:"json",
    //                 success: function (data) {
    //                     var tr='';
    //                     if(data!=null) {
    //                         for (var i = 0, l = data.length; i < l; i++) {
    //                             tr += '<tr>\n' +
    //                                 '  <td><input type="checkbox" name="sssid" value="' + data[i].pId + '"></td>\n' +
    //                                 '  <td>' + data[i].name + '</td>\n' +
    //                                 '  <td>' + data[i].genderName + '</td>\n' +
    //                                 '  <td>' + data[i].birthDate + '</td>\n' +
    //                                 '  <td>' + data[i].nationName + '</td>\n' +
    //                                 '  <td>' + data[i].passengerLevelName + '</td>\n' +
    //                                 '  <td>' + data[i].papersName + '</td>\n' +
    //                                 '  <td>' + data[i].papersNumber + '</td>\n' +
    //                                 '  <td>' + data[i].phoneNumber + '</td>\n' +
    //                                 '  </tr>';
    //                         }
    //                     }
    //                     $("#tbody2").html(tr);
    //                 },
    //                 error: function(data) {
    //                 }
    //             });
    //
    //     }else{
    //         alert("你还没有选择旅客哦！");
    //     }
    // }

    function nameOne(value){
        if(value!=xingMing){
            document.getElementById("nameId").style.color='black';
        }else{
            document.getElementById("nameId").style.color='blue';
        }
    }

    function licenceIssuingAuthortyOne(value){
        if(value!=faZhengJiGuang){
            document.getElementById("faZhengId").style.color='black';
        }else{
            document.getElementById("faZhengId").style.color='blue';
        }
    }

    function papersValidityOne(value){
        if(value!=zhengJiaYouXiaoQi){
            document.getElementById("papersValidityId").style.color='black';
        }else{
            document.getElementById("papersValidityId").style.color='blue';
        }
    }

    function professionOne(value){
        if(value!=jiYe){
            document.getElementById("professionId").style.color='black';
        }else{
            document.getElementById("professionId").style.color='blue';
        }
    }

    function papersNumberOne(value){
        if(value!=zhengJianHaoMa){
            document.getElementById("papersNumberId").style.color='black';
        }else{
            document.getElementById("papersNumberId").style.color='blue';
        }
        if(value!=""){
            $.ajax({
                cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
                type: "POST",                                           //上面3行都是必须要的
                url: '${ctx}/Passenger/YZ.do',       //地址 type 带参数
                data:"papersNumber="+value,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
                async:false,                                          // 是否 异步 提交
                success: function (result) {                          // 不出现异常 进行立面方
                    if(Name==document.getElementById("papersNumberId").value){

                    }else if(result>=1){
                        alert("此身份证已登记过了，你还可以选择旅客哦！");                     //提示框
                        document.getElementById("papersNumberId").value="";     //这个id的文本框的值 将会清空
                        document.getElementById("papersNumberId").focus();      // 给这个id的文本框提供焦点
                        document.getElementById("divTwo").style.display="block"; //显示
                    }else{
                        var N=document.getElementById("papersNumberId").value.substring(6,10);
                        var Y=document.getElementById("papersNumberId").value.substring(10,12);
                        var D=document.getElementById("papersNumberId").value.substring(12,14);
                        document.getElementById("birthDateId").value=N+"-"+Y+"-"+D;
                    }
                },
                error: function(data) { }
            });
        }
    }

    function unitsOrAddressOne(value){
        if(value!=danWeiHuoZhuChu){
            document.getElementById("unitsOrAddressId").style.color='black';
        }else{
            document.getElementById("unitsOrAddressId").style.color='blue';
        }
    }

    function birthDateOne(value){
        if(value!=chuShengRiQi){
            document.getElementById("birthDateId").style.color='black';
        }else{
            document.getElementById("birthDateId").style.color='blue';
        }
    }

    function whereAreFromOne(value){
        if(value!=congHeChuLai){
            document.getElementById("whereAreFromId").style.color='black';
        }else{
            document.getElementById("whereAreFromId").style.color='blue';
        }
    }

    function whereToGoOne(value){
        if(value!=daoNaLiQu){
            document.getElementById("whereToGoId").style.color='black';
        }else{
            document.getElementById("whereToGoId").style.color='blue';
        }
    }

    function contactPhoneNUmberOne(value){
        if(value!=lianXiDianHua){
            document.getElementById("contactPhoneNUmberId").style.color='black';
        }else{
            document.getElementById("contactPhoneNUmberId").style.color='blue';
        }
    }

    function remarksOne(value){
        if(value!=beiZhu){
            document.getElementById("remarksId").style.color='black';
        }else{
            document.getElementById("remarksId").style.color='blue';
        }
    }


    function gender(value){
        if(value!=xingBie){
            document.getElementById("genderId").style.color='black';
        }else{
            document.getElementById("genderId").style.color='blue';
        }
    }

    function nation(value){
        if(value!=minZu){
            document.getElementById("nationId").style.color='black';
        }else{
            document.getElementById("nationId").style.color='blue';
        }
    }

    function educationDegree(value){
        if(value!=wenHuaChengDu){
            document.getElementById("educationDegreeId").style.color='black';
        }else{
            document.getElementById("educationDegreeId").style.color='blue';
        }
    }

    function papers(value){
        if(value!=zhengJianLeiXing){
            document.getElementById("papersId").style.color='black';
        }else{
            document.getElementById("papersId").style.color='blue';
        }
    }


    function thingReason(value){
        if(value!=shiYou){
            document.getElementById("thingReasonId").style.color='black';
        }else{
            document.getElementById("thingReasonId").style.color='blue';
        }
    }







    function onchangeTTT(){
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
        if(document.getElementById("contactPhoneNUmberId").value!=""){
            if(!document.getElementById("contactPhoneNUmberId").value.trim().match("^[1][0-9]{10}$"))
            {
                document.getElementById("contactPhoneNUmberId").focus();
                document.getElementById("contactPhoneNUmberId").value="";
                alert("你输入的手机号码有误，请重新输入！");
            }
        }
    }

