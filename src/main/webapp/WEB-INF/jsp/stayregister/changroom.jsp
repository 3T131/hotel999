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
   
   .table th,.table td{
       text-align: center; 
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
  
  </style>
  
  </head>
  
 
  <body > 
  <div class="container" style="height:630px;overflow-x:auto;">
  
    <div class="span11" style=" border: solid; border-color: #DDDDDD;">
    <div class="span9 margin-top-one">
      <div class="row-fluid">
        <h3 style="text-align: center;">更换房间</h3>
        
      </div>
    </div>
    
    <input type="hidden" id="stayId" value="${stayRegister.stayRegisterId}">         <!-- 住宿ID -->
    <input type="hidden" id="roomId" >                          <!-- 房间ID -->
		<input type="hidden" id="rentOutType" value="${stayRegister.rentOutTypeID}">
    <input id="LvKeLeiXingId" type="hidden" value="${LvKeLeiXingId}">
    
		  <div class="span4" style="text-align:right;">
		      <div class="row-fluid">
			      <div class="span10" style="margin-bottom: 8px;">
				   	 <button class="btn btn-primary" onclick="confirmChangRoom()">
				   	 <li class="icon-check icon-white"></li>确定更换房间</button>
				  </div> 
			  </div>
	      </div>
	      
	      <div class="span3" style="text-align:center; float: left;">
		      <div class="row-fluid">
				   <div class="span10"  style="margin-bottom: 8px;"> 
				   	 <button class="btn btn-warning" type="button" onclick="deletefunction()">
				   	  <li class="icon-remove icon-white"></li>取消</button>
				   </div>
			   </div>
		  </div>
		  <div class="span3" style="text-align:left;">
		    <div class="row-fluid">
			  <div class="span10"  style="margin-bottom: 8px;"> 
		        <button style="margin-top:2px;" href="#xuanzhe" data-toggle="modal" onclick="selectRoom()"
		         class="btn btn-info"><li class="icon-plus icon-white"></li>选择房间</button>
              </div>
            </div>
          </div>
      
    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12">
	      <div class="row-fluid">
		     <div class="span3">
		        <label>新房间号：</label>
		        <input id="newRoomNumberId" type="text" style="width:100%;height:27px;" readonly="readonly"> 
		      </div>
			  <c:if test="${stayRegister.rentOutTypeID==26}">
				  <div class="span3">
					  <label>新房价/天：</label>
					  <input class="roomPriceId" type="text" style="width:100%;height:27px;" readonly="readonly">
				  </div>
			  </c:if>
			  <c:if test="${stayRegister.rentOutTypeID==25}">
				  <div class="span3">
					  <label>新房价/小时：</label>
					  <input class="roomPriceId" type="text" style="width:100%;height:27px;" readonly="readonly">
				  </div>
			  </c:if>
			  <div class="span3">
				  <label>补房费：</label>
				  <input id="changRoomMoneyId" type="text" style="width:100%;height:27px;" readonly="readonly" >
			  </div>
		     <div class="span3">
		        <label>换房时间：</label>
				 <jsp:useBean id="time" class="java.util.Date"/>
		        <input id="changRoomTimeId" type="text" style="width:100%;height:27px;" readonly="readonly"
					   value="<fmt:formatDate value="${time}" pattern="yyyy-MM-dd HH:mm:ss"/>">
		     </div>

		  </div>
	    </div>
	   
      
      <div class="span12 ">
      <fieldset>
        <legend>原房间信息：</legend>
      </fieldset>
      </div>
      
      
      <div class="span12">
	      <div class="row-fluid">
		     <div class="span3">
		        <label>原房间号：</label>
		        <input type="text" style="width:100%;height:27px;" readonly="readonly" value="${stayRegister.roomNumber}">
		     </div>
		     <div class="span3">
		        <label>旅客姓名：</label>
		        <input type="text" style="width:100%;height:27px;" readonly="readonly" value="${stayRegister.passengerList[0].name}">
		      </div>
		     <div class="span3">
		        <label>接待对象：</label>
		        <input type="text" style="width:100%;height:27px;" readonly="readonly" 
		        value="${stayRegister.receiveTarget.principal}"> 
		     </div>
		     <div class="span3">
               <label>出租方式：</label>
		       <input type="text" id="rentOutTypeId" style="width:100%;height:27px;" readonly="readonly" value="${stayRegister.rentOutType}">
             </div>
		  </div>
	   </div>
	    
	    
	   <div class="span12">
	      <div class="row-fluid">
		     <div class="span3">
		        <label>登记时间：</label>
		        <input type="text" style="width:100%;height:27px;" readonly="readonly"
					   value="<fmt:formatDate value="${stayRegister.registerTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" >
		     </div>
			  <c:if test="${stayRegister.rentOutTypeID==26}">
				  <div class="span3">
					  <label>房价/天：</label>
					  <input type="text" class="fangJia" style="width:100%;height:27px;" readonly="readonly" value="${stayRegister.room.standardPriceDay}">
				  </div>
				  <div class="span3">
					  <label>天数：</label>
					  <input type="text" class="numberxx" style="width:100%;height:27px;" readonly="readonly" value="${stayRegister.stayNumber}">
				  </div>
			  </c:if>
			  <c:if test="${stayRegister.rentOutTypeID==25}">
				  <div class="span3">
					  <label>房价/小时：</label>
					  <input type="text" class="fangJia" style="width:100%;height:27px;" readonly="readonly" value="${stayRegister.room.standardPrice}">
				  </div>
				  <div class="span3">
					  <label>小时：</label>
					  <input type="text" class="numberxx" style="width:100%;height:27px;" readonly="readonly" value="${stayRegister.stayNumber}">
				  </div>
			  </c:if>

		     <div class="span3">
               <label>住宿费：</label>
		       <input type="text" style="width:100%;height:27px;" readonly="readonly" value="${stayRegister.sumConst}">
             </div>
		  </div>
	    </div> 
	    
	    
	     <div class="span12">
	      <div class="row-fluid">
		     <div class="span3">
		        <label>其他消费：</label>
		        <input type="text" style="width:100%;height:27px;" readonly="readonly" value="${stayRegister.otherConsumer}">
		     </div>
		     <div class="span3">
		        <label>押金：</label>
		        <input type="text" style="width:100%;height:27px;" readonly="readonly" value="${stayRegister.depoit.depositMoney}">
		     </div>

		       
		  </div>
	    </div> 
      
      
      
     <div class="modal hide fade" id="xuanzhe" style="margin-top:10px;">
       <div class="span5" style="width:98%;height:480px; overflow-x:auto;">
	    <div class="row-fluid">
		   <div class="span8">
		      <label class="labelroomnumber">房间号：</label>
			   <input id="txtnameid" name="txtname" class="textone" style="width:60%; border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:27px;" type="text" placeholder="请输入关键字" value="${txtname}">
			   <div class="input-append">  
			      <button onclick="selectRoom()" class="btn-success textone" style="margin-left:-4px;height:27px;"><li class="icon-search icon-white"></li>搜索</button>
			   </div>
	       </div>
	       <div class="span4">
	          <button data-dismiss="modal" class="btn btn-info btn-small textone" type="button" onclick="changroomConfirmfunction()"><li class="icon-plus icon-white"></li>确定选择</button>
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
	      <tbody id="tbody22">
	      </tbody>
	    </table>
    </div>
    </div>
    </div>
    
    </div>
  
 
 
 
 
 <script type="text/javascript">
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
   }
   
    function deletefunction(){
     var LvKeLeiXingId=document.getElementById("LvKeLeiXingId").value
     parent.document.getElementById('Mainid').src='${ctx}/StayRegister/tolist.do?LvKeLeiXingId='+LvKeLeiXingId;
   }
   
function selectRoom(){
    var name=document.getElementById("txtnameid").value;
         $.ajax({
             cache:false,
             type: "POST",
             url: getRootPath()+'/StayRegister/selectAjaxRoom.do',
             data:"roomNumber="+name,
             async:false,
             dataType:"json",
             success: function (data) {
                var tr='';
             	if(data!=null){
                 for(var i=0,l=data.length;i<l;i++) {
                     tr+='<tr>\n' +
                         '<td><input type="radio" name="roomId" value="'+data[i].roomId+'"></td>\n' +
                         '<td>'+data[i].roomNumber+'</td>\n' +
                         '<td>'+data[i].guestRoomLevelName+'</td>\n' +
                         '<td>'+data[i].roomAmount+'</td>\n' +
                         '<td>'+data[i].standardPriceDay+'</td>\n' +
                         '<td>'+data[i].standardPrice+'</td>\n' +
                         '</tr>';

				 }
				 $("#tbody22").html(tr);
            }
          },
          error: function(data) {
          	alert("访问错误..")
           }
      });     
   }
   
   function changroomConfirmfunction(){
      var chk_value=[];
      var table=document.getElementById("tbody22");
      var selectedIndex="";
      var roomPrice=""; 
      var roomNumber="";
       var roomPriceDay="";
       $('input[name="roomId"]:checked').each(function(){             // 遍历获取input被checked的
	   	chk_value.push($(this).val());                             // 获取选中的ID
	    selectedIndex=this.parentNode.parentNode.rowIndex;
	    roomPrice=table.rows[selectedIndex-1].cells[5].innerHTML;
           roomPriceDay=table.rows[selectedIndex-1].cells[4].innerHTML;
	    roomNumber=table.rows[selectedIndex-1].cells[1].innerHTML;
	  });
	  if(chk_value!=""){
	      var rentOutTypeId=$("#rentOutType").val();
          var fangJia=$(".fangJia").val();
          var numberxx=$(".numberxx").val();
          var yuanJia=parseInt(numberxx)*parseFloat(fangJia);
          var xianJia=null;
	      if(rentOutTypeId==25){
			  xianJia=parseInt(roomPrice)*parseFloat(numberxx);
			$(".roomPriceId").val(roomPrice);
		  }else if(rentOutTypeId==26){
              xianJia=parseInt(roomPriceDay)*parseFloat(numberxx);
              $(".roomPriceId").val(roomPriceDay);
		  }
          var caJia=xianJia-yuanJia;
		  if(caJia<0){
              caJia=0;
		  }
		$("#changRoomMoneyId").val(caJia);
        document.getElementById("roomId").value=chk_value;
        document.getElementById("newRoomNumberId").value=roomNumber;

	  }else{
	  }
   }
   
   function confirmChangRoom(){     //确定更换房间
     if(document.getElementById("newRoomNumberId").value==""){
       alert("请选择要更换到的房间！");
       return false;
     }
     var id=document.getElementById("stayId").value;
     var roomId=document.getElementById("roomId").value;
     var changRoomMoney=document.getElementById("changRoomMoneyId").value;
     parent.document.getElementById('Mainid').src=getRootPath()+'/StayRegister/confirmChangRoom.do?stayRegisterId='+id+
     '&roomID='+roomId+'&changRoomMoney='+changRoomMoney;
   }
   
 </script>
  </div>
  </body>
</html>
