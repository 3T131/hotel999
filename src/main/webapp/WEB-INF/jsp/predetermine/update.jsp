<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title></title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />


    <!--   <link rel="stylesheet" href="/static/css/roomset/roomset.css" type="text/css"></link> -->
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.css" type="text/css"></link>
    <link rel="stylesheet" href="/static/css/page.css" type="text/css"></link>
    <link href="/static/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">  <!-- start 响应式布局要添加的 -->
    <script src="/static/bootstrap/js/jquery-3.1.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="/static/js/page.js"></script>
    <script type="text/javascript" src="/static/My97DatePicker/WdatePicker.js"></script>
    <style>

        .container{
            margin-top: 10px;
            margin-left:10px;
            width:88%;
            font-size:15px;
        }

        .labelroomnumber{
            position: relative;
            font-size: 15px;
            float: left;
            margin-top: 15px;
        }

        .textone{
            margin-top:12px;
        }

        .rightOne{
            margin-right: 50px;
            font-size:15px;
        }

        .theadone{
            background-color: #CCFF99;
        }

        .table th,.table td{
            text-align: center;
        }

        .theadone{
            background-color: #CCFF99;
        }

        .dgvone{
            margin-top: 12px;
        }

        .roomnumberwidth{
            width:70%;
        }

        .heigthone{
            height:26px;
        }
        .widthone{
            width:95%;
            float:left;
        }
        .widthtwo{
            width:100%;
        }

        .yansered{
            color:red;
        }

    </style>
</head>


<body>
<div class="container" style="height:630px;overflow-x:auto;border: solid; border-color: #DDDDDD;">

    <input id="lvkeorteamId" type="hidden" value="${id}" >  <!-- 是团队还是旅客的ID -->
    <input id="teamId" type="hidden" value="${type}" >  <!-- 是团队还是旅客 -->
    <input id="pangduan" type="hidden" value="${pangduan}" >  <!-- 是团队还是旅客 -->

    <div class="span12" style="text-align: center;">
        <div class="row-fluid">
            <h3>客房预订修改</h3>
        </div>
    </div>

    <form id="form1" action="/Predetermine/update.do"  method="post">
        <input  id="roomid" name="roomId" value="${roomSetPolist.roomId}" type="hidden" />
        <input type="hidden" name="roomStateID" value="${roomSetPolist.roomStateID}"/>
        <input type="hidden" name="predetermineId" value="${predetermine.predetermineId}"/>
        <div class="span12" >
            <div class="row-fluid">
                <div class="span1">
                    <button class="btn btn-info btn-small" type="submit"  ><li class="icon-plus icon-white"></li>修改</button>
                </div>
                <%--<div class="span1">--%>
                <%--<button class="btn btn-danger btn-small" type="button" onclick="deletefunction()"><li class="icon-remove icon-white"></li>删除</button>--%>
                <%--</div>--%>
                <div class="span1">
                    <button class="btn btn-warning btn-small" type="button" onclick="lastStep()"><li class="icon-remove icon-white"></li>取消</button>
                </div>
                <div class="span2">
                    <button href="#xuanzhe" data-toggle="modal" class="btn btn-info btn-small" onclick="selectRoom()"><li class="icon-plus icon-white"></li>选择房间</button>
                </div>
            </div>
        </div>


        <div class="span12" style="margin-top:12px;">
            <div class="row-fluid">
                <div class="span2">
                    <input type="hidden" name="roomID" value="${predetermine.roomID}">
                    <input type="hidden" name="predetermineTargetID" value="${predetermine.predetermineTargetID}">
                    <input type="hidden" name="predetermineStateID" value="${predetermine.predetermineStateID}">
                    <input type="hidden" name="remind" value="${predetermine.remind}">
                    <label>预订旅客：</label>
                    <input name="commodityName" class="widthone" style="height: 26px;"  type="text" readonly="readonly" value="${predetermine.passengerName}">
                </div>
                <div class="span2">
                    <label>预订天数：</label>
                    <input id="predetermineDayId" name="predetermineDay" class="widthone"
                           style="height: 26px;"  type="text" onchange="onchangeOne()" value="${predetermine.predetermineDay}">
                    <div id="divOne" hidden>
                        <label class="yansered" style="margin-top:12px;">*</label>
                    </div>
                </div>
                <div class="span2">
                    <label>押金：</label>
                    <div class="input-prepend">
                        <span class="add-on" style="float:left;height: 15px;">&yen;</span>
                        <input id="depositId" name="deposit" onchange="onchangeOne()"
                               style="width:78%;height: 25px; float:left;" type="text" value="${predetermine.deposit}">
                        <div id="divTwo" hidden>
                            <label class="yansered" style="margin-top:7px;">*</label>
                        </div>
                    </div>
                </div>
                <div class="span2">
                    <label>支付方式</label>
                    <select name="payWayID" style="height:26px;width:100%;">
                        <c:forEach items="${listOne}" var="item">
                            <option value="${item.attributeDetailsId}" <c:if test="${item.attributeDetailsId==predetermine.payWayID}" >selected="selected"</c:if>>
                                    ${item.attributeDetailsName}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="span3">
                    <label>抵达时间：</label>
                    <input id="arriveTimeId" name="arriveTime" style="height:26px;float:left;" id="date" class="Wdate" type="text" onchange="onchangeOne()"
                           onFocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{\'%y-%M-%d\'}'})"
                           value="<fmt:formatDate value="${predetermine.arriveTime}" pattern="yyyy-MM-dd"/>" />
                    <div id="divThree" hidden>
                        <label class="yansered" style="margin-top:12px;">*</label>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <div class="span12" style="margin-top:12px;">
        <div class="row-fluid">
            <div class="span2">
                <label>房间号：</label>
                <input id="roomNumberId" name="roomNumber" class="widthone"
                       style="height: 26px;"  type="text" onchange="onchangeOne()" value="${roomSetPolist.roomNumber}" readonly="readonly">
                <div id="divOne1" hidden>
                    <label class="yansered" style="margin-top:12px;">*</label>
                </div>
            </div>
            <div class="span2">
                <label>客房等级：</label>
                <input type="hidden"  value="${roomSetPolist.guestRoomLevelID}"/>

                <input id="guestRoomLevelNameId" name="guestRoomLevelName" class="widthone"
                       style="height: 26px;"  type="text" onchange="onchangeOne()" value="${roomSetPolist.guestRoomLevelName}" readonly="readonly">
                <div id="divOne2" hidden>
                    <label class="yansered" style="margin-top:12px;">*</label>
                </div>
            </div>
            <div class="span2">
                <label>床位数：</label>
                <div class="input-prepend">
                    <span class="add-on" style="float:left;height: 15px;">&yen;</span>
                    <input id="roomAmountId" name="roomAmount" onchange="onchangeOne()"
                           style="width:78%;height: 25px; float:left;" type="text" value="${roomSetPolist.roomAmount}" readonly="readonly">
                    <div id="divTwo3" hidden>
                        <label class="yansered" style="margin-top:7px;">*</label>
                    </div>
                </div>
            </div>
            <div class="span2">
                <label>标准客房/天</label>
                <div class="input-prepend">
                    <span class="add-on" style="float:left;height: 15px;">&yen;</span>
                    <input id="standardPriceDayId" name="standardPriceDay" onchange="onchangeOne()"
                           style="width:78%;height: 25px; float:left;" type="text" value="${roomSetPolist.standardPriceDay}" readonly="readonly">
                    <div id="divTwo2" hidden>
                        <label class="yansered" style="margin-top:7px;">*</label>
                    </div>
                </div>
            </div>
            <div class="span3">
                <label>标准房价/小时：</label>
                <div class="input-prepend">
                    <span class="add-on" style="float:left;height: 15px;">&yen;</span>
                    <input id="standardPriceId" name="deposit" onchange="onchangeOne()"
                           style="width:78%;height: 25px; float:left;" type="text" value="${roomSetPolist.standardPrice}" readonly="readonly">
                    <div id="divTwo1" hidden>
                        <label class="yansered" style="margin-top:7px;">*</label>
                    </div>
                </div>
            </div>
        </div>
    </div>







    <div class="modal hide fade" id="xuanzhe" style="margin-top:10px;">
        <div class="span5" style="width:98%;height:480px; overflow-x:auto;">
            <div class="row-fluid">
                <div class="span8">
                    <label class="labelroomnumber">房间号：</label>
                    <input id="txtnameid" name="txtname" class="textone" style="width:60%; border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;" type="text" placeholder="请输入关键字" value="${txtname}">
                    <div class="input-append">
                        <button onclick="selectRoom()" class="btn-success textone" style="margin-left:-4px;height:26px;"><li class="icon-search icon-white"></li>搜索</button>
                    </div>
                </div>
                <div class="span4">
                    <button data-dismiss="modal" class="btn btn-info btn-small textone" type="button" onclick="confirmfunction()"><li class="icon-plus icon-white"></li>确定选择</button>
                </div>
            </div>
            <div class="dgvone" style="width:93%; margin-top:10px;">
                <table class="table table-condensed table-bordered table-striped" id="tableid">
                    <thead class="theadone">
                    <tr>
                        <th >选择</th>
                        <th >房间号</th>
                        <th >客房等级</th>
                        <th >床位数</th>
                        <th >标准客房/天</th>
                        <th >标准房价/小时</th>

                    </tr>
                    </thead>
                    <tbody id="tbodyTwo">
                    <c:forEach items="" var="item">
                        <tr>
                            <td><input type="checkbox" name="idTwo" ></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>





    <div class="span11">
        <div class="row-fluid">
            <div class="tcdPageCode" style="text-align:center;"></div>
        </div>
    </div>
</div>





<script type="text/javascript">



    var shijian="";
    function pickedFunc() {
        shijian = $dp.cal.getNewDateStr();
    }

    /*  function updatefunction(){

       parent.document.getElementById('Mainid').src='${ctx}/Predetermine/update.do';
     setTimeout(addfunction(),1000);
   } */


    function selectRoom(){
        var tbody = document.getElementById("tbodyTwo");
        var name=document.getElementById("txtnameid").value;
        var i=0;
        $("#tbodyTwo").empty();                              // 删除 tbody 所有行
        $.ajax({
            cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
            type: "POST",                                           //上面3行都是必须要的
            url: '${ctx}/Predetermine/selectRoom.do',       //地址 type 带参数
            data:"roomNumber="+name,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
            dataType:"json",                                       // json 数据类型提交
            async:false,                                          // 是否 异步 提交
            success: function (result) {
                if(result!=null){
                    var tr=' ';
                    for(var i=0,l=result.length;i<l;i++){
                        tr+='  <tr>\n' +
                            '        <td><input type="radio" name="idTwo" value="'+result[i].roomId +'"></td>\n' +
                            '     <td>'+result[i].roomNumber +'</td>\n' +
                            '          <td>'+result[i].guestRoomLevelName +'</td>\n' +
                            '         <td>'+result[i].roomAmount +'</td>\n' +
                            '        <td>'+ result[i].standardPriceDay+'</td>\n' +
                            '        <td>'+ result[i].standardPrice+'</td>\n' +
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

    var roomIdShuZu=[];

    function confirmfunction(){
        /*  roomIdShuZu.empty(); */
        var chk_value=[];
        var tableOne=document.getElementById("tbodyOne");
        var table=document.getElementById("tbodyTwo");
        var selectedIndex="";
        var roomNumber=[];
        var roomLevel=[];
        var roomAmount=[];
        var roomPrice=[];
        var roomStant=[];
        $('#tbodyOne').empty();
        $('input[name="idTwo"]:checked').each(function(){             // 遍历获取input被checked的
            chk_value.push($(this).val());                             // 获取选中的ID
            roomIdShuZu=chk_value;
            selectedIndex=this.parentNode.parentNode.rowIndex;
            roomNumber.push(table.rows[selectedIndex-1].cells[1].innerHTML);
            roomLevel.push(table.rows[selectedIndex-1].cells[2].innerHTML);
            roomAmount.push(table.rows[selectedIndex-1].cells[4].innerHTML);
            roomPrice.push(table.rows[selectedIndex-1].cells[5].innerHTML);
            roomStant.push(table.rows[selectedIndex-1].cells[6].innerHTML);

        });
        document.getElementById("roomid").value=chk_value;
        document.getElementById("roomNumberId").value=roomNumber;
        document.getElementById("guestRoomLevelNameId").value=roomLevel;
        document.getElementById("roomAmountId").value=roomAmount;
        document.getElementById("standardPriceDayId").value=roomPrice;
        document.getElementById("standardPriceId").value=roomStant;
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
        }else if(document.getElementById("arriveTimeId").value==""){
            alert("抵达时间  是必填项，不能为空哦！");
            document.getElementById("arriveTimeId").focus();
            return false;
        }else if(document.getElementById("predetermineDayId").value.length>10){
            alert("你输入的   预订天数   太过长了  请不要超出  10 位长度");
            document.getElementById("predetermineDayId").focus();
            return false;
        }else if(document.getElementById("depositId").value.length>8){
            alert("你输入的   押金   太过长了  请不要超出  8 位长度");
            document.getElementById("depositId").focus();
            return false;
        }else if(document.getElementById("arriveTimeId").value.length>20){
            alert("你输入的   抵达时间   太过长了  请不要超出  20 位长度抵达时间");
            document.getElementById("arriveTimeId").focus();
            return false;
        }
        if(document.getElementById("tbodyOne").rows.length==0){
            alert("还没有添加房间哦！请选择房间");
            return false;
        }
        if(roomIdShuZu.length==0){
            $('input[name="idOne"]').each(function(){             // 遍历获取input被checked的
                roomIdShuZu.push($(this).val());                             // 获取选中的ID
            });
        }
        var id= document.getElementById("lvkeorteamId").value;
        var teamId= document.getElementById("teamId").value;
        var pangduan=document.getElementById("pangduan").value;
        form1.action="${ctx}/Predetermine/add.do?id="+id+"&type="+teamId+"&roomIdShuZu="
            +roomIdShuZu+"&pangduan="+pangduan;

        form1.submit();
    }

    function lastStep(){
        parent.document.getElementById('Mainid').src='${ctx}/Predetermine/select.do';
    }

    function deletefunction(){
        $('input[name="idOne"]:checked').each(function(){             // 遍历获取input被checked的
            $(this.parentNode.parentNode).remove();
        });
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

</script>

</body>
</html>
