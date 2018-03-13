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
  <script type="text/javascript" src="/static/js/common.js"></script>
	<script type="text/javascript" src="/static/js/stayregister/list.js"></script>


   <style>
	   body{
		   overflow: hidden;
	   }
   .container{
     margin-top: 10px;
     margin-left:0px;
     margin-right:0px;
     width:98%;
     font-size:15px;
   }
   .span12{
     width:98%;
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
    
    .table th,.table td{
       text-align: center; 
    }
    
    .theadone{
     background-color: #CCFF99;
    }
    
    .roomnumberwidth{
      width:60%;
    }
    
    .heigthone{
      height:25px;
    }
    .widthone{
     width:100%;
    }
    .widthtwo{
     width:100%;
    }
    
    .XuanXiangKa{
      .active
    }
  
  </style>
  
 
 
  <body>
  <div class="container" style="height:630px;">
    <input id="tuanDuiId" type="hidden" value="${tuanDui}">


	  <form  id="formList" action="${ctx}/StayRegister/tolist.do" style="display: flex;flex-direction: row;margin-left: 25px;align-items: center" method="post" >
		  <div class="form-group" style="margin-right: 20px;margin-top: 10px;">
			  <label style="float:left;padding-top: 4px">房间号：</label>
			  <input  id="roomId" name="roomNumber"  value="${stayRegister.roomNumber}"  type="text" placeholder="请输入关键字" style="height: 30px;">
		  </div>
		  <div class="form-group" style="margin-right: 20px;margin-top: 10px;" >
			  <label style="float:left;padding-top: 4px">旅客：</label>
			  <input id="passengerName" name="passengerName" value="${stayRegister.passengerName}" style="height: 30px;"  type="text" placeholder="请输入关键字" >
		  </div>
		  <div class="form-group" style="margin-right: 20px;margin-top: 10px;">
			  <select id="isBillID" name="isBillID" onchange="selectChange()" style="width: 100px">
				  <c:forEach items="${listOne}" var="item">
					  <option value="${item.attributeDetailsId}" <c:if test="${item.attributeDetailsId==stayRegister.isBillID}">selected="selected"</c:if>>
							  ${item.attributeDetailsName}
					  </option>
				  </c:forEach>
			  </select>
		  </div>
		  <input id="LvKeLeiXingId" type="hidden" name="LvKeLeiXingId" value="${stayRegister.lvKeLeiXingId}">
		  <input id="currentPage" type="hidden" name="currentPage" value="${pager.pageNo}">
		  <button  type="submit" class="btn btn-xs btn-success"></li>查询</button>
	  </form>
    <div class="span12">
    <div class="tabbable" >  <!-- style="border:1px solid red"  -->
      <ul class="nav nav-tabs">
        <li class="active"><a id="oneid" href="#tab1" data-toggle="tab" onclick="javascript:lvKefunction();">散客</a></li>
        <li ><a id="twoid" href="#tab2" data-toggle="tab"  onclick="javascript:teamfunction();">团队</a></li>
      </ul>


      <div class="tab-content">

        <div class="tab-pane active" id="tab1">
            <button class="btn btn-info btn-small" type="button" onclick="depositfunction()"><li class="icon-eye-open icon-white"></li>押金记录</button>
            <button class="btn btn-info btn-small" type="button" onclick="consumptionfunction()"><li class="icon-gift icon-white"></li>旅客消费</button>
            <button class="btn btn-info btn-small" type="button" onclick="updatefunction()"><li class="icon-refresh icon-white"></li>修改记录</button>
              <c:if test="${userSession.targetTypeID==55}">
			<button class="btn btn-info btn-small" type="button" onclick="deletefunction()"><li class="icon-refresh icon-white"></li>删除记录</button>
			  </c:if>
				  </div>
        <div class="tab-pane" id="tab2">
       

         <div class="span12" style="margin-left:0px;">
          <div class="row-fluid">
			  <button class="btn btn-info btn-small" type="button" onclick="depositfunction()"><li class="icon-eye-open icon-white"></li>押金记录</button>
			  <button class="btn btn-info btn-small" type="button" onclick="consumptionfunction()"><li class="icon-gift icon-white"></li>旅客消费</button>
			  <button class="btn btn-info btn-small" type="button" onclick="updatefunction()"><li class="icon-refresh icon-white"></li>修改记录</button>
			  <button class="btn btn-info btn-small" type="button" onclick="deletefunction()"><li class="icon-refresh icon-white"></li>删除记录</button>
          </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  
    <div class="span12">
    <div class="dgvone">
       <table class="table table-condensed table-bordered table-striped" id="tableid1">
	      <thead class="theadone">
	        <tr>
	          <th >选择</th>
	          <th >房间号</th>
	          <th style="width:12%;">接待员工编号</th>
				<th >登记时间</th>
				<th >房费</th>
				<th>旅客</th>
	          <th >换房次数</th>
	          <th >换房费</th>
	          <th >换房时间</th>
				<th style="width:13%;">操作</th>
	        </tr>
	      </thead>
	      <tbody id="tbody">
	        <c:forEach items="${pager.datas}" var="item">
		        <c:if test="${item.remind==1}">
			        <tr style="color: red;">
			          <td><input type="checkbox" name="id" value="${item.stayRegisterId}"></td>
			          <td>${item.room.roomNumber}</td>
			            <td style="width:12%;">${item.receiveTarget.principal}</td>
						<td><fmt:formatDate value="${item.registerTime}" pattern="yyyy-MM-dd"/></td>
						<td>${item.sumConst}</td>
						<td>
							<c:if test="${item.lvKeLeiXingId==55}">
								${item.passengerList[0].name}
							</c:if>
							<c:if test="${item.lvKeLeiXingId==56}">
								${item.passengerList[0].name}等..
							</c:if>
						</td>
			          <td>${item.changingRoomNumber}</td>
			          <td>${item.changRoomMoney}</td>
						<td><fmt:formatDate value="${item.changRoomTime}" pattern="yyyy-MM-dd"/> </td>
						<td>
							<c:if test="${item.isBillID!=69}">
								<button class="btn btn-info btn-small" type="button" onclick="payfunction(${item.stayRegisterId})"><li class="icon-heart icon-white"></li>结账</button>
							</c:if>
						</td>
			          <td hidden>${item.isBillID}</td>
						<td hidden>${item.dpId}</td>
			          <td hidden></td><%--${item.stayregisterdetailsId}--%>
			        </tr>
		        </c:if>
		        <c:if test="${item.remind==0}">
			        <tr >
			          <td><input type="checkbox" name="id" value="${item.stayRegisterId}"></td>
						<td>${item.room.roomNumber}</td>
			            <td>${item.receiveTarget.principal}</td>
						<td><fmt:formatDate value="${item.registerTime}" pattern="yyyy-MM-dd"/></td>
						<td>${item.sumConst}</td>
						<td>
							<c:if test="${item.lvKeLeiXingId==55}">
								${item.passengerList[0].name}
							</c:if>
							<c:if test="${item.lvKeLeiXingId==56}">
								${item.passengerList[0].name}等..
							</c:if></td>
			          <td>${item.changingRoomNumber}</td>
			          <td>${item.changRoomMoney}</td>
						<td><fmt:formatDate value="${item.changRoomTime}" pattern="yyyy-MM-dd"/> </td>
						<td>
							<c:if test="${item.isBillID==68}">
								<button class="btn btn-info btn-small" type="button" onclick="changroomfunction(${item.stayRegisterId})"><li class="icon-refresh icon-white"></li>换房</button>
								&nbsp;&nbsp;
								<button class="btn btn-info btn-small" type="button" onclick="payfunction(${item.stayRegisterId})"><li class="icon-heart icon-white"></li>结账</button>
							</c:if>
							<c:if test="${item.isBillID==73}">
								<button class="btn btn-info btn-small" type="button" onclick="changroomfunction(${item.stayRegisterId})"><li class="icon-refresh icon-white"></li>换房</button>
								&nbsp;&nbsp;
								<button class="btn btn-info btn-small" type="button" onclick="tuiFangfunction(${item.stayRegisterId})"><li class="icon-heart icon-white"></li>退房</button>
							</c:if>
						</td>
			          <td hidden>${item.isBillID}</td>
						<td hidden>${item.dpId}</td>
			          <td hidden></td>
			        </tr>
		        </c:if>
	        </c:forEach>
	      </tbody>
	    </table>
    </div>
    </div>
    
    
    
    
    <div class="modal hide fade" id="duixiang" style="text-align: center;">
      <div class="span5" style="width:98%;height:480px; ">
         <div class="row-fluid">
            <div class="span8">
		      <label class="labelroomnumber">团队名称：</label>
			   <input id="txtnameidTwo" name="txtname" class="textone" style="width:60%; border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;" type="text" placeholder="请输入关键字">
			   <div class="input-append">  
			      <button class="btn-success textone" style="margin-left:-4px;height:26px;" onclick="selectTarget()"><li class="icon-search icon-white"></li>搜索</button>
			   </div>
	       </div>
	       <div class="span4">
	          <button class="btn btn-info btn-small textone" type="button" onclick="confirmRarget()" data-dismiss="modal"><li class="icon-plus icon-white"></li>确定选择</button>
	       </div>
	    </div>
	     <div class="dgvone" style="width:93%;">
       <table class="table table-condensed table-bordered table-striped" id="tableid2">
	      <thead class="theadone">
	        <tr>
	          <th rowspan="2">选择</th>
	          <th rowspan="2">对象类别</th>
	          <th rowspan="2">团队名称</th>
	          <th rowspan="2">团队编号</th>
	          <th rowspan="2">负责人</th>
	          <th rowspan="2">登记时间</th>
	          <th rowspan="2">电话号码</th>
	        </tr>
	      </thead>
	      <tbody id="tbodyTwo">
	        <c:forEach items="" var="item">
		        <tr>
		          <td><input type="radio" id="idTwo" value=""></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		        </tr>
	        </c:forEach>
	      </tbody>
	    </table>
    </div>
    </div>
    </div>
    
    
    <div class="modal hide fade" id="lvke" style="text-align: center;">
      <div class="span5" style="width:98%;height:480px; ">
         <div class="row-fluid">
		   <div class="span8">
		      <label class="labelroomnumber">旅客姓名：</label>
			   <input name="txtname" class="textone" style="width:60%; border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;" type="text" placeholder="请输入关键字" value="${txtname}">
			   <div class="input-append">  
			      <button type="submit" class="btn-success textone" style="margin-left:-4px;height:26px;"><li class="icon-search icon-white"></li>搜索</button>
			   </div>
	       </div>
	       <div class="span4">
	          <button class="btn btn-info btn-small textone" type="button" onclick="addfunction()"><li class="icon-plus icon-white"></li>确定</button>
	       </div>
	    </div>
	     <div class="dgvone" style="width:93%;">
       <table class="table table-condensed table-bordered table-striped" id="tableid3">
	      <thead class="theadone">
	        <tr>
	          <th >选择</th>
	          <th >姓名</th>
	          <th >性别</th>
	          <th >证件类型</th>
	          <th >证件号码</th>
	        </tr>
	      </thead>
	      <tbody id="tbody2">
	        <c:forEach items="" var="item">
		        <tr>
		          <td><input type="checkbox" name="twoid" value="${item.id}"></td>
		          <td>${item.roomNumber}</td>
		          <td>${item.guestRoomLevelName}</td>
		          <td>${item.roomName}</td>
		          <td>${item.roomAmount}</td>
		        </tr>
	        </c:forEach>
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
  <script >
      if(${stayRegister.lvKeLeiXingId==55}){
          $('#oneid').tab('show');
      }else if(${stayRegister.lvKeLeiXingId==56}){
          $('#twoid').tab('show');
      }

          /* 分页要用的 */
          $(".tcdPageCode").createPage({
              pageCount:${pager.totalPage},//总页数
              current:${pager.pageNo},//当前页数
              backFn:function(p){  //p是组件传过来的参数，p是跳转的下一页是第几页

				  //访问路径的方式
                  document.getElementById("currentPage").value=p;
                  $("#formList").submit();

                  //--------------------------------------------------

              }
          });

      $('#duixiang').modal().css({
          'width': '72%',
          'margin-left': function () {
              return -($(this).width() / 2);
          }
      });
      $('#duixiang').modal('hide');

  </script>
  </body>

</html>
