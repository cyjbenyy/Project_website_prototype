<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
	<head>
    	<base href="<%=basePath%>">    
    	<title>֧������</title>
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
				 		�����ţ�<font color="red">${param.orderid}</font>������Ҫ֧����<font color="red">��${param.amount}</font><br><br>
				 		��ѡ�����ͨ���������н�������֧����ֻ��������֧���ɹ������ǲŻ�Ϊ��������<br><br>
				 		������֧����<input type="button" value="������������֧��">
				 	</td>
				 </tr>				
    		</table>
   			</form>
   		</div>
    	</center>    	
  	</body>
</html>
