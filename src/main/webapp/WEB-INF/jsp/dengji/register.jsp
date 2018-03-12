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

	
  <%--<link rel="stylesheet" href="${ctx}/css/roomset/roomset.css" type="text/css"></link>--%>

  <link  href="/static/bootstrap/css/bootstrap.css" rel="stylesheet" >
  <link href="/static/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">  <!-- start 响应式布局要添加的 -->
  <script src="/static/bootstrap/js/jquery-3.1.1.min.js"></script>
  <script src="/static/bootstrap/js/bootstrap.js"></script>
  <script src="/static/refre/js/register.js"></script>
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
  <div class="container" >
	  <div class="dgvone" style="margin-left: 10px">
		  <table class="table table-condensed table-bordered table-striped" id="tableid2">
			  <thead class="theadone">
			  <tr>
				  <th style="width: auto">选择</th>
				  <th style="width: auto">姓名</th>
				  <th style="width: auto">性别</th>
				  <th style="width: auto">出生日期</th>
				  <th style="width: auto">民族</th>
				  <th style="width: auto">旅客级别</th>
				  <th style="width: auto">证件类型</th>
				  <th style="width: auto">证件号码</th>
				  <th style="width: auto">联系电话</th>
			  </tr>
			  </thead>
			  <tbody id="tbody2">
			  </tbody>
		  </table>

	  </div>
    <div class="span11" style=" border: solid; border-color: #DDDDDD;">
    <div class="span9 margin-top-one">
      <div class="row-fluid">
        <h3 style="text-align: center;">旅客登记</h3>
      </div>
    </div>
    <%--<a href="#lvke" style="margin-left:20px;margin-top:10px;" data-toggle="modal" class="btn btn-info btn-small" onclick="souSuo()"><li class="icon-plus icon-white"></li>选择旅客</a>--%>
    <form id="form1" method="post" onsubmit="return verify()">
    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    
	    <input id="lvKeId" name="lvKeID" type="hidden">                                       <!-- 旅客ID -->
	    <input id="stayRegisterId" name="stayRegisterID" type="hidden" value="${stayRegisterId}">     <!-- 住宿登记ID -->
	    <input id="LvKeLeiXingId" type="hidden" value="${LvKeLeiXingId}">
	    <div class="span12">
	      <div class="row-fluid">
		     <div class="span3">
		        <label>姓名：</label>
		        <input id="nameId" name="name" onblur="nameOne(this.value)"
		        type="text" style="width:97%;height:27px;" onchange="onchangeTTT()">
		        <div id="divOne" style="float:right;">
			         <label class="yansered" style="margin-top:7px;">*</label>
			    </div> 
		     </div>
		     <div class="span3">
		        <label>性别：</label>
		        <select id="genderId" name="genderID" onchange="gender(this.value)" style="width:100%;height:27px;">
		            <c:forEach items="${listGender}" var="item">
			          <option value="${item.attributeDetailsId}" <c:if test="${item.attributeDetailsId==31}">selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach> 
		          </select>
		     </div>
		     <div class="span3">
		        <label>民族：</label>
		         <select id="nationId" name="nationID" onchange="nation(this.value)" style="width:100%;height:27px;">
		            <c:forEach items="${listNation}" var="item">
			          <option value="${item.attributeDetailsId}" <c:if test="${item.attributeDetailsId==33}">selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach> 
		          </select>
		     </div>
			  <div class="span3">
				  <label>旅客级别：</label>
				  <select id="passengerLevelID" name="passengerLevelID" onchange="passengerLevel(this.value)" style="width:100%;height:27px;">
					  <c:forEach items="${listPassengerLevel}" var="item">
						  <option value="${item.attributeDetailsId}" <c:if test="${item.attributeDetailsId==52}">selected="selected"</c:if>>
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
			  <div class="span3">
				  <label>出生日期：</label>
				  <input id="birthDateId" name="birthDate"  type="text" style="width:100%;height:27px;" class="Wdate"
						 onFocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{\'%y-%M-%d\'}',onpicked:pickedFunc})" onchange="onchangeTTT()">
			  </div>
		     <div class="span3">
		        <label>证件类型：</label>
		        <select id="papersId" name="papersID" onchange="papers(this.value)" style="width:100%;height:27px;">
		            <c:forEach items="${listPapers}" var="item">
			          <option value="${item.attributeDetailsId}" <c:if test="${item.attributeDetailsId==37}">selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach> 
		          </select>
		        
		      </div>
		     <div class="span3">
		        <label>证件号码：</label>
		        <input id="papersNumberId" name="papersNumber" onblur="papersNumberOne(this.value)"
		        type="text" style="width:97%;height:27px;" onchange="onchangeTTT()">
		        <div id="divTwo" style="float:right;">
			         <label class="yansered" style="margin-top:7px;">*</label>
			    </div> 
		     </div>
			  <div class="span3">
				  <jsp:useBean id="time" class="java.util.Date"/>
				  <label>登记时间：</label>
				  <input id="createDate" name="createDate"
						 class="Wdate"
						 onFocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{\'%y-%M-%d\'}',onpicked:pickedFunc})"
						 type="text" style="width:100%;height:27px;"
						 value="<fmt:formatDate value="<%=time%>" pattern="yyyy-MM-dd HH:mm:ss"/>"
				  >
			  </div>
		  </div>
	    </div>
	   <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->

	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12">
	      <div class="row-fluid">
		    <div class="span3">
		   	   <label class="labelroomnumber" style="font-size:15px">联系电话：</label>
	           <input id="contactPhoneNUmberId" name="phoneNumber" onblur="contactPhoneNUmberOne(this.value)"
	           style="width:100%;height:27px;" type="text" onchange="onchangeTTT()">
			</div>
			  <div class="span6">
				  <label class="labelroomnumber" style="font-size:15px">备注：</label>
				  <input id="remarksId" name="remarks" onblur="contactPhoneNUmberOne(this.value)"
						 style="width:100%;height:27px;" type="text" onchange="onchangeTTT()">
			  </div>
			  <div class="span3" style="padding-top: 35px;">
				  <button class="btn btn-warning" type="reset" >
				  <li class="icon-remove icon-white"></li>清空</button>
					  <button class="btn btn-success" style="margin-left: 10px;" type="button" onclick="tijiaoRegister()">
					  <li class="icon-remove icon-white"></li>添加</button>
			  </div>

	      </div>
	    </div>

      </form>

       
    </div>

  </div>
  </body>
</html>
