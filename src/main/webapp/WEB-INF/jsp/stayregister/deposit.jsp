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
    
    .yansered{
      color:red;
    }
  
  </style>
  
  </head>
  
 
  <body >
  <div class="container" >
<input type="hidden" id="LvKeLeiXingId" value="${stayRegister.lvKeLeiXingId}">
      <input type="hidden" id="isBillID" value="${stayRegister.isBillID}">
    <div class="span11" style=" border: solid; border-color: #DDDDDD;">
    <div class="span9 margin-top-one">
      <div class="row-fluid">
        <h3 style="text-align: center;">押金记录</h3>
      </div>
    </div>
    
    <div class="span10" style="background:#CEFFCE">
      <div class="row-fluid">
        <div class="span3">
          <label style="float:left;">房间号：</label>
          <label>${stayRegister.roomNumber}</label>
        </div>
        <div class="span3">
          <label style="float:left;">旅客姓名：</label>
          <label>${stayRegister.passengerName}</label>
        </div>
      </div>
    </div>
    
    
    <div class="span6" style="text-align:center;">
      <div class="row-fluid">
	      <div class="span12" style="margin-top: 10px;margin-bottom: 8px;">
		   	 <a href="#lvke" id="dd" data-toggle="modal" class="btn btn-primary" onclick="fn(this)">
		   	 <li class="icon-check icon-white"></li>追加押金</a>
		  </div> 
	  </div>
    </div>
    
    <div class="span4" style="text-align:center;">
      <div class="row-fluid">
		   <div class="span4"  style="margin-top: 10px;margin-bottom: 8px;"> 
		   	 <button class="btn btn-warning" type="button" onclick="deletefunction()">
		   	  <li class="icon-remove icon-white"></li>返回</button>
		   </div>
	     </div>
      </div>
    
    
    <div class="dgvone">
       <table class="table table-condensed table-bordered table-striped" id="tableid">
	      <thead class="theadone">
	        <tr>
	          <th rowspan="2">登记时间</th>
	          <th rowspan="2">押金</th>
	          <th rowspan="2">支付方式</th>

	      </thead>
	      <tbody id="tbody">
		        <tr>
		          <td><fmt:formatDate value="${depoit.registerDate}" pattern="yyyy-MM-dd"/> </td>
		          <td id="Money">${depoit.depositMoney}</td>
		          <td>${depoit.payFs}</td>
		        </tr>
	      </tbody>
	    </table>
    </div>
    
    <div class="modal hide fade" id="lvke" style="text-align: center;">
        <form id="form1" action="" method="post">
	      <div class="row-fluid">
	          <input id="depositId" name="depositId" type="hidden" value="${depoit.depoitId}">
		      <div class="span4">
			   	  <label class="labelroomnumber">追加押金：</label>
			      <input id="depositMoney" name="depositMoney" class="textone" onchange="onchangeOne()"type="text">
			  </div>
              <div class="span2">
              </div>
			  <div class="span4">
			   	  <label class="labelroomnumber">备注：</label>
				  <input id="remarks" name="remarks" class="textone" type="text">
			  </div>
		  </div>
		  <div class="span6" >
		     <button class="btn btn-primary"  type="button"  onclick="tijiao()"><li class="icon-check icon-white"></li>保存</button>
		  </div>
      </form>
      </div>
    </div>
    </div>
  
 
 
 
 
 <script type="text/javascript">
 function tijiao(){
    if(document.getElementById("depositId").value==""){
      alert("追加押金为空了，无法保存！");
      return false;
    }

     var depositId = document.getElementById("depositId").value;
     var depositMoney = document.getElementById("depositMoney").value;
     var remarks = document.getElementById("remarks").value;
     var Money = document.getElementById("Money");
     $.ajax({
         cache: false,
         type: "POST",
         url: '${ctx}/StayRegister/deposit.do',
         data: {depoitId:depositId,depositMoney:depositMoney,remarks:remarks},
         async: false,
         dataType:"json",
         success: function (result) {
            if(result.success!=false){
                Money.innerText=result.success;
            }else{
                alert("数据错误，稍后再试..")
            }
         },
         error: function (data) {
             alert("ajax错误，稍后再试..")
         }

     });
     $("#lvke").modal("hide");
    <%--var LvKeLeiXingId=document.getElementById("LvKeLeiXingId").value;--%>
    <%--form1.action="${ctx}/StayRegister/deposit.do";--%>
    <%--form1.submit();--%>
 }
 
    
   
    function deletefunction(){
     var LvKeLeiXingId=document.getElementById("LvKeLeiXingId").value
     parent.document.getElementById('Mainid').src='${ctx}/StayRegister/tolist.do?LvKeLeiXingId='+LvKeLeiXingId;
   }
   
   function fn(s){
    var isBillID=document.getElementById("isBillID").value;
     if(isBillID==69){
       alert("很抱歉！该数据已经结账没法进行此操作！");
       $("#dd").removeAttr("href");
     }
   }
   
   function onchangeOne(){
     //押金
     if(document.getElementById("depositId").value!=""){
       document.getElementById("divOne").style.display="none";
       if(!document.getElementById("depositId").value.trim().match("^[0-9]+(\\.[0-9]+)?$"))
       {
          document.getElementById("depositId").focus();
          document.getElementById("depositId").value="";
          document.getElementById("divOne").style.display="block"; //显示
          alert("首段价格:请输入正数");
       }
     }else if(document.getElementById("depositId").value.length>8){
         document.getElementById("depositId").focus();
         document.getElementById("depositId").value="";
         document.getElementById("divOne").style.display="block"; //显示
         alert("你输入的    押金   太过长了  请不要超出  8 位长度");
     }else{
       document.getElementById("divOne").style.display="block"; //显示
     }
    
   }
 </script>
  </div>
  </body>
</html>
