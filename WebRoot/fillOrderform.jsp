<%@ page contentType="text/html;charset=gb2312"%>
<%	
	response.addHeader("Pragma","no-cache");
	response.addHeader("Cache-Control","no-cache");
	response.addDateHeader("Expires",0);	

    String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
	<head>
    	<base href="<%=basePath%>">    
    	<title>填写订单信息</title>	
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<script type="text/javascript" src="js/validateorderform.js"></script>
  	</head>  
 	<body>
    	<center>
    	<table border="0" cellpadding="0" cellspacing="0">
			<tr><td><img src="images/top.jpg" width="790" height="149"></td></tr>
			<tr height="54"><td background="images/car_m.jpg" style="padding-left:15;padding-top:20"><b>填写订单信息</b></td></tr>
		</table>
		
    	<form action="createorderform" name="orderform" method="post">
    	<input type="hidden" name="buygoodsids" value="${requestScope.buygoodsids}">
    	<input type="hidden" name="buygoodsnum" value="${requestScope.buygoodsnum}">
    	<input type="hidden" name="goodsprices" value="${param.goodsprices}">
    	<table border="1" bordercolor="#F2F3F5" width="790" cellpadding="3" cellspacing="0" rules="none">
    		<tr height="25" bgcolor="#F2F3F5"><td colspan="3">收货人信息</td></tr>
    		<tr bgcolor="white">
    			<td width="20%">收 货 人：</td>
    			<td colspan="2"><input type="text" name="getter" size="30" onpropertychange="gettermessage.innerHTML=''">&nbsp;<b><span id="gettermessage" style="color:red"></span></b></td>
    		</tr>
    		<tr bgcolor="white">
    			<td>详细地址：</td>
    			<td colspan="2"><input type="text" name="address" size="60" onpropertychange="addressmessage.innerHTML=''">&nbsp;<b><span id="addressmessage" style="color:red"></span></b></td>
    		</tr>
    		<tr bgcolor="white">
    			<td>邮政编码：</td>
    			<td colspan="2"><input type="text" name="postalcode" size="30" onpropertychange="postalcodemessage.innerHTML=''">&nbsp;<b><span id="postalcodemessage" style="color:red"></span></b></td>
    		</tr>
    		<tr bgcolor="white">
    			<td>移动电话：</td>
    			<td><input type="text" name="telephone1" size="20" onpropertychange="linkphonemessage.innerHTML=''"></td>
    			<td>固定电话：<input type="text" name="telephone2" size="20" onpropertychange="linkphonemessage.innerHTML=''"> (如:0431-1234560)</td>
    		</tr>
    		<tr><td colspan="3"><b><span id="linkphonemessage" style="color:red"></span></b></td></tr>
    		<tr bgcolor="#F2F3F5"><td colspan="3">送货方式&nbsp;<b><span id="shipmentmessage" style="color:red"></span></b></td></tr>
    		<tr bgcolor="white">
    			<td><input type="radio" id="shipment1" name="shipment" value="1" onclick="clickshipment1();shipmentmessage.innerHTML=''">普通快递送货上门</td>
    			<td colspan="2" style="text-indent:20">
    				<div id="shipmenttimes" style="display:'none'">
    				送货时间：
    				<select name="shipmenttime" onchange="shipmentmessage.innerHTML=''">
    					<option value="">-请选择时间-</option>
    					<option value="1">不限时间</option>
    					<option value="2">3天内</option>
    					<option value="3">1周内</option>
    					<option value="4">1月内</option>    					
    				</select>
    				(支持货到付款)【运费：20元】
    				</div>
    			</td>
    		</tr>
    		<tr bgcolor="white"><td colspan="3"><input type="radio" id="shipment2" name="shipment" value="2" onclick="clickshipment23();shipmentmessage.innerHTML=''">普通邮递(不支持货到付款)【运费：30元】</td></tr>
    		<tr bgcolor="white"><td colspan="3"><input type="radio" id="shipment3" name="shipment" value="3" onclick="clickshipment23();shipmentmessage.innerHTML=''">邮政特快专递(不支持货到付款)【运费：40元】</td></tr>
    		<tr bgcolor="#F2F3F5"><td colspan="3">支付方式&nbsp;<b><span id="paymentmessage" style="color:red"></span></b></td></tr>
    		<tr bgcolor="white">
    			<td colspan="3">
    				<input type="radio" id="payment1" name="payment" value="1" onclick="clickpayment1();paymentmessage.innerHTML=''">网上支付<br>
    				<div id="networkpayments" style="padding-left:30;display:">
    				<input type="radio" id="networkpayment1" name="networkpayment" value="1" onclick="paymentmessage.innerHTML=''">工商银行<br>
    				<input type="radio" id="networkpayment2" name="networkpayment" value="2" onclick="paymentmessage.innerHTML=''">招商银行<br>
    				<input type="radio" id="networkpayment3" name="networkpayment" value="3" onclick="paymentmessage.innerHTML=''">建设银行<br>
    				<input type="radio" id="networkpayment4" name="networkpayment" value="4" onclick="paymentmessage.innerHTML=''">支付宝支付平台<br>
    				</div>
    			</td>
    		</tr>
    		<tr bgcolor="white"><td colspan="3"><input type="radio" id="payment2" name="payment" value="2" onclick="clickpayment234();paymentmessage.innerHTML=''">货到付款</td></tr>
    		<tr bgcolor="white"><td colspan="3"><input type="radio" id="payment3" name="payment" value="3" onclick="clickpayment234();paymentmessage.innerHTML=''">邮政汇款</td></tr>
    		<tr bgcolor="white"><td colspan="3"><input type="radio" id="payment4" name="payment" value="4" onclick="clickpayment234();paymentmessage.innerHTML=''">银行转帐</td></tr>
    		<tr><td colspan="3" align="center"><input type="button" name="createorderformb" value="生成订单" onclick="myorderformsubmit()"></td></tr>
    	</table>
    	</form>
    	<table border="0" cellpadding="0" cellspacing="0">
			<tr><td><img src="images/end.jpg" width="790" height="104"></td></tr>
		</table>
    	</center>
  	</body>
</html>
