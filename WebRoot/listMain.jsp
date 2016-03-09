<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>¹ºÎïÇø</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  
  <body bgcolor="#E1E1E1">
  	<center>
	<table border="0" cellpadding="0" cellspacing="0">
		<tr><td><img src="images/top.jpg" width="790" height="149"></td></tr>
	</table>
	<table width="790" border="0" cellpadding="0" cellspacing="0" bgcolor="white">
		<tr>
			<td align="center" width="190" height="49" valign="top"><a href="showshopcar" target="_blank"><img border="0" src="images/left_lookcar.jpg" width="190"></a></td>
			<td align="center" width="600" valign="top" rowspan="2" bgcolor="white">
				<iframe id="listgoods" src="listgoods" width="100%" frameborder="0" scrolling="no"></iframe>
			</td>
		</tr>
		<tr>
			<td height="600" valign="top" background="images/left_bk.jpg">
				<iframe id="listbrowsegoods" src="listbrowsegoods" width="190" height="383" frameborder="0" scrolling="auto"></iframe>
			</td>
		</tr>
	</table>
	<table border="0" cellpadding="0" cellspacing="0">
		<tr><td><img src="images/end.jpg" width="790" height="104"></td></tr>
	</table>
	</center>
  </body>
</html>