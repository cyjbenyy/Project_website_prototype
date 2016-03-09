<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>�鿴��Ʒ��ϸ��Ϣ</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  
  <body>
  	<center>
  	<div style="background:url(images/viewbk.jpg);width:720;height:583">
	<c:set var="single" value="${requestScope.goodsingle}"/>	
	<c:if test="${empty single}">�鿴��Ʒ��ϸ��Ϣʧ�ܣ�</c:if>
	<c:if test="${!empty single}">	
	<table border="0" width="100%" height="100%" cellspacing="3" cellpadding=3">	
		<tr>
			<td width="50%" style="padding-top:173;padding-left:91"><img src="images/goods/${single.goodsViewpic}" width="220" height="180"></td>
			<td valign="bottom">
				��Ʒ���ƣ�${single.goodsName}<br>
				��Ʒ�۸�${single.goodsPrice}<br>
				�ϼ�ʱ�䣺${single.goodsStocktime}<br>
				�������̣�${single.goodsMaker}<br>
				<c:if test="${single.goodsStoreNum<=0}">
				<font color="red">��Ǹ����ʱ�޻�</font></c:if>
				<c:if test="${single.goodsStoreNum>0}">
				<a href="buy?buygoodsId=${single.id}">���빺�ﳵ</a></c:if>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="showshopcar">�鿴���ﳵ</a>
			</td>
		</tr>
		<tr height="180" valign="top">
			<td colspan="2" style="padding-left:80">
				<b>��Ʒ������</b><br>
				${single.goodsInfo}
			</td>
		</tr>
	</table>
	</c:if>
	</div>
	</center>
  </body>
</html>
