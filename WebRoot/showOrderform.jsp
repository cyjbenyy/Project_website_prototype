<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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
    	<title>生成订单</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
  	</head>
    <body>
    	<center>
   		<table border="0" cellpadding="0" cellspacing="0">
			<tr><td><img src="images/top.jpg" width="790" height="149"></td></tr>
			<tr height="54"><td background="images/car_m.jpg" style="padding-left:15;padding-top:20"><b>${sessionScope.loginer.userName}的订单</b></td></tr>
		</table>
    	<c:set var="myorderform" value="${requestScope.orderform}"/>
    	<c:if test="${!empty myorderform}">
    	<table border="1" bordercolor="lightgrey" width="790" cellpadding="3" cellspacing="0" rules="none">
    		<tr height="30">
    			<td colspan="2" align="right">
		    		订单号：${myorderform.orderformNumber}&nbsp;&nbsp;&nbsp;
    				下单时间：${myorderform.orderformTime}
    			</td>
    		</tr>
    		<tr bgcolor="#F2F3F5"><td colspan="2">收货人信息</td></tr>
    		<tr>
    			<td width="25%" style="padding-left:40">收 货 人：</td>
    			<td>${myorderform.orderformGetter}"</td>
    		</tr>
    		<tr>
    			<td style="padding-left:40">详细地址：</td>
    			<td>${myorderform.orderformAddress}</td>
    		</tr>
    		<tr>
    			<td style="padding-left:40">邮政编码：</td>
    			<td>${myorderform.orderformPostalcode}</td>
    		</tr>
    		<tr>
    			<td style="padding-left:40">联系电话：</td>
    			<td>${myorderform.orderformLinkphone}</td>
    		</tr>
    		<tr bgcolor="#F2F3F5"><td colspan="2">送货方式</td></tr>
    		<tr height="50">
    			<td colspan="2" style="padding-left:40">
    				<c:if test="${myorderform.orderformShipment eq '1'}">
    					普通快递送货上门，送货时间：
    					<c:if test="${myorderform.orderformShipmenttime eq '1'}">不限时间。</c:if>
    					<c:if test="${myorderform.orderformShipmenttime eq '2'}">3天内。</c:if>
    					<c:if test="${myorderform.orderformShipmenttime eq '3'}">1周内。</c:if>
    					<c:if test="${myorderform.orderformShipmenttime eq '4'}">1月内。</c:if>
    					【运费：20元】
    				</c:if>
    				<c:if test="${myorderform.orderformShipment eq '2'}">普通邮递【运费：30元】</c:if>
    				<c:if test="${myorderform.orderformShipment eq '3'}">邮政特快专递【运费：40元】</c:if>
     			</td>  	
    		</tr>
    		<tr bgcolor="#F2F3F5"><td colspan="2">支付方式</td></tr>
    		<tr height="50">
    			<td colspan="2" style="padding-left:40">
    				<c:if test="${myorderform.orderformPayment eq '1'}">
    					网上支付，
    					<c:if test="${myorderform.orderformNetworkpayment eq '1'}">通过 <b>工商银行</b> 支付。</c:if>
    					<c:if test="${myorderform.orderformNetworkpayment eq '2'}">通过 <b>招商银行</b> 支付。</c:if>
    					<c:if test="${myorderform.orderformNetworkpayment eq '3'}">通过 <b>建设银行</b> 支付。</c:if>
    					<c:if test="${myorderform.orderformNetworkpayment eq '4'}">通过 <b>支付宝支付平台</b> 支付。</c:if>
    				</c:if>
    				<c:if test="${myorderform.orderformPayment eq '2'}">货到付款</c:if>
    				<c:if test="${myorderform.orderformPayment eq '3'}">邮政汇款</c:if>
    				<c:if test="${myorderform.orderformPayment eq '4'}">银行转帐</c:if>
    			</td>
    		</tr>
    		<tr bgcolor="#F2F3F5"><td colspan="2">商品清单</td></tr>
    		<tr>
    			<td colspan="2" align="center">
    				<c:if test="${!empty myorderform.orderformBuyGoods}">
    				<table border="0" width="99%" rules="none" cellpadding="0" cellspacing="0">
	    				<tr height="40" style="font-size:12">
	    					<th width="10%" align="center">序号</th>
    						<th align="left">商品名称</th>
    						<th align="left" width="15%">价格</th>
    						<th align="left" width="15%">数量</th>
    						<th align="left" width="15%">总计</th>
	    				</tr>
    					<c:forEach var="buysingle" varStatus="bvs" items="${myorderform.orderformBuyGoods}">
    					<tr>
    						<td align="center">${bvs.count}</td>
    						<td>${buysingle.goodsName}</td>
    						<td>￥${buysingle.goodsPrice}</td>
    						<td>${buysingle.goodsBuyNum}</td>
    						<td>￥${buysingle.goodsMoney}</td>
    					</tr>
    					<tr height="2"><td colspan="5"><hr width="98%" color="black"></td></tr>
    					</c:forEach>
    					<tr height="50" valign="bottom">
    						<td colspan="5" align="right">
    							商品合计：￥${requestScope.goodsprices}
    							<hr color="black" width="40%" style="border-style:solid">
    						</td>
    					</tr>
    					<tr height="50" valign="top"><td colspan="5" align="right">您需要为该订单支付：￥${requestScope.totalprices}（含运费）</td></tr>
    				</table>
    				</c:if>
    			</td>
    		</tr>
    	</table>    	
    	<form action="affirmOrderform.jsp" name="affirmorderform" method="post">
    		<input type="hidden" name="payment" value="${myorderform.orderformPayment}">
    		<input type="hidden" name="networkpayment" value="${myorderform.orderformNetworkpayment}">
    		<input type="hidden" name="orderid" value="${myorderform.orderformNumber}">
    		<input type="hidden" name="orderDate" value="${myorderform.orderformTime}">
			<input type="hidden" name="amount" value="${requestScope.totalprices}">  
	    	<input type="button" value="确认订单" onclick="affirmorderform.submit();this.disabled=true">
    	</form>
   		</c:if>
	   	<table border="0" cellpadding="0" cellspacing="0">
			<tr><td><img src="images/end.jpg" width="790" height="104"></td></tr>
		</table>
    	</center>    	
  	</body>
</html>
