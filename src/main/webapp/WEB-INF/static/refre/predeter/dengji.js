Array.prototype.unique = function (isStrict) {
    if (this.length < 2)
        return [this[0]] || [];
    var tempObj = {}, newArr = [];
    for (var i = 0; i < this.length; i++) {
        var v = this[i];
        var condition = isStrict ? (typeof tempObj[v] != typeof v) : false;
        if ((typeof tempObj[v] == "undefined") || condition) {
            tempObj[v] = v;
            newArr.push(v);
        }
    }
    return newArr;
};
Array.prototype.indexOf = function(val) {
    for (var i = 0; i < this.length; i++) {
        if (this[i] == val) return i;
    }
    return -1;
};
Array.prototype.remove = function(val) {
    var index = this.indexOf(val);
    if (index > -1) {
        this.splice(index, 1);
    }
};
function changeRoomMoney(){
    var rentOutTypeID=$("#rentOutTypeID").val();
    var stayNumber=$("#stayNumberId").val();
    if(stayNumber==''){
        stayNumber=0;
    }
    if(rentOutTypeID==25){
        var money=parseFloat($("#moneyTime").val());
        roomTotal(stayNumber,money);
    }else if(rentOutTypeID==26){
        var money=parseFloat($("#moneyDay").val());
        roomTotal(stayNumber,money);
    }
}

function roomMoney(moneyDay,moneyTime){
    $("#moneyDay").val(moneyDay);
    $("#moneyTime").val(moneyTime);
}

function roomTotal(num,money){
    var roomTotal=parseFloat(parseInt(num)*parseFloat(money));
    var deposit= parseFloat($("#deposit").text());
    var commodityCost= parseFloat($("#commodityCost").text());
    $("#roomCharge").text(roomTotal);
    totalPrice(roomTotal,deposit,commodityCost);
}

function deposit(){
    var money=parseInt($("#depositId").val());
    var roomCharge= parseFloat($("#roomCharge").text());
    var commodityCost= parseFloat($("#commodityCost").text());
    var number=$("#roomIds").val().split(",");
    number.remove("");
    money=money*parseInt(number.length);
    $("#deposit").text(money);
    totalPrice(roomCharge,money,commodityCost);
}

function commodityCost(money){
    var roomCharge= parseFloat($("#roomCharge").text());
    var deposit= parseFloat($("#deposit").text());
    $("#commodityCost").text(money);
    totalPrice(roomCharge,deposit,money);
}

//计算总价
function totalPrice(roomCharge,deposit,commodityCost){
    var totalPrices= parseFloat(roomCharge)+parseFloat(deposit)+parseFloat(commodityCost);
    $("#totalAmount").text(totalPrices);
}

Array.prototype.removeByValue = function(val) {
    for(var i=0; i<this.length; i++) {
        if(this[i] == val) {
            this.splice(i, 1);
            break;
        }
    }
}

function removeCommodity(){
    var chk_value=[];
    $('input[name="commodityIds"]:checked').each(function(){
        chk_value.push($(this).val());
    });

    if(chk_value!=""){
        var ids=$("#commodityIds").val();
        var commodityNumber=$("#commodityNumber").val();

        var commNumber2=JSON.parse(commodityNumber);

        var array1= ids.split(",");

        var array3=ids.split(",");

        for(var i=0,l=chk_value.length;i<l;i++) {
            for (var j=0,k=array1.length;j<k;j++) {
                for (var item in commNumber2[j]) {
                    if(item==chk_value[i]){
                        delete commNumber2[j];
                        break;
                    }
                }
            }
            array1.remove(chk_value[i])
        }

        var sssx =JSON.stringify(commNumber2);

        var array2 = array1.sort().unique();
        array2.remove('');


        $("#commodityNumber").val(sssx);
        $("#commodityIds").val(array2.join(','));

        $.ajax({
            cache:false,
            type: "POST",
            url: getRootPath()+'/StayRegister/consumptionByIds.do',
            data:"ids="+array2,
            async:false,
            dataType:"json",
            success: function (data) {
                var tr='';
                var total=0;
                if(data!=null) {
                    for (var i = 0, l = data.length; i < l; i++) {
                        var number2=0;
                        for (var j = 0, k = array3.length; j < k; j++) {
                            for(var item in commNumber2[j]){
                                if(item==data[i].commodityId){
                                    number2=commNumber2[j][item];
                                }
                            }
                        }
                        tr += '<tr>\n' +
                            '  <td><input type="checkbox" name="commodityIds" value="' + data[i].commodityId + '"></td>\n' +
                            '  <td>' + data[i].commodityName + '</td>\n' +
                            '  <td>' + data[i].commodityType + '</td>\n' +
                            '  <td>' + data[i].uOM + '</td>\n' +
                            '  <td>' + data[i].salePrice + '</td>\n' +
                            '  <td style="width:20%">' +number2 + '</td>\n' +
                            '  </tr>';
                        total+=parseInt(number2)*parseFloat(data[i].salePrice);
                    }
                }
                commodityCost(total);
                $("#tbody333").html(tr);
            },
            error: function(data) {
            }
        });

    }else{
        alert("你还没有选择商品哦！");
    }
}



function confirmFunction(){
    var chk_value=[];
    var table=document.getElementById("tbodyComm");
    var selectedIndex="";
    var Number=[];
    var i=0;
    $('input[name="CommIds"]:checked').each(function(){
        chk_value.push($(this).val());
        selectedIndex=this.parentNode.parentNode.rowIndex;
        Number.push(table.rows[selectedIndex-1].cells[5].childNodes[0].value);
        if(table.rows[selectedIndex-1].cells[5].childNodes[0].value==""){
            i=1;
        }
    });
    if(Number=="" || Number==null){
        return false;
    }else if(i==1){
        return false;
    }
    for (var j=0;j<Number.length ;j++ )
    {
        if(!parseInt(Number[j])){
            alert("你输入的数量不是正整数。请仔细检查！");
            return false;
        }else{
            if(Number[j].length>8){
                alert("你输入的数量太大了，请注意控制为 8 位长度");
                return false;
            }
        }
    }
    if(chk_value!=""){


        var ids=$("#commodityIds").val();
        var array1= ids.split(",");

        var cNumber=$("#commodityNumber").val();
        var commNumber1='';
        if(cNumber!=''){
            commNumber1=JSON.parse(cNumber)
        }

        array1.remove('');
        var cnr='[';
        for(var i=0,l=chk_value.length;i<l;i++) {
            cnr+='{"'+chk_value[i]+'":'+Number[i]+'},';
        }
        cnr=cnr.substring(0,cnr.length-1)
        cnr+=']';
        var commNumber2=JSON.parse(cnr);
        var xxx= $.mergeJsonObject(commNumber1,commNumber2);
        var Numbers= JSON.stringify(xxx);

        for(var i=0,l=chk_value.length;i<l;i++) {
            array1.push(chk_value[i]);
        }

        var array2 = array1.sort().unique();
        array2.remove('');

        $("#commodityNumber").val(Numbers);
        $("#commodityIds").val(array2.join(','));

        $.ajax({
            cache: false,
            type: "POST",
            url: getRootPath() + '/StayRegister/consumptionByIds.do',
            data: "ids=" + array2,
            async: false,
            dataType: "json",
            success: function (data) {
                var tr = '';
                var total=0;
                if(data!=null) {
                    for (var i = 0, l = data.length; i < l; i++) {
                        tr += '<tr>\n' +
                            '  <td><input type="checkbox" name="commodityIds" value="' + data[i].commodityId + '"></td>\n' +
                            '  <td>' + data[i].commodityName + '</td>\n' +
                            '  <td>' + data[i].commodityType + '</td>\n' +
                            '  <td>' + data[i].uOM + '</td>\n' +
                            '  <td>' + data[i].salePrice + '</td>\n' +
                            '  <td style="width:20%">' + Number[i] + '</td>\n' +
                            '  </tr>';
                        total+=parseInt(commNumber2[i][data[i].commodityId])*parseFloat(data[i].salePrice);
                    }
                }
                commodityCost(total);
                $("#tbody333").html(tr);
            },
            error: function (data) {
            }
        })
    }else{
        alert("请选择这个商品");
    }
}

function selectCommodity(){

    var name=document.getElementById("commodityName").value;
    var cboid=document.getElementById("selectCboId").value;
    $.ajax({
        cache:false,
        type: "POST",
        url: getRootPath()+'/StayRegister/tianJiaShangPin.do',
        data:"commodityName="+name+"&commodityTypeID="+cboid,
        async:false,
        dataType:"json",
        success: function (data) {
            var tr='';
            if(data!=null) {
                for (var i = 0, l = data.length; i < l; i++) {
                    tr += ' <tr>\n' +
                        '  <td><input type="checkbox" name="CommIds" value="' + data[i].commodityId + '"></td>\n' +
                        '  <td>' + data[i].commodityName + '</td>\n' +
                        '  <td>' + data[i].commodityType + '</td>\n' +
                        '  <td>' + data[i].uOM + '</td>\n' +
                        '  <td>' + data[i].salePrice + '</td>\n' +
                        '  <td style="width:20%">' +
                        '<input class="number2" value="1" type="text" style="width:50%;" >\n' +
                        '</td>\n' +
                        '  </tr>';
                }
            }
            $("#tbodyComm").html(tr);
        },
        error: function(data) {
            alert("访问错误")
        }
    });
}
