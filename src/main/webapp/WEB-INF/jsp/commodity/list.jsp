<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
  <link rel="stylesheet" href="/static/css/amazeui.min.css" type="text/css"></link>
  <script src="/static/bootstrap/js/jquery-3.1.1.min.js"></script>
  <script src="/static/bootstrap/js/bootstrap.js"></script>
  <script type="text/javascript" src="/static/js/page.js"></script>
  <script type="text/javascript" src="/static/js/layer/layer.js"></script>
  <script type="text/javascript" src="/static/js/amazeui.min.js"></script>
	  <script src="/static/js/commodity/list.js"></script>
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
    
    .textone{
    margin-top:12px;
    }
    
    .rightOne{
    margin-right: 50px;
    font-size:16px;
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
    

  
  </style>
  
  </head>
 
  <body>
  <div class="container" >
	  <div class="row-fluid">
    <div class="span9">
		<%--<form:form id="form11" cssClass="row-fluid" action="${ctx}/Commodity/tolist.do" method="post" modelAttribute="commodity">--%>
		    <form   id="form11" class="row-fluid" action="${ctx}/Commodity/tolist.do" method="post" style="float: left;">
				<input id="currentPage" name="currentPage" type="hidden" value="${commodityPager.pageNo}"/>
				<div class="span3">
					<select id="selectCboId" name="commodityTypeID" class="dgvone" style="width:80%;" onchange="selectChange()">
						<option value="0" >全部</option>
						<c:forEach items="${listOne}" var="item">
							<option value="${item.attributeDetailsId}" <c:if test="${item.attributeDetailsId==commodity.commodityTypeID}">selected="selected"</c:if>>
									${item.attributeDetailsName}
							</option>
						</c:forEach>
					</select>
					<button id="" type="button" class="textone"  data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0, width: 300, height: 600}"><li class="icon-plus"></li></button>
				</div>
				<div class="span6">
				<label class="labelroomnumber" style="font-size:16px;">商品名：</label>
			   			<input  type="text" name="commodityName"  class="textone "
					  style="border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:27px;"
					  placeholder="请输入关键字" value="${commodity.commodityName}">
			   		<div class="input-append">
			      		<input type="submit"  class="btn btn-success  btn-small textone" style="margin-left:-5px;height:27px;">
					  <li class="icon-search icon-white"></li>搜索</input>
			   		</div>
				</div>
				<%--</form:form>--%>
			</form>
    </div>
    <div class="span3">
      <div class="row-fluid">
       <div class="span3">
         <button class="btn btn-info btn-small textone" type="button" onclick="location='/Commodity/toadd.do'"><li class="icon-plus icon-white"></li>新增</button>
       </div>
       <div class="span3">
         <button class="btn btn-warning btn-small textone" type="button" onclick="updatefunction()"><li class="icon-pencil icon-white"></li>修改</button>
       </div>
           <c:if test="${userSession.targetTypeID==55}">
       <div class="span3">
         <button class="btn btn-danger btn-small textone" type="button" onclick="deletefunction()"><li class="icon-remove icon-white"></li>删除</button>
       </div>
		   </c:if>
      </div>
    </div>
	  </div>
    <br>
    <div class="dgvone">
       <table class="table table-condensed table-bordered table-striped" id="tableid1">
	      <thead class="theadone">
	        <tr>
	          <th rowspan="2">选择</th>
	          <th rowspan="2">商品名称</th>
	          <th rowspan="2">商品类别</th>
	          <th rowspan="2">计量单位</th>
	          <th rowspan="2">销售价格</th>
	      </thead>
	      <tbody id="tbody1">
	        <c:forEach items="${commodityPager.datas}" var="item">
		        <tr>
		          <td><input type="checkbox" name="commodityId" value="${item.commodityId}"></td>
		          <td>${item.commodityName}</td>
		          <td>${item.commodityType}</td>
		          <td>${item.uOM}</td>
		          <td>${item.salePrice}</td>
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
  
 
 <div class="am-modal am-modal-no-btn" tabindex="-1" id="doc-modal-1">
		  <div style="background:#fff" class="am-modal-dialog">
		    <div style="background:#0e90d2; color: #fff" class="am-modal-hd">商品类别操作
		      <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
		    </div>
		    <!-- 内容 -->
		  <div>
<div class="container" >
  <div class="span3">
		    <form action="${ctx}/Commodity/newadd.do" method="post" style="float: left;">
				<div class="row-fluid">
					<label id="bie" class="labelroomnumber" style="margin-left: -20px; font-size: 15px;">商品类别：</label>
			   		<input id="newtxtnameid" name="attributeDetailsName" type="text" placeholder="请输入要新增的商品名称" style="width:120%;height: 26px;margin-top: 11px;">
				</div>
				<div class="row-fluid">
					<button style="margin-top:-23px;" class="btn btn-info btn-small" type="submit" ><li class="icon-plus icon-white"></li>新增</button>
					<button style="margin-top:-23px;" class="btn btn-danger btn-small" type="button" onclick="newdeletefunction()"><li class="icon-remove icon-white"></li>删除</button>
				</div>
		    </form>
    <br>
    <div class="dgvone" style="width:250px;height:403px;overflow:scroll;">
       <table class="table table-condensed table-bordered table-striped" id="tableid" style="width: 250px;height: 20px;">
	      <thead class="theadone">
	        <tr>
	          <th rowspan="2">选择</th>
	          <th rowspan="2">商品类别</th>
	      </thead>
	      <tbody id="tbody">
	        <c:forEach items="${listOne}" var="item">
		        <tr>
		          <td><input type="checkbox" name="newid" value="${item.attributeDetailsId}"></td>
		          <td>${item.attributeDetailsName}</td>
		        </tr>
	        </c:forEach>
	      </tbody>
	    </table>
    </div>
  </div>
 
  <div/>   
          <!-- 内容 -->  
<div/>
</div>
<div/>

		  </div>
		  </div>
 </div>
  <script type="text/javascript">


      /* 分页要用的 */
      $(".tcdPageCode").createPage({
          pageCount:${commodityPager.totalPage},
          current:${commodityPager.pageNo},
          backFn:function(p){
              var c=document.getElementById("currentPage");
			  c.value=p;
			  var f=document.getElementById("form11");
              f.submit();
              <%--var txtname=document.getElementById("currentPage").value;--%>
      <%--var commodityTypeID=document.getElementById("selectCboId").value;--%>
      <%--location.href="${ctx}/Commodity/tolist.do?currentPage="+p+"&txtname="+txtname+"&commodityTypeID="+commodityTypeID;--%>
      }
      });
  </script>
  </body>
</html>
