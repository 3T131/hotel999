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
  <link href="/static/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">  <!-- start 响应式布局要添加的 -->
  <script src="/static/bootstrap/js/jquery-3.1.1.min.js"></script>
  <script src="/static/bootstrap/js/bootstrap.js"></script>
	  <script  src="/static/My97DatePicker/WdatePicker.js"></script>
	  <script type="text/javascript" src="/static/js/stayregister/modify.js"></script>
   <style>
   
   .container{
     margin-top: 10px;
   }
   
   .theadone{
     background-color: #CCFF99;
    }
   
   .floatont{
     float:left;
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
    
    .yangse{
      color:blue;
    }
  
  </style>
  
  </head>
  
 
  <body > 
  <div class="container" style="height:630px;overflow-x:auto;">
  
    <div class="span11" style=" border: solid; border-color: #DDDDDD;">
    <div class="span9 margin-top-one">
      <div class="row-fluid">
        <h3 style="text-align: center;">修改住房记录</h3>
        
      </div>
    </div>
    <form id="form222"  method="post" action="${ctx}/StayRegister/modify.do" >
    <input type="hidden" id="stayId" name="stayRegisterId" value="${stayRegister2.stayRegisterId}">         <!-- 住宿ID -->
    <input type="hidden" id="roomId" name="roomID" value="${stayRegister2.roomID}">         <!-- 住宿ID -->
		<input type="hidden" id="lvKeLeiXingId" name="lvKeLeiXingId" value="${stayRegister2.lvKeLeiXingId}">
		<div class="span6" style="text-align:center;">
		      <div class="row-fluid">
				  <div class="span3">
					  <label class="floatont">房间号：</label>
					  <label>${stayRegister2.roomNumber}</label>
				  </div>
			      <div class="span9" style="margin-top: 10px;margin-bottom: 8px;">
				   	 <button type="button" class="btn btn-primary" onclick="payfunction()">
				   	 <li class="icon-check icon-white"></li>保存</button>
				  </div>
			  </div>
	  </div>
      
      <div class="span4" style="text-align:center;">
      <div class="row-fluid">
		  <div class="span4"  style="margin-top: 10px;margin-bottom: 8px;">
			  <button class="btn btn-warning" type="button" onclick="deletefunction()">
				  <li class="icon-remove icon-white"></li>取消</button>
		  </div>
	     </div>
      </div>
       


    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12" style="margin-top:20px;">
	      <div class="row-fluid">
		     <div class="span6">
				 <input id="passengerIds" type="hidden" name="passengerIds" value="<c:forEach items="${stayRegister2.passengerList}" var="item">${item.pId},</c:forEach>"  />
		        <label class="floatont">旅客：</label>
				 <a href="#lvke"  data-toggle="modal" class="btn btn-info btn-small"   onclick="souSuo()">
				 <li class="icon-plus icon-white"></li><span>选择旅客</span></a>
				 <label class="yangse" id="lvkess">
					 <c:forEach items="${stayRegister2.passengerList}" var="item">
						 <span class="fff">
							 <span style="color: #E75E55">${item.name}
						 	<span onclick="removeLvke(${item.pId},this)" style="cursor: pointer;"  class="icon-remove icon-red">
						 	</span>
						 </span>

					 </span>
					 </c:forEach>
				 </label>
		     </div>
			  <div class="span3">
				  <label class="floatont">天数或钟点：</label>
				  <input id="stayNumberId" value="${stayRegister2.stayNumber}" name="stayNumber" type="text" onchange="onchangeStayNumberId()"
						 style="width:97%;height:27px;float:left;" placeholder="最低时间参考首段时长">
			  </div>
			  <div class="span3">
				  <label class="floatont">押金：</label>
				  <input id="depositId" value="${stayRegister2.depoit.depositMoney}" name="depoit.depositMoney" type="text" onchange="onchangeOne()"
						 style="width:97%;height:27px;float:left;">
			  </div>

		  </div>
	    </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12" style="margin-top:10px;">
	      <div class="row-fluid">
		     <div class="span3">
		        <label class="floatont">出租方式：</label>
				 <select name="rentOutTypeID" onchange="changeRoomMoney()" id="rentOutTypeID" style="width:100%;height:27px;">
					 <c:forEach items="${listRentOutType}" var="item">
						 <option value="${item.attributeDetailsId}" <c:if test="${item.attributeDetailsId==stayRegister2.rentOutTypeID}">selected="selected"</c:if>>
								 ${item.attributeDetailsName}
						 </option>
					 </c:forEach>
				 </select>
		     </div>
		     <div class="span3">
		        <label class="floatont">结账单位：</label>
				 <select name="billUnitID" style="width:100%;height:27px;">
					 <c:forEach items="${listBillUnit}" var="item">
						 <option value="${item.attributeDetailsId}" <c:if test="${item.attributeDetailsId==stayRegister2.billUnitID}">selected="selected"</c:if>>
								 ${item.attributeDetailsName}
						 </option>
					 </c:forEach>
				 </select>
		     </div>
		     <div class="span3">
		        <label class="floatont">结账方式：</label>
				 <select name="payWayID" style="width:100%;height:27px;">
					 <c:forEach items="${listPayWay}" var="item">
						 <option value="${item.attributeDetailsId}" <c:if test="${item.attributeDetailsId==stayRegister2.payWayID}">selected="selected"</c:if>>
								 ${item.attributeDetailsName}
						 </option>
					 </c:forEach>
				 </select>
		     </div>
			  <div class="span3">
				  <label class="floatont">是否结账：</label>
				  <select id="isBillID" name="isBillID"  >
					  <c:forEach items="${isBillList}" var="item">
						  <option value="${item.attributeDetailsId}" <c:if test="${item.attributeDetailsId==stayRegister2.isBillID}">selected="selected"</c:if>>
								  ${item.attributeDetailsName}
						  </option>
					  </c:forEach>
				  </select>
			  </div>
		  </div>
	    </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	     <div class="span12" style="margin-top:10px;">
	      <div class="row-fluid">
		     <div class="span2">
		        <label class="floatont">登记时间：</label>
				 <input  name="registerTime"  style="width:97%; height:27px;float:left;" class="Wdate" type="text"
						onFocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{\'%y-%M-%d\'}'})"
						value="<fmt:formatDate value="${stayRegister2.registerTime}" pattern="yyyy-MM-dd"/>"/>
		     </div>
			  <div class="span2">
				  <label class="floatont">接待对象：</label>
				  <select name="receiveTargetID" style="width:100%;height:27px;">
					  <c:forEach items="${listReceiveTarget}" var="item">
						  <option value="${item.receiveTargetId}" <c:if test="${item.receiveTargetId==stayRegister2.receiveTargetID}">selected="selected"</c:if>>
								  ${item.principal}
						  </option>
					  </c:forEach>
				  </select>
			  </div>

			  <div class="span2">
				  <label class="floatont">住宿费：</label>
				  <input id="accommodation" value="${stayRegister2.accommodation}" name="sumConst"  type="text" onchange="accommodation()"
						 style="width:97%;height:27px;float:left;">
			  </div>
			  <div class="span2">
				  <label class="floatont">换房次数：</label>
				  <input id="changingRoomNumber" value="${stayRegister2.changingRoomNumber}" name="changingRoomNumber" type="text" onchange="changingRoomNumber()"
						 style="width:97%;height:27px;float:left;" >
			  </div>
			  <div class="span2">
				  <label class="floatont">换房费：</label>
				  <input id="changRoomMoney" value="${stayRegister2.changRoomMoney}" name="changRoomMoney" type="text" onchange="changRoomMoney()";
						 style="width:97%;height:27px;float:left;">
			  </div>
			  <c:if test="${stayRegister2.isBillID==69}">
				  <div class="span2">
					  <label class="floatont">结账时间：</label>
					  <input   name="payTime" style="width:97%; height:27px;float:left;" class="Wdate" type="text"
							  onFocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{\'%y-%M-%d\'}'})"
							  value="<fmt:formatDate value="${stayRegister2.payTime}" pattern="yyyy-MM-dd"/>"/>
				  </div>
			  </c:if>
		  </div>
	    </div>
	   <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->

	     <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12" style="margin-top:10px;">
	      <div class="row-fluid">

		  </div>
	    </div>
	     <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span10">
          <fieldset>
            <legend></legend>
          </fieldset>
        </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12">
	      <label style="float: left;">备注:</label>
	      <input id="remarksId" name="remind" value="${stayRegister2.remind}" class="yangse" type="text" style="width:100%;height:25px;">
	    </div>

      </form>
      
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
