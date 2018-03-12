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
	  <script src="/static/js/passenger/update.js"></script>
   <style>
   
   .container{
     margin-top: 10px;
   }
   
   .theadone{
     background-color: #CCFF99;
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
  
    <div class="span11" style=" border: solid; border-color: #DDDDDD;">
    <div class="span9 margin-top-one">
      <div class="row-fluid">
        <h3 style="text-align: center;">旅客修改</h3>
        
      </div>
    </div>
    
    <form action="${ctx}/Passenger/update.do" method="post" onsubmit="return verify()">
    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <input type="hidden" name="pId" value="${list.pId}" />
	    <div class="span12">
	      <div class="row-fluid">
		     <div class="span3">
		        <label>姓名：</label>
		        <input id="nameId" name="name" type="text" value="${list.name}"
		        style="width:97%;height:26px;float:left;" onchange="onchangeOne()">
		        <div id="divOne" style="float:right;" hidden>
			         <label class="yansered" style="margin-top:7px;">*</label>
			    </div> 
		      </div>
		     <div class="span3">
		        <label>性别：</label>
		        <select name="genderID" style="width:100%;height:26px;">
		            <c:forEach items="${listGender}" var="item">
			          <option value="${item.attributeDetailsId}" <c:if test="${item.attributeDetailsId==list.genderID}">selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach> 
		          </select>
		     </div>
		     <div class="span3">
		        <label>出生日期：</label>
		        <input id="birthDateId" name="birthDate" type="text" style="width:100%;height:26px;" placeholder="年-月-日" value="${list.birthDate}"> 
		     </div>
		     <div class="span3">
		        <label>民族：</label>
		         <select name="nationID" style="width:100%;height:26px;">
		            <c:forEach items="${listNation}" var="item">
			          <option value="${item.attributeDetailsId}" <c:if test="${item.attributeDetailsId==list.nationID}">selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach> 
		          </select>
		     </div>
		  </div>
	    </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12">
	      <div class="row-fluid">


		  </div>
	    </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	     <div class="span12">
	      <div class="row-fluid">
		     <div class="span3">
		        <label>旅客级别：</label>
		         <select name="passengerLevelID" style="width:100%;height:26px;">
		            <c:forEach items="${listPassengerLevel}" var="item">
			          <option value="${item.attributeDetailsId}" <c:if test="${item.attributeDetailsId==list.passengerLevelID}">selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach>
		          </select>
		     </div>
		     <div class="span3">
		        <label>证件类型：</label>
		        <select id="papersId" name="papersID" style="width:100%;height:26px;">
		            <c:forEach items="${listPapers}" var="item">
			          <option value="${item.attributeDetailsId}" <c:if test="${item.attributeDetailsId==list.papersID}">selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach> 
		          </select>
		        
		      </div>
		     <div class="span3">
		        <label>证件号码：</label>
		        <input id="papersNumberId" name="papersNumber" type="text" onblur="YZ(this.value)"
		         style="width:97%;height:26px;float:left;" onchange="onchangeOne()" value="${list.papersNumber}"> 
		        <div id="divTwo" style="float:right;" hidden>
			         <label class="yansered" style="margin-top:7px;">*</label>
			    </div> 
		     </div>

		  </div>
	    </div>
	   <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12">
	      <div class="row-fluid">
		     <div class="span3">
		        <label>联系电话：</label>
		         <input id="contactPhoneNumberId" name="phoneNumber" type="text" value="${list.phoneNumber}"
		         style="width:100%;height:26px;"  placeholder="只能为手机号码" onblur="onchangeOne()">
		     </div>
		  </div>
	    </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12">
	      <label style="float: left;">备注：</label>
	      <input name="remarks" type="text" style="width:100%;height:26px;" value="${list.remarks}"> 
	    </div>
	    
	
		  <div class="span6" style="text-align:center;">
		      <div class="row-fluid">
			      <div class="span12" style="margin-top: 10px;margin-bottom: 8px;">
				   	 <button class="btn btn-primary" type="submit">
				   	 <li class="icon-check icon-white"></li>修改</button>
				  </div> 
				 
			  </div>
	      </div>
      </form>
      
      
      <div class="span4" style="text-align:center;">
      <div class="row-fluid">
		   <div class="span4"  style="margin-top: 10px;margin-bottom: 8px;"> 
		   	 <button class="btn btn-warning" type="button" onclick="deletefunction()">
		   	  <li class="icon-remove icon-white"></li>取消</button>
		   </div>
	     </div>
      </div>
       
    </div>
  </div>
  
 
 
 
 
 <script type="text/javascript">

 </script>
   
  </body>
</html>
