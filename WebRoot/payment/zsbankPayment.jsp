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
   			<form action="" method="post">
    		<table border="1" width="700" height="200" rules="none" style="margin-top:120">
				 <tr>
				 	<td style="padding-left:100">
				 		�����ţ�<font color="red">${param.orderid}</font>������Ҫ֧����<font color="red">��${param.amount}</font><br><br>
				 		��ѡ�����ͨ���������н�������֧����ֻ��������֧���ɹ������ǲŻ�Ϊ��������<br><br>
				 		������֧����<input type="button" value="������������֧��">
				 	</td>
				 </tr>				
    		</table>
   			</form>
    	</center>    	
  	</body>
</html>
