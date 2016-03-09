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
   			<form action="" method="post">
    		<table border="1" width="700" height="200" rules="none" style="margin-top:120">
				 <tr>
				 	<td style="padding-left:100">
				 		订单号：<font color="red">${param.orderid}</font>，您需要支付：<font color="red">￥${param.amount}</font><br><br>
				 		你选择的是通过招商银行进行网上支付，只有在网上支付成功后，我们才会为您发货。<br><br>
				 		请立即支付：<input type="button" value="招商银行网上支付">
				 	</td>
				 </tr>				
    		</table>
   			</form>
    	</center>    	
  	</body>
</html>
