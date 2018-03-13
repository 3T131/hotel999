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
      <script type="text/javascript" src="/static/js/page.js"></script>
  <script type="text/javascript" src="/static/js/predetermine/add.js"></script>
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
  <div class="container" style="height:630px;">
    
    <input id="lvkeorteamId" type="hidden" value="${id}" >  <!-- 是团队还是旅客的ID -->
    <input id="teamId" type="hidden" value="${type}" >  <!-- 是团队还是旅客 -->
    
    <div class="span12" style="text-align: center;">
      <div class="row-fluid">
        <h3>客房预订新增</h3>
      </div>
    </div>
    
    <form id="form12" action="${ctx}/Predetermine/add.do"  method="post">
    <div class="span12" >
      <div class="row-fluid">
        <div class="span1">
            <button class="btn btn-info btn-small" type="button" onclick="addfunction()"><li class="icon-plus icon-white"></li>保存</button>
        </div>
         <div class="span1">
            <button class="btn btn-warning btn-small" type="button" onclick="lastStep()"><li class="icon-remove icon-white"></li>取消</button>
        </div>
         <div class="span2">
            <button href="#lvke" data-toggle="modal" class="btn btn-info btn-small" onclick="souSuo()" ><li class="icon-plus icon-white"></li>选择旅客</button>
        </div>
      </div>
    </div>
        <input id="roomId22" value="" name="roomID" type="hidden" >
    <input type="hidden" value="" id="pId" name="passengerID"/>
    <div class="span12" style="margin-top:12px;">
      <div class="row-fluid">
          <div class="span2">
              <label>接待对象:</label>
              <select name="predetermineTargetID" style="height:26px;width:100%;">
                  <c:forEach items="${listReceiveTarget}" var="item">
                      <option value="${item.receiveTargetId}" <c:if test="${item.receiveTargetId==1}">selected="selected"</c:if>>
                              ${item.principal}
                      </option>
                  </c:forEach>
              </select>
          </div>
        <div class="span2">
           <label>预订天数：</label>
           <input value="2" id="predetermineDayId" name="predetermineDay" class="widthone"
           style="height: 26px;"  type="text" onchange="onchangeOne()">
           <div id="divOne">
	          <label class="yansered" style="margin-top:12px;">*</label>
	       </div>
        </div>
        <div class="span2">
           <label>押金：</label>
           <div class="input-prepend">
			  <span class="add-on" style="float:left;height: 15px;">&yen;</span>
		      <input value="200" id="depositId" name="deposit" onchange="onchangeOne()"
		      style="width:78%;height: 25px; float:left;" type="text" >
		      <div id="divTwo">
	             <label class="yansered" style="margin-top:7px;">*</label>
	          </div>
		   </div>      
        </div>
        <div class="span2">
           <label>支付方式</label>
           <select name="payWayID" style="height:26px;width:100%;">
		            <c:forEach items="${listOne}" var="item">
			          <option value="${item.attributeDetailsId}" <c:if test="${item.attributeDetailsId==21}" >selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach> 
		    </select>
        </div>
         <div class="span3">
           <label>抵达时间：</label>
             <jsp:useBean id="time" class="java.util.Date"/>
          <input  value="<fmt:formatDate value="${time}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                  name="arriveTime" style="height:26px;float:left;" id="date" class="Wdate" type="text" onchange="onchangeOne()"
		       onFocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{\'%y-%M-%d\'}'})" />
          <div id="divThree">
	          <label class="yansered" style="margin-top:12px;">*</label>
	      </div>
        </div>

      </div>
    </div>

    </form>
      <div class="span12">
          <div class="row-fluid">
              <div class="span2">
                  <label>预订对象/旅客：</label>
                  <input id="pName" name="commodityName" class="widthone" style="height: 26px;"  type="text" readonly="readonly" value="${name}">
              </div>
              <div class="span2">
                  <label>房间号：</label>
                  <input id="roomNumber" type="text" style="width:100%;height:27px;" readonly="readonly">
              </div>
              <div class="span2">
                  <label>标准房价/天：</label>
                  <input id="biaoZhunFangJiaId" type="text" style="width:100%;height:27px;" readonly="readonly">
              </div>
              <div class="span2">
                  <label>钟点房间/小时：</label>
                  <input id="zhongDianFangId" type="text" style="width:100%;height:27px;" readonly="readonly">
              </div>
              <div class="span2">
                  <label>床位数：</label>
                  <input id="roomAmount" type="text" style="width:100%;height:27px;" readonly="readonly">
              </div>
              <div class="span2">
                  <label>房间类型 ：</label>
                  <input id="guestRoomLevel" type="text" style="width:100%;height:27px;" readonly="readonly">
              </div>

          </div>
      </div>

      <div class="span12">
          <fieldset>
              <legend>房态：</legend>
          </fieldset>
      </div>

      <div class="span12" style="margin-top:-17px;">
          <div class="row-fluid">
              <button class="btn btn-info btn-small" type="button" onclick="allroomfunction()">所有房间</button>
              <button class="btn btn-info btn-small" type="button" onclick="onefunction()">单人普通房</button>
              <button class="btn btn-info btn-small" type="button" onclick="twofunction()">单人标准间</button>
              <button class="btn btn-info btn-small" type="button" onclick="threefunction()">二人普通房</button>
              <button class="btn btn-info btn-small" type="button" onclick="fourfunction()">二人标准间</button>
              <button class="btn btn-info btn-small" type="button" onclick="fivefunction()">豪华间</button>
              <button class="btn btn-info btn-small" type="button" onclick="sixfunction()">会议室</button>
              <button class="btn btn-info btn-small" type="button" onclick="sevenfunction()">总统套房</button>
          </div>
      </div>

      <div class="span12" id="dynamicid" style="height:270px;overflow-x:auto;">
          <div class="row-fluid" id="div1">
              <c:forEach items="${listRoom}" var="item">
                  <c:if test="${item.roomStateID==1}">
                      <button onclick="suibian(this)" style="width:95px;;height:93px;border: 3px solid #666666;  float:left;margin:2px; background:#99FF99;">
                          <input style="display: none;" value="${item.roomId}" />
                          <input style="display: none;" value="${item.roomStateID}" />
                          <label>${item.roomNumber}</label>
                          <label style="margin-top:-5px;">${item.roomName}</label>
                          <label style="margin-top:-5px;">${item.guestRoomLevelName}</label>
                          <label style="margin-top:-5px;">￥${item.standardPriceDay}</label>
                          <input style="display: none;" value="${item.standardPrice}" />
                          <input style="display: none;" value="${item.firstPrice}" />
                          <input style="display: none;" value="${item.firstDuration}" />
                      </button>
                  </c:if>
                  <c:if test="${item.roomStateID==2}">
                      <button onclick="suibian(this)" style="width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#DDDDDD;">
                          <input style="display: none;" value="${item.roomId}" />
                          <input style="display: none;" value="${item.roomStateID}" />
                          <label>${item.roomNumber}</label>
                          <label style="margin-top:-5px;">${item.roomName}</label>
                          <label style="margin-top:-5px;">${item.guestRoomLevelName}</label>
                          <label style="margin-top:-5px;">￥${item.standardPriceDay}</label>
                          <input style="display: none;" value="${item.standardPrice}" />
                          <input style="display: none;" value="${item.firstPrice}" />
                          <input style="display: none;" value="${item.firstDuration}" />
                      </button>
                  </c:if>
                  <c:if test="${item.roomStateID==4}">
                      <button onclick="suibian(this)" style="width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#99FFFF;">
                          <input style="display: none;" value="${item.roomId}" />
                          <input style="display: none;" value="${item.roomStateID}" />
                          <label>${item.roomNumber}</label>
                          <label style="margin-top:-5px;">${item.roomName}</label>
                          <label style="margin-top:-5px;">${item.guestRoomLevelName}</label>
                          <label style="margin-top:-5px;">￥${item.standardPriceDay}</label>
                          <input style="display: none;" value="${item.standardPrice}" />
                          <input style="display: none;" value="${item.firstPrice}" />
                          <input style="display: none;" value="${item.firstDuration}" />
                      </button>
                  </c:if>
                  <c:if test="${item.roomStateID==5}">
                      <button onclick="suibian(this)" style="width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#BBBB00;">
                          <input style="display: none;" value="${item.roomId}" />
                          <input style="display: none;" value="${item.roomStateID}" />
                          <label>${item.roomNumber}</label>
                          <label style="margin-top:-5px;">${item.roomName}</label>
                          <label style="margin-top:-5px;">${item.guestRoomLevelName}</label>
                          <label style="margin-top:-5px;">￥${item.standardPriceDay}</label>
                          <input style="display: none;" value="${item.standardPrice}" />
                          <input style="display: none;" value="${item.firstPrice}" />
                          <input style="display: none;" value="${item.firstDuration}" />
                      </button>
                  </c:if>
                  <c:if test="${item.roomStateID==6}">
                      <button onclick="suibian(this)" style="width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#FF7744;">
                          <input style="display: none;" value="${item.roomId}" />
                          <input style="display: none;" value="${item.roomStateID}" />
                          <label>${item.roomNumber}</label>
                          <label style="margin-top:-5px;">${item.roomName}</label>
                          <label style="margin-top:-5px;">${item.guestRoomLevelName}</label>
                          <label style="margin-top:-5px;">￥${item.standardPriceDay}</label>
                          <input style="display: none;" value="${item.standardPrice}" />
                          <input style="display: none;" value="${item.firstPrice}" />
                          <input style="display: none;" value="${item.firstDuration}" />
                      </button>
                  </c:if>
                  <c:if test="${item.roomStateID==7}">
                      <button onclick="suibian(this)"  style="width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#FF0088;">
                          <input style="display: none;" value="${item.roomId}" />
                          <input style="display: none;" value="${item.roomStateID}" />
                          <label>${item.roomNumber}</label>
                          <label style="margin-top:-5px;">${item.roomName}</label>
                          <label style="margin-top:-5px;">${item.guestRoomLevelName}</label>
                          <label style="margin-top:-5px;">￥${item.standardPriceDay}</label>
                          <input style="display: none;" value="${item.standardPrice}" />
                          <input style="display: none;" value="${item.firstPrice}" />
                          <input style="display: none;" value="${item.firstDuration}" />
                      </button>
                  </c:if>
                  <c:if test="${item.roomStateID==65}">
                      <button onclick="suibian(this)" style="width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#FF00FF;">
                          <input style="display: none;" value="${item.roomId}" />
                          <input style="display: none;" value="${item.roomStateID}" />
                          <label>${item.roomNumber}</label>
                          <label style="margin-top:-5px;">${item.roomName}</label>
                          <label style="margin-top:-5px;">${item.guestRoomLevelName}</label>
                          <label style="margin-top:-5px;">￥${item.standardPriceDay}</label>
                          <input style="display: none;" value="${item.standardPrice}" />
                          <input style="display: none;" value="${item.firstPrice}" />
                          <input style="display: none;" value="${item.firstDuration}" />
                      </button>
                  </c:if>
              </c:forEach>
          </div>
      </div>


      <div class="modal hide fade" id="lvke" style="text-align: center;">
          <div class="span6" style="width:98%;height:480px; overflow-x:auto;">
              <div class="row-fluid">
                  <div class="span8">
                      <label class="labelroomnumber">旅客姓名：</label>
                      <input id="txtnameidThree" name="passengerName" class="textone" style="width:60%; border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;" type="text" placeholder="请输入关键字" value="">
                      <div class="input-append">
                          <button type="submit" class="btn-success textone"
                                  style="margin-left:-4px;height:26px;" onclick="souSuo()">
                              <li class="icon-search icon-white"></li>搜索</button>
                      </div>
                  </div>
                  <div class="span2">
                      <button class="btn btn-info btn-small textone" type="button" onclick="confirmfunction()">确定选择</button>
                  </div>
                  <div class="span2">
                      <button class="btn btn-info btn-small textone" type="button" onclick="passengerAdd()" data-dismiss="modal">添加旅客</button>
                  </div>
              </div>
              <div class="dgvone" style="width:93%;">
                  <table class="table table-condensed table-bordered table-striped" id="tableid">
                      <thead class="theadone">
                      <tr>
                          <th >选择</th>
                          <th >姓名</th>
                          <th >性别</th>
                          <th >证件号码</th>
                          <th>联系电话</th>
                      </tr>
                      </thead>
                      <tbody id="tbodyThree">

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
   
 

   
   
 </script>
   
  </body>
</html>
