<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>购物区</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<script type="text/javascript">
		function autosize(){
			var tag=parent.document.getElementById("listgoods");
			tag.height=document.body.scrollHeight;	
		}
		function addbrowsegoods(){
			window.setTimeout("showbrowsegoods()",3000);
		}
		function showbrowsegoods(){
			var tag=parent.document.getElementById("listbrowsegoods");
			tag.src="listbrowsegoods";
		}
	</script>
  </head>  
  <body onload="autosize()">
  	<center>	
	<table border="0" width="100%" style="word-break:break-all">
		<tr height="30">
			<td align="center" valign="top">
				<c:set var="allgoodslist" value="${requestScope.goodslist}"/>
				<c:if test="${empty allgoodslist}">没有商品</c:if>
				<c:if test="${!empty allgoodslist}">
				<table width="99%" border="0" cellspacing="5" cellpadding="5">	
					<c:forEach var="onegoodslist" items="${allgoodslist}">
					<tr>
					<c:forEach var="onegoods" items="${onegoodslist}">
					<td>
						<c:if test="${!empty onegoods}">
						<div style="background:url(images/goods/goodsbk.jpg);width:123;height:126;padding-left:12;padding-top:20">
						<a href="viewgoods?goodId=${onegoods.id}" target="_blank"><img src="images/goods/${onegoods.goodsViewpic}" width="90" height="75" style="border:0" title="单击查看商品详细信息" onclick="addbrowsegoods()"></a><br>
						</div>	
						商品名称：${onegoods.goodsName}<br>
						商品价格：${onegoods.goodsPrice}<br>	
						<a href="viewgoods?goodId=${onegoods.id}" target="_blank">查看详细信息</a>
						</c:if>	
					</td>
					</c:forEach>
					</tr>
					<tr ><td colspan="4"><hr color="black"></td></tr>
					</c:forEach>
					<tr><td colspan="4">${requestScope.pageBar.pageLink}</td></tr>
				</table>
				</c:if>			
			</td>
		</tr>		
	</table>
	</center>
  </body>
</html>