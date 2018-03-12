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

	
<!--   <link rel="stylesheet" href="${ctx}/css/roomset/roomset.css" type="text/css"></link> -->
  <%--<link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.css" type="text/css"></link>--%>
  <%--<link href="${ctx}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">  <!-- start 响应式布局要添加的 -->--%>
  <%--<script src="${ctx}/bootstrap/js/jquery-3.1.1.min.js"></script>--%>
  <%--<script src="${ctx}/bootstrap/js/bootstrap.js"></script>--%>
  <%--<link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.min.css" type="text/css"></link>--%>
  
  <script type="text/javascript" src="/static/My97DatePicker/WdatePicker.js"></script>
	  <script src="/static/refre/predeter/arrangeroom.js"></script>
 

  
   
   <style>

   .container{
     margin-top: 10px;
   }


   .labelroomnumber{
      position: relative;
      font-size: 17px;
      float: left;
      margin-top: 15px;
    }

    .marginrightone{
      margin-right: 33px;
    }

    .marginrighttwo{
      margin-right: 16.5px;
    }

    .marginrightthree{
      margin-right: 43px;
    }

   .textone{
    margin-top:12px;
    }

    .inputone{
    width:54.2%;
    }

    .inputtwo{
      width:46.8%;
    }

    .inputthree{
      width:46.8%;
    }

    .cboone{
      margin-top:10px;
      height: 27px;
    }

    .margin-top-one{
      margin-top: -10px;
    }

    .margin-top-two{
      margin-top: -20px;
    }

    .textwidth{
      width: 138px;
    }

    .radiusone{
     margin-left: -4px;
    }

     @media(min-width:731px) and (max-width:767px){
      .inputthree{
      width: 50.5%;
    }
    }

    @media(min-width:550px) and (max-width:730px){
      .inputtwo{
      width: 46.2%;
    }
        .inputthree{
      width: 49.2%;
    }
    }


     @media(min-width:431px) and (max-width:550px){
      .inputtwo{
      width: 43.2%;
    }
      .inputthree{
      width: 47.5%;
    }
    }

    @media(min-width:366px) and (max-width:430px){
      .inputtwo{
      width: 40.2%;
    }
      .inputthree{
      width: 46%;
    }
    }

     @media(min-width:285px) and (max-width:366px){
      .inputtwo{
      width: 37.2%;
    }
      .inputthree{
      width: 44%;
    }
    }

     @media(min-width:237px) and (max-width:285px){
      .inputtwo{
      width: 30%;
    }
      .inputthree{
      width: 40%;
    }
    }
    .span12{
      width:95%;

    }

    .yansered{
      color:red;
    }

  </style>
  
  </head>
  
 
  <body > 
  <div class="container" style="height:630px;overflow-x:auto;">

	  <div class="dgvone">
		  <table class="table table-condensed table-bordered table-striped" id="tableid">
			  <thead class="theadone">
			  <tr>
				  <th  style="width: 5%">选择</th>
				  <th style="width: 7%">房间号</th>
				  <th  style="width: 10%">客房等级</th>
				  <th  style="width: 5%">房态</th>
				  <th  style="width: 7%">床位数</th>
				  <th  style="width: 10%">标准客房/天</th>
				  <th style="width: 10%">标准房价/小时</th>
				  <th style="width: 12%">首段时长(小时)</th>
				  <th style="width: 24%">旅客</th>
				  <th style="width: 10%">操作</th>
			  </tr>
			  </thead>
			  <tbody id="tbody15">
			    <tr class="roomRow">
				  <td><input class="roomIdx" type="checkbox" name="roomids" value="${room.roomId}"></td>
				  <td>${room.roomNumber}</td>
				  <td>${room.guestRoomLevelID}</td>
				  <td>${room.roomName}</td>
				  <td>${room.roomAmount}</td>
				  <td>${room.standardPriceDay}</td>
				  <td>${room.standardPrice}</td>
				  <td>${room.firstDuration}</td>
				 <td style="width: auto" class="lvke24">
					 <span style="color: #E75E55">${p.passengerName}<span onclick="removeLvke(${p.passengerID},this)" style="cursor: pointer;"  class="icon-remove icon-red"></span> </span>
					</td>
				  <td><a href="#lvke"  data-toggle="modal" class="btn btn-info btn-small"  onmousedown="selectRow(this)"  onclick="souSuo()">
					<li class="icon-plus icon-white"></li><span>选择旅客</span></a></td>
				  </tr>
			  </tbody>
		  </table>
	  </div>



    <div class="span11" style=" border: solid; border-color: #DDDDDD;">
    <div class="span9 margin-top-one">
      <div class="row-fluid">
        <h3 style="text-align: center;">安排房间</h3>
      </div>
    </div>
    <form id="form1228" action="${ctx}/StayRegister/predetermineKaiFang.do" method="post" >
		<input type="hidden" id="roomIds" name="roomIds" value="${room.roomId}"/>
		<input type="hidden" id="passengerIds" name="passengerIds" value="${p.passengerID}"/>
		<input type="hidden" id="predetermineID" name="predetermineID" value="${p.predetermineId}"/>
		<input type="hidden" id="commodityIds" name="commodityIds" value=""/>
		<input type="hidden" id="commodityNumber" name="commodityNumber"
			   value=""/>

		<input type="hidden" id="passengerIdRoomId" name="passengerIdRoomId"
			   value='[{"${room.roomId}":["${p.passengerID}"]}]'/>
		<input type="hidden" id="selectRoomId" value=""/>
		<input type="hidden" id="moneyDay" name="moneyDay" value="${room.standardPriceDay}"/>
		<input type="hidden" id="moneyTime" name="moneyTime" value="${room.standardPrice}"/>
		  <div class="span6" style="text-align:center;">
		      <div class="row-fluid">
			      <div class="span12" style="margin-bottom: 8px;">
				   	 <button class="btn btn-primary" type="reset" >
				   	 <li class="icon-check icon-white"></li>清空</button>
				  </div> 
			  </div>
	      </div>
	      
	       <div class="span4" style="text-align:center;">
	      <div class="row-fluid">
			   <div class="span4"  style="margin-bottom: 8px;"> 
			   	 <button class="btn btn-warning" type="button" onclick="deletefunction()">
			   	  <li class="icon-remove icon-white"></li>移除</button>
			   </div>
		  </div>
      </div>
    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12">
	      <div class="row-fluid">
				 <div class="span2">
					 <label>接待对象：</label>
					 <select name="receiveTargetID" style="width:100%;height:27px;">
						 <c:forEach items="${listReceiveTarget}" var="item">
							 <option value="${item.receiveTargetId}" <c:if test="${item.receiveTargetId==1}">selected="selected"</c:if>>
									 ${item.principal}
							 </option>
						 </c:forEach>
					 </select>
				 </div>
		     <div class="span2">
				 <jsp:useBean id="time" class="java.util.Date"/>
				 <label>开房时间：</label>
		        <input id="registerTime" name="registerTime" id="date" style="width:97%; height:27px;float:left;" class="Wdate" type="text"
		        onFocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{\'%y-%M-%d\'}',onpicked:pickedFunc})" onchange="onchangeOne()"
					   value="<fmt:formatDate value="<%=time%>" pattern="yyyy-MM-dd HH:mm:ss"/>"
				/>

		     </div>
		     <div class="span2">
		        <label>出租方式：</label>
		        <select name="rentOutTypeID" onchange="changeRoomMoney()" id="rentOutTypeID" style="width:100%;height:27px;">
		            <c:forEach items="${listRentOutType}" var="item">
			          <option value="${item.attributeDetailsId}" <c:if test="${item.attributeDetailsId==26}">selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach>
		          </select>
		     </div>
		     <div class="span2">
		        <label>旅客类别：</label>
		         <select name="passengerTypeID" style="width:100%;height:27px;">
		            <c:forEach items="${listPassengerType}" var="item">
			          <option value="${item.attributeDetailsId}" <c:if test="${item.attributeDetailsId==p.predetermineTargetID}">selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach> 
		          </select>
		     </div>
			  <div class="span2">
				  <label>支付方式：</label>
				  <select name="payWayID" style="width:100%;height:27px;">
					  <c:forEach items="${listPayWay}" var="item">
						  <option value="${item.attributeDetailsId}" <c:if test="${item.attributeDetailsId==p.payWayID}">selected="selected"</c:if>>
								  ${item.attributeDetailsName}
						  </option>
					  </c:forEach>
				  </select>
			  </div>
			  <div class="span2">
				  <label>结账单位：</label>
				  <select name="billUnitID" style="width:100%;height:27px;">
					  <c:forEach items="${listBillUnit}" var="item">
						  <option value="${item.attributeDetailsId}" <c:if test="${item.attributeDetailsId==27}">selected="selected"</c:if>>
								  ${item.attributeDetailsName}
						  </option>
					  </c:forEach>
				  </select>
			  </div>
		  </div>
	    </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	     <div class="span12">
	      <div class="row-fluid">

			  <div class="span2">
				  <label>预定时的接待对象：</label>
				  <select readonly="readonly" style="width:100%;height:27px;">
					  <c:forEach items="${listReceiveTarget}" var="item">
						  <option value="${item.receiveTargetId}" <c:if test="${item.receiveTargetId==1}">selected="selected"</c:if>>
								  ${item.principal}
						  </option>
					  </c:forEach>
				  </select>
			  </div>
			  <div class="span2">
				  <label>预定时间：</label>
				  <input readonly  style="width:97%; height:27px;float:left;" class="Wdate" type="text"
						   onFocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{\'%y-%M-%d\'}',onpicked:pickedFunc})"
						   value="<fmt:formatDate value="${p.arriveTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
				  />
			  </div>
			  <div class="span2">
				  <label>预定天数：</label>
				  <input  value="${p.predetermineDay}" name="stayNumber" type="text" readonly
						 style="width:97%;height:27px;float:left;" >
			  </div>
		     <div class="span2">
		        <label>住店天数/小时：</label>
		       <input id="stayNumberId" value="1" name="stayNumber" type="text" onchange="onchangeStayNumberId()"
		       style="width:97%;height:27px;float:left;" placeholder="最低时间参考首段时长"> 

		     </div>
		     <div class="span2">
		        <label>押金：</label>
		        <input id="depositId" value="${p.deposit}" name="depoit.depositMoney" type="text" onchange="onchangeOne()"
		        style="width:97%;height:27px;float:left;">
		     </div>


		  </div>
			 <div class="row-fluid">
				 <div class="span12">
					 <label>备注：</label>
					 <input id="remarks"  name="remarks" type="text"
							style="width:97%;height:27px;float:left;">
				 </div>
			 </div>
	    </div>
      </form>
      
      <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
     
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
         <c:forEach items="${list}" var="item">
	       <c:if test="${item.roomStateID==1}">
	         <button onclick="suibian(this)" style="width:95px;;height:93px;border: 3px solid #666666;  float:left;margin:2px; background:#99FF99;">
	             <input style="display: none;" value="${item.id}" />
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
	             <input style="display: none;" value="${item.id}" />
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
		           <input style="display: none;" value="${item.id}" />
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
		           <input style="display: none;" value="${item.id}" />
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
		           <input style="display: none;" value="${item.id}" />
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
		           <input style="display: none;" value="${item.id}" />
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
		           <input style="display: none;" value="${item.id}" />
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
    </div>

	  <div class="modal hide fade" id="lvke" style="text-align: center;">
		  <div class="span5" style="width:98%;height:480px; overflow-x:auto;">
			  <div class="row-fluid">
				  <div class="span8">
					  <label class="labelroomnumber">旅客姓名：</label>
					  <input id="txtnameid" name="txtname" class="textone" style="width:55%; border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:27px;" type="text" placeholder="请输入关键字" value="${txtname}">
					  <div class="input-append">
						  <button onclick="souSuo()" class="btn-success textone" style="margin-left:-4px;height:27px;"><li class="icon-search icon-white"></li>搜索</button>
					  </div>
				  </div>
				  <div class="span4">
					  <button data-dismiss="modal" class="btn btn-info btn-small textone" type="button" onclick="passengerQd()"><li class="icon-plus icon-white"></li>确定选择</button>
				  </div>
			  </div>
			  <div class="dgvone" style="width:93%;">
				  <table class="table table-condensed table-bordered table-striped" >
					  <thead class="theadone">
					  <tr>
						  <th style="width: 10%" >选择</th>
						  <th style="width: 20%">姓名</th>
						  <th style="width: 10%" >性别</th>
						  <th  style="width: 20%">证件类型</th>
						  <th style="width: 40%">证件号码</th>
					  </tr>
					  </thead>
					  <tbody id="tbody">
					  <tr>
						  <td><input type="radio" name="id" value=""></td>
						  <td></td>
						  <td></td>
						  <td></td>
						  <td></td>
					  </tr>
					  </tbody>
				  </table>
			  </div>
		  </div>
	  </div>


  </div>
  </body>
</html>
