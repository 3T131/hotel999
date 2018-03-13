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



function addfunction(){
    parent.document.getElementById('Mainid').src='${ctx}/Commodity/toadd.do';
}

function updatefunction(){
    var chk_value=[];
    $('input[name="commodityId"]:checked').each(function(){
        chk_value.push($(this).val());
    });
    if(chk_value!=""){
        if(chk_value.toString().indexOf(",")>0){
            alert("修改只能选择一条");
        }else{
            parent.document.getElementById("Mainid").src=getRootPath()+'/Commodity/toupdate.do?commodityId='+chk_value;
        }
    }else{
        alert("请选择一条数据进行修改");
    }
}

function deletefunction(){
    var chk_value=[];
    $('input[name="commodityId"]:checked').each(function(){
        chk_value.push($(this).val());
    });
    if(chk_value!=""){
        var flag=window.confirm("注意：您确定要永久删除该信息吗?");
        if(flag){
            parent.document.getElementById("Mainid").src=getRootPath()+'/Commodity/delete.do?commodityId='+chk_value;
        }
    }else{
        alert("请选择一条或多条数据进行删除");
    }

}


function selectChange(){
    var commodityTypeID=document.getElementById("selectCboId").value;
    parent.document.getElementById('Mainid').src=getRootPath()+'/Commodity/tolist.do?commodityTypeID='+commodityTypeID;
}




function selectFunction(){
    var txtname=document.getElementById("txtnameid").value;
    var commodityTypeID=document.getElementById("selectCboId").value;
    parent.document.getElementById('Mainid').src=getRootPath()+'/Commodity/tolist.do?commodityName='+commodityName+'&txtname='+txtname;
}


function newaddfunction(){
    var txtname=document.getElementById("newtxtnameid").value;
    parent.document.getElementById('Mainid').src=getRootPath()+'/Commodity/newadd.do?attributeDetailsName='+txtname;
}

function newdeletefunction(){
    var chk_value=[];
    $('input[name="newid"]:checked').each(function(){
        chk_value.push($(this).val());
    });
    if(chk_value!=""){
        var flag=window.confirm("注意：您确定要永久删除该信息吗?");
        if(flag){
            parent.document.getElementById("Mainid").src=getRootPath()+'/Commodity/newdelete.do?attributedetailsId='+chk_value;
        }
    }else{
        alert("请选择一条或多条数据进行删除");
    }

}