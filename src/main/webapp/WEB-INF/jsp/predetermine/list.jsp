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
  <script type="text/javascript" src="/static/js/page.js"></script>
  <script type="text/javascript" src="/static/bootstrap/js/bootstrap.js"></script>
  <script type="text/javascript" src="/static/js/common.js"></script>
	  <script src="/static/js/predetermine/list.js"></script>
   <style>
   
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
    
    .dgvone{
      margin-top: 12px;
    }
    
    .roomnumberwidth{
      width:55%;
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
  
  </style>
  
 
  <body>
  <div class="container" style="height:630px">
  
    <input type="hidden" id="oneId">     <!-- 房间ID -->
    <input type="hidden" id="twoId">
      <form id="form22" action="/Predetermine/select.do"  method="post">
          <input name="leiXin" id="leiXin" type="hidden" value="${leiXin}">
          <input name="currentPage" id="currentPage" type="hidden" value="1">
    <div class="span4">
	    <div class="row-fluid">
		       <label class="labelroomnumber">房间号：</label>
			   <input id="txtnameid" name="roomNumber" class="textone roomnumberwidth" style="border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;" type="text" placeholder="请输入关键字" value="${predetermine.roomNumber}">
			   <div class="input-append">  
			      <button onclick="selectOne()" class="btn-success textone" style="margin-left:-4px;height:26px;">
					  <li class="icon-search icon-white"></li>搜索</button>
			   </div>
	    </div>
    </div>
    <div class="span2">
      <select id="stateId" name="predetermineStateID" style="width:80%;height:26px; float:left;margin-top:12px;" onchange="selectTwo()">
        <c:forEach items="${listOne}" var="item">
          <option value="${item.attributeDetailsId}" <c:if test="${item.attributeDetailsId==predetermine.predetermineStateID}">selected="selected"</c:if>>
            ${item.attributeDetailsName}
          </option>
        </c:forEach> 
	  </select>
    </div>
    <div class="span6">
      <div class="row-fluid">
       <div class="span3">
         <button class="btn btn-info btn-small textone" type="button" onclick="addfunction()"><li class="icon-plus icon-white"></li>新增</button>
       </div>
       <div class="span3">
         <button class="btn btn-warning btn-small textone" type="button" onclick="updatefunction()"><li class="icon-pencil icon-white"></li>修改</button>
       </div>
          <c:if test="${userSession.targetTypeID==55}">
       <div class="span3">
         <button class="btn btn-danger btn-small textone" type="button" onclick="deletefunction()"><li class="icon-remove icon-white"></li>删除</button>
       </div>
          </c:if>
        <div class="span3">
         <button class="btn btn-info btn-small textone" type="button" onclick="arrangeRoom()"><li class="icon-plus icon-white"></li>安排房间</button>
       </div>
      </div>
    </div>
    <br>
    <div class="span12">
    <div class="tabbable" >  <!-- style="border:1px solid red"  -->
      <ul class="nav nav-tabs">
        <li class="active" id="tabOneId" ><a id="leixin1" href="#tab1" onclick="gaiBian(1)" data-toggle="tab">接待对象</a></li>
        <li ><a href="#tab2" id="leixin2" onclick="gaiBian(2)" data-toggle="tab">旅客信息</a></li>
      </ul>
      
      <div class="tab-content">
        <div class="tab-pane active" id="tab1">
          <div class="row-fluid">
              <input type="hidden" id="rId" name="receiveTargetId" value="${receiveTarget.receiveTargetId}" />
                 <div class="span2">
                     <label>负责人名字：</label>
                     <input id="principalId" class="widthone" name="principal" value="${receiveTarget.principal}" style="height: 25px;"  type="text" readonly="readonly">
                 </div>
                  <div class="span2">
                  <label>员工编号：</label>
			      <input id="teamCodeId" class="widthone"name="teamCode" value="${receiveTarget.teamCode}" style="height: 25px;"  type="text" readonly="readonly">
             </div>

              <div class="span2">
                  <label>联系电话：</label>
			      <input id="contactPhoneNUmberId" class="widthone"name="contactPhoneNUmber" value="${receiveTarget.contactPhoneNUmber}" style="height: 25px;"  type="text" readonly="readonly">
             </div>
             <div class="span2" style="margin-top:23px;text-align: center;">
                <a href="#duixiang" data-toggle="modal" class="btn btn-info btn-small" onclick="selectTarget()"><li class="icon-plus icon-white"></li>选择对象</a>
             </div>
          </div>
        </div>
        <div class="tab-pane" id="tab2">
          <div class="row-fluid">
              <input type="hidden" value="${passenger.pId}" name="pId" id="pId"/>
             <div class="span2">
                  <label>姓名：</label>
			      <input id="nameId" class="widthone" value="${passenger.name }" name="name"
                         style="height: 25px;" type="text" readonly="readonly">
             </div>
              <div class="span2">
                 <label>证件类型：</label>
                 <input id="papersTypeId" class="widthone" value="${passenger.papersName}"
                        name="papersName" style="height: 25px;" type="text" readonly="readonly">
             </div>
              <div class="span2">
                  <label>证件号：</label>
			      <input id="papersNumberId" class="widthone"value="${passenger.papersNumber}"
                         name="papersNumber" style="height: 25px;"  type="text" readonly="readonly">
             </div>
               <div class="span2">
                  <label>联系电话：</label>
			      <input id="contactPhoneNumber"  value="${passenger.phoneNumber}"
                         name="phoneNumber" class="widthone" style="height: 25px;"  type="text" readonly="readonly">
             </div>
              <div class="span2" style="margin-top:23px;;text-align: center;">
                <a href="#lvke" data-toggle="modal" class="btn btn-info btn-small"
                   onclick="souSuo()"><li class="icon-plus icon-white"></li>选择旅客</a>
             </div>
          </div>

        </div>

      </div>

    </div>

  </div>
      </form>
  
    <div class="span12">
    <div class="dgvone">
       <table class="table table-condensed table-bordered table-striped" id="tableid3">
	      <thead class="theadone">
	        <tr>
	          <th >选择</th>
	          <th >房间号</th>
	          <th >客房等级</th>
	          <th >接待对象</th>
	          <th >旅客姓名</th>
	          <th >抵达时间</th>
	          <th >押金</th>
	          <th >预定天数</th>
	          <th >联系电话</th>
	          <th >预定状态</th>
	        </tr>
	      </thead>
	      <tbody id="tbody">
	        <c:forEach items="${list.datas}" var="item">
		        <c:if test="${item.remind==0}" >
		           <tr>
				          <td><input type="checkbox" name="id" value="${item.predetermineId}"></td>
				          <td>${item.roomNumber}</td>
				          <td>${item.roomGuestRoomLevelName}</td>
				          <td>${item.receivePrincipal}</td>
				          <td>${item.passengerName}</td>
				          <td><fmt:formatDate value="${item.arriveTime}" pattern="yyyy-MM-dd"/> </td>
				          <td>${item.deposit}</td>
				          <td>${item.predetermineDay}</td>
				          <td>${item.passengerContactPhoneNumber}</td>
				          <td>${item.predetermineStateName}</td>

					   <%----------------------%>

		           </tr>
		        </c:if>
		        <c:if test="${item.remind==1}" >
		           <tr style="color:red;">
				          <td><input type="checkbox" name="id" value="${item.predetermineId}"></td>
				          <td>${item.roomNumber}</td>
				          <td>${item.roomGuestRoomLevelName}</td>
				          <td>${item.receivePrincipal}</td>
				          <td>${item.passengerName}</td>
				          <td><fmt:formatDate value="${item.arriveTime}" pattern="yyyy-MM-dd"/> </td>
				          <td>${item.deposit}</td>
				          <td>${item.predetermineDay}</td>
				          <td>${item.passengerContactPhoneNumber}</td>
				          <td>${item.predetermineStateName}</td>
		           </tr>
		        </c:if>
	        </c:forEach>
	      </tbody>
	    </table>
    </div>
    </div>
    
    
    
    <div class="modal hide fade" id="duixiang" style="text-align: center;">
      <div class="span5" style="width:98%;height:480px; overflow-x:auto;">
         <div class="row-fluid">
            <div class="span8">
		      <label class="labelroomnumber">团队名称：</label>
			   <input id="txtnameidTwo" name="name" class="textone" style="width:60%; border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;"
                      type="text" placeholder="请输入关键字" value="">
			   <div class="input-append">  
			      <button class="btn-success textone" style="margin-left:-4px;height:26px;" onclick="selectTarget()">
                      <li class="icon-search icon-white"></li>搜索</button>
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
                <th rowspan="2">员工名字</th>
	          <th rowspan="2">员工编号</th>
	          <th rowspan="2">电话号码</th>
	        </tr>
	      </thead>
	      <tbody id="tbodyTwo">

	      </tbody>
	    </table>
    </div>
    </div>
    </div>
    
    <div class="modal hide fade" id="lvke" style="text-align: center;">
      <div class="span5" style="width:98%;height:480px; overflow-x:auto;">
         <div class="row-fluid">
		   <div class="span8">
		      <label class="labelroomnumber">旅客姓名：</label>
			   <input id="txtnameidThree" name="passengerName" class="textone" style="width:60%; border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;" type="text" placeholder="请输入关键字" value="">
			   <div class="input-append">  
			      <button type="submit" class="btn-success textone"
						  style="margin-left:-4px;height:26px;" onclick="souSuo()">
					  <li class="icon-search icon-white"></li>搜索</button>
			   </div>
	       </div>
	       <div class="span4">
	          <button class="btn btn-info btn-small textone" type="button" onclick="confirmfunction()" data-dismiss="modal"><li class="icon-plus icon-white"></li>确定选择</button>
	       </div>
	    </div>
	     <div class="dgvone" style="width:93%;">
       <table class="table table-condensed table-bordered table-striped" id="tableid">
	      <thead class="theadone">
	        <tr>
	          <th >选择</th>
	          <th >姓名</th>
	          <th >性别</th>
	          <th >证件类型</th>
	          <th >证件号码</th>
                <th>联系电话</th>
	        </tr>
	      </thead>
	      <tbody id="tbodyThree">

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
  
 
 
 
 
 <script type="text/javascript">

     if(${leiXin==1}){
         $('#leixin1').tab('show');
     }else if(${leiXin==2}){
         $('#leixin2').tab('show');
     }

  /* 分页要用的 */
  $(".tcdPageCode").createPage({
     pageCount:${list.totalPage},
     current:${list.pageNo},
     backFn:function(p){
     var txtname=document.getElementById("txtnameid").value;
     var state=document.getElementById("stateId").value;
     $("#currentPage").val(p);
        $("#form22").submit();
     }
   });


  
 </script>
   
  </body>
</html>
