<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>查看商品详细信息</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  
  <body>
  	<center>
  	<div style="background:url(images/viewbk.jpg);width:720;height:583">
	<c:set var="single" value="${requestScope.goodsingle}"/>	
	<c:if test="${empty single}">查看商品详细信息失败！</c:if>
	<c:if test="${!empty single}">	
	<table border="0" width="100%" height="100%" cellspacing="3" cellpadding=3">	
		<tr>
			<td width="50%" style="padding-top:173;padding-left:91"><img src="images/goods/${single.goodsViewpic}" width="220" height="180"></td>
			<td valign="bottom">
				商品名称：${single.goodsName}<br>
				商品价格：${single.goodsPrice}<br>
				上架时间：${single.goodsStocktime}<br>
				生产厂商：${single.goodsMaker}<br>
				<c:if test="${single.goodsStoreNum<=0}">
				<font color="red">抱歉！暂时无货</font></c:if>
				<c:if test="${single.goodsStoreNum>0}">
				<a href="buy?buygoodsId=${single.id}">放入购物车</a></c:if>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="showshopcar">查看购物车</a>
			</td>
		</tr>
		<tr height="180" valign="top">
			<td colspan="2" style="padding-left:80">
				<b>商品描述：</b><br>
				${single.goodsInfo}
			</td>
		</tr>
	</table>
	</c:if>
	</div>
	</center>
  </body>
</html>
