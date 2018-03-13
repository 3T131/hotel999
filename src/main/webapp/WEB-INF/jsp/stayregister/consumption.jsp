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
  <link rel="stylesheet" href="/static/css/page.css" type="text/css"></link>
  <script type="text/javascript" src="/static/js/page.js"></script>
	  <script type="text/javascript" src="/static/js/stayregister/consumption.js"></script>
   <style>
   
   .container{
     margin-top: 10px;
   }
   
   .theadone{
     background-color: #CCFF99;
    }
    
    .table th,.table td{
       text-align: center; 
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
  
  </style>
  
  </head>
  
 
  <body > 
  <div class="container">
  <input id="consumptionStayRegisterID" type="hidden" value="${stayRegister.stayRegisterId}">
  <input id="LvKeLeiXingId" type="hidden" value="${stayRegister.lvKeLeiXingId}">
  <input type="hidden" id="isBillID" value="${stayRegister.isBillID}"/>
  
    <div class="span11" style="height:610px;; border: solid; border-color: #DDDDDD;">
    <div class="span9 margin-top-one">
      <div class="row-fluid">
        <h3 style="text-align: center;">旅客消费</h3>
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
          <label>${stayRegister.passengerList[0].name}</label>
        </div>
      </div>
    </div>
    
    <div class="span3" style="text-align:right;">
      <div class="row-fluid">
	      <div class="span12" style="margin-top: 10px;margin-bottom: 8px;">
		   	 <a id="dd" href="#lvke" data-toggle="modal" class="btn btn-primary" onclick="ajaxConsumptionSelect()">
		   	 <li class="icon-check icon-white"></li>添加消费</a>
		  </div> 
	  </div>
    </div>
    
    <div class="span4" style="text-align:center;">
          <c:if test="${userSession.targetTypeID==55}">
       <div class="row-fluid">
         <button class="btn btn-danger textone" type="button" onclick="deletefunction()"><li class="icon-remove icon-white"></li>删除</button>
       </div>
		  </c:if>
    </div>
    
    <div class="span3" style="text-align:left;">
       <div class="row-fluid">
		   <div class="span4"  style="margin-top: 10px;margin-bottom: 8px;"> 
		   	 <button class="btn btn-warning" type="button" onclick="returnfunction()">
		   	  <li class="icon-remove icon-white"></li>返回</button>
		   </div>
	   </div>
    </div>
    
    
    <div class="modal hide fade" id="lvke" style="text-align: center;">
      <div class="span5" style="width:98%;height:480px; overflow-x:auto;">
	         <div class="row-fluid">
			   <div class="span6">
			      <label class="labelroomnumber">商品名称：</label>
				   <input id="commodityName" class="textone" style="width:40%; border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:27px;" type="text" placeholder="请输入关键字" value="${txtname}">
				   <div class="input-append">  
				      <button onclick="ajaxConsumptionSelect()" type="button" class="btn-success textone" style="margin-left:-4px;height:27px;"><li class="icon-search icon-white"></li>搜索</button>
				   </div>
		       </div>
		       <div class="span3">
		         <select id="selectCboId" style="margin-top:10px;width:100%;" onchange=ajaxConsumptionSelect()>
					 <option value="0" selected > 全部</option>
					 <c:forEach items="${listCommodity}" var="item">
						 <option value="${item.attributeDetailsId}" >
								 ${item.attributeDetailsName}
						 </option>
					 </c:forEach>
			     </select>
			     </div>
		       <div class="span3" style="text-align: left;">
		          <button id="btn1" class="btn btn-info btn-small textone" data-dismiss="modal" type="button" onclick="confirmFunction()"><li class="icon-plus icon-white"></li>确定选择</button>
		       </div>
		    </div>
	     <div class="dgvone" style="width:93%;">
       <table class="table table-condensed table-bordered table-striped" id="tableid2">
	      <thead class="theadone">
	        <tr>
	          <th >选择</th>
	          <th >商品名称</th>
	          <th >商品类别</th>
	          <th >计量单位</th>
	          <th >销售价格</th>
	          <th style="width:20%">数量</th>
	        </tr>
	      </thead>
	      <tbody id="tbodyComm">

	      </tbody>
	    </table>
    </div>
    </div>
    </div>
    
    
    
    <div class="dgvone">
       <table class="table table-condensed table-bordered table-striped" id="tableid">
	      <thead class="theadone">
	        <tr>
	          <th rowspan="2">选择</th>
	          <th rowspan="2">消费商品</th>
	          <th rowspan="2">计量单位</th>
	          <th rowspan="2">单价</th>
	          <th rowspan="2">数量</th>
	          <th rowspan="2">消费金额</th>
	          <th rowspan="2">消费时间</th>
	      </thead>
	      <tbody id="tbody">
	        <c:forEach items="${consumptionDetailsList}" var="item">
		        <tr>
		          <td><input type="checkbox" name="id" value="${item.consumptionDetailsId}"></td>
		          <td>${item.commodity.commodityName}</td>
		          <td>${item.commodity.uOM}</td>
		          <td>${item.commodity.salePrice}</td>
		          <td>${item.consumptionNumber}</td>
		          <td>${item.consumptionMoney}</td>
		          <td>
					  <fmt:formatDate value="${item.consumptionTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				  </td>
		        </tr>
	        </c:forEach>
	      </tbody>
	    </table>
    </div>
    
    <div class="span11">
      <div class="row-fluid">
        <div class="tcdPageCode" style="text-align:center;"></div>
      </div>
    </div>
       
    </div>

 <script type="text/javascript">
     /* 分页要用的 */
     <%--$(".tcdPageCode").createPage({--%>
         <%--pageCount:${list.totalPage},--%>
         <%--current:${list.currentPage},--%>
         <%--backFn:function(p){--%>
             <%--location.href="${ctx}/StayRegister/toconsumption.do?currentPage="+p;--%>
         <%--}--%>
     <%--});--%>
 </script>
  </div>
  </body>
</html>
