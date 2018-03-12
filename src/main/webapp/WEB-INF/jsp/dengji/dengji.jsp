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
  <%--<link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.css" type="text/css"></link>--%>
  <%--<link rel="stylesheet" href="${ctx}/css/page.css" type="text/css"></link>--%>
  <%--<link href="${ctx}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">  <!-- start 响应式布局要添加的 -->--%>
  <%--<script type="text/javascript" src="${ctx}/js/page.js"></script>--%>
  <%--<script type="text/javascript" src="${ctx}/js/common.js"></script>--%>
	  <%--<script src="${ctx}/bootstrap/js/jquery-3.1.1.min.js"></script>--%>
	  <%--<script src="${ctx}/bootstrap/js/bootstrap.js"></script>--%>


	  <script src="/static/refre/js/back-to-top.js" type="text/javascript"></script>
	  <script src="/static/bootstrap/js/bootstrap.js"></script>
	  <script src="/static/refre/js/layout.js" type="text/javascript"></script>

	  <!-- Global styles END -->
	  <link  href="/static/bootstrap/css/bootstrap.css" rel="stylesheet" >
	  <link href="/static/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
	  <%--<script src="/static/bootstrap/js/jquery-3.1.1.min.js"></script>--%>
  <%--<link href="/static/refre/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />--%>
	  <%--<script src="/static/refre/js/jquery-1.11.0.min.js"></script>--%>

	  <!-- Page level plugin styles START -->
	  <link href="/static/refre/css/owl.carousel.css" rel="stylesheet">
	  <link href="/static/refre/css/uniform.default.min.css" rel="stylesheet" type="text/css">
	  <link href="/static/refre/css/style.css" rel="stylesheet" type="text/css" media="all" />
	  <script type="text/javascript" src="/static/refre/js/memenu.js"></script>
	  <!-- Theme styles START -->
	  <link href="/static/refre/css/components.css" rel="stylesheet">
	  <link href="/static/refre/css/style-shop.css" rel="stylesheet" type="text/css">
	  <link href="/static/refre/css/style-responsive.css" rel="stylesheet">
	  <link href="/static/refre/css/red.css" rel="stylesheet" id="style-color">
	  <link href="/static/refre/css/custom.css" rel="stylesheet">
	  <script src="/static/refre/js/dengji.js"></script>

 
  <body>
  <div class="main" >

	  <div class="container">

		  <!-- BEGIN SIDEBAR & CONTENT -->
		  <div class="row margin-bottom-40">
			  <!-- BEGIN CONTENT -->
			  <div class="col-md-12 col-sm-12">
				  <h1>结账</h1>
				  <!-- BEGIN CHECKOUT PAGE -->
				  <div class="panel-group checkout-page accordion scrollable" id="checkout-page">

					  <!-- BEGIN SHIPPING METHOD -->
					  <div id="shipping-method" class="panel panel-default">
						  <div class="panel-heading">
							  <h2 class="panel-title">
								  <a data-toggle="collapse" data-parent="#checkout-page" href="#shipping-method-content" class="accordion-toggle">
									  第一步 : 旅客登记
								  </a>
							  </h2>
						  </div>
						  <div id="shipping-method-content" class="panel-collapse collapse in">
							  <div class="panel-body row">
								  <div class="col-md-12">
								  <jsp:include page="register.jsp"/>
								  <button class="btn btn-primary  pull-right" type="submit" id="button-shipping-method" data-toggle="collapse" data-parent="#checkout-page" data-target="#payment-method-content">继续</button>
								  </div>
							  </div>
						  </div>
					  </div>
					  <!-- END SHIPPING METHOD -->

					  <!-- BEGIN PAYMENT METHOD -->
					  <div id="payment-method" class="panel panel-default">
						  <div class="panel-heading">
							  <h2 class="panel-title">
								  <a data-toggle="collapse" onclick="allroomfunction()" data-parent="#checkout-page" href="#payment-method-content" class="accordion-toggle">
									  第二步: 安排房间
								  </a>
							  </h2>
						  </div>
						  <div id="payment-method-content" class="panel-collapse collapse">
							  <div class="panel-body row">
								  <jsp:include page="arrangeroom.jsp"/>
								  <button class="btn btn-primary  pull-right" type="submit" id="button-shipping-method2" data-toggle="collapse" data-parent="#checkout-page" data-target="#confirm-content">继续</button>
							  </div>
						  </div>
					  </div>
					  <!-- END PAYMENT METHOD -->

					  <!-- BEGIN CONFIRM -->
					  <div id="confirm" class="panel panel-default">
						  <div class="panel-heading">
							  <h2 class="panel-title">
								  <a data-toggle="collapse" data-parent="#checkout-page" href="#confirm-content" class="accordion-toggle">
									  第三步: 确定订单
								  </a>
							  </h2>
						  </div>
						  <div id="confirm-content" class="panel-collapse collapse">
							  <div class="panel-body row" style="margin-left: 10px">
								  <div class="col-md-12 clearfix">
									  <div class="table-wrapper-responsive">
										  <div class="dgvone">
											  <table class="table table-condensed table-bordered table-striped" id="tableid">
												  <thead class="theadone">
												  <tr>
													  <th rowspan="2" style="width: auto">选择</th>
													  <th rowspan="2" style="width: auto">商品名称</th>
													  <th rowspan="2" style="width: auto">商品类别</th>
													  <th rowspan="2" style="width: auto">计量单位</th>
													  <th rowspan="2" style="width: auto">销售价格</th>
													  <th rowspan="2" style="width: auto">数量</th>
												  </thead>
												  <tbody id="tbody333">

												  </tbody>
											  </table>
										  </div>
									  </div>
									  <div class="checkout-total-block">
										  <ul>
											  <li>
												  <em>房间费</em>
												  <strong class="price" id="roomCharge">0.00</strong>
											  </li>
											  <li>
												  <em>押金</em>
												  <strong class="price" id="deposit">0.00</strong>
											  </li>
											  <li>
												  <em>商品费</em>
												  <strong class="price" id="commodityCost">0.00</strong>
											  </li>
											  <li class="checkout-total-price">
												  <em>总额</em>
												  <strong class="price" id="totalAmount">0.00</strong>
											  </li>
										  </ul>
									  </div>
									  <div class="clearfix"></div>
									  <button class="btn btn-primary pull-right" type="button" onclick="tijiaoroom()" id="button-confirm">确定订单</button>
									  <button class="btn btn-default pull-right" type="button" id="button33"
											  href="#comm" data-toggle="modal"  onclick="selectCommodity()">选择商品</button>
									  <button class="btn btn-default pull-right" type="button" id="button544"
											  onclick="removeCommodity()">移除商品</button>
									  <button type="button" class="btn btn-default pull-left margin-right-20">取消</button>
								  </div>
							  </div>
						  </div>
					  </div>
					  <!-- END CONFIRM -->
				  </div>
				  <!-- END CHECKOUT PAGE -->
			  </div>
			  <!-- END CONTENT -->
		  </div>
		  <!-- END SIDEBAR & CONTENT -->
	  </div>

  </div>
  <div class="modal hide fade" id="comm" style="text-align: center;">
	  <div class="span5" style="width:98%;height:480px; overflow-x:auto;">
		  <div class="row-fluid">
			  <div class="span6">
				  <label class="labelroomnumber">商品名称：</label>
				  <input id="commodityName" class="textone" style="width:40%; border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:27px;" type="text" placeholder="请输入关键字" value="${txtname}">
				  <div class="input-append">
					  <button onclick="selectCommodity()" type="button" class="btn-success textone" style="margin-left:-4px;height:27px;"><li class="icon-search icon-white"></li>搜索</button>
				  </div>
			  </div>
			  <div class="span3">
				  <select id="selectCboId" style="margin-top:10px;width:100%;" onchange=selectCommodity()>
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
					  <th style="width: auto">选择</th>
					  <th style="width: auto">商品名称</th>
					  <th style="width: auto">商品类别</th>
					  <th style="width: auto">计量单位</th>
					  <th style="width: auto">销售价格</th>
					  <th style="width:20%">数量</th>
				  </tr>
				  </thead>
				  <tbody id="tbodyComm">

				  </tbody>
			  </table>
		  </div>
	  </div>
  </div>

  <!-- END PAGE LEVEL JAVASCRIPTS -->
<script type="text/javascript">
    $.mergeJsonObject = function (jsonbject1, jsonbject2) {
        var resultJsonObject={};
        for(var attr in jsonbject1){
            resultJsonObject[attr]=jsonbject1[attr];
        }
        for(var attr in jsonbject2){
            resultJsonObject[attr]=jsonbject2[attr];
        }
        return resultJsonObject;
    };
</script>

  </body>
</html>
