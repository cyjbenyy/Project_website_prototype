<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>��¼</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  
  <body>
  	<center>	
	<div style="background:url(images/login_bk.jpg);width:720;height:583">
	<form action="login" method="post">
	<table border="0" width="300" style="margin-top:270">
		<tr height="32" align="center">
			<td width="30%" align="right">�û�����</td>
			<td><input type="text" size="30" name="username" class="login"></td>
		</tr>
		<tr height="32" align="center">
			<td align="right">��&nbsp;&nbsp;&nbsp;&nbsp;�룺</td>
			<td><input type="password" size="30" name="userpswd" class="login"></td>
		</tr>
		<tr height="60">
			<td colspan="2" align="center">
				<input type="submit" value="��¼">
				<input type="reset" value="����">
			</td>
		</tr>
	</table>
	</form>
	</div>
	</center>
  </body>
</html>
