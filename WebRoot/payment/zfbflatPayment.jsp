<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
	<head>
    	<base href="<%=basePath%>">    
    	<title>支付订单</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
  	</head>
    <body>
    	<center>
    	<div style="background:url(images/payfor_bk.jpg);width:720;height:583;">
   			<form action="" method="post">
   			<input type="hidden" name="orderid" value="${param.orderid}">
   			<input type="hidden" name="amount" value="${param.amount}">
   			<input type="hidden" name="orderDate" value="${param.orderDate}">
    		<table border="1" bordercolor="lightgrey" bgcolor="#F9F9F9" width="600" height="200" rules="none" cellpadding="0" cellspacing="0" style="margin-top:230">
				 <tr>
				 	<td style="padding-left:100">
				 		订单号：<font color="red">${param.orderid}</font>，您需要支付：<font color="red">￥${param.amount}</font><br><br>
				 		你选择的是通过支付宝支付平台进行网上支付，只有在网上支付成功后，我们才会为您发货。<br><br>
				 		请立即支付：<input type="button" value="支付宝网上支付">
				 	</td>
				 </tr>				
    		</table>
   			</form>
   		</div>
    	</center>    	
  	</body>
</html>
