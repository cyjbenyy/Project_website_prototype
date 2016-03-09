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
    	<title>���ɶ���</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
  	</head>
    <body>
    	<center>
   		<table border="0" cellpadding="0" cellspacing="0">
			<tr><td><img src="images/top.jpg" width="790" height="149"></td></tr>
			<tr height="54"><td background="images/car_m.jpg" style="padding-left:15;padding-top:20"><b>${sessionScope.loginer.userName}�Ķ���</b></td></tr>
		</table>
    	<c:set var="myorderform" value="${requestScope.orderform}"/>
    	<c:if test="${!empty myorderform}">
    	<table border="1" bordercolor="lightgrey" width="790" cellpadding="3" cellspacing="0" rules="none">
    		<tr height="30">
    			<td colspan="2" align="right">
		    		�����ţ�${myorderform.orderformNumber}&nbsp;&nbsp;&nbsp;
    				�µ�ʱ�䣺${myorderform.orderformTime}
    			</td>
    		</tr>
    		<tr bgcolor="#F2F3F5"><td colspan="2">�ջ�����Ϣ</td></tr>
    		<tr>
    			<td width="25%" style="padding-left:40">�� �� �ˣ�</td>
    			<td>${myorderform.orderformGetter}"</td>
    		</tr>
    		<tr>
    			<td style="padding-left:40">��ϸ��ַ��</td>
    			<td>${myorderform.orderformAddress}</td>
    		</tr>
    		<tr>
    			<td style="padding-left:40">�������룺</td>
    			<td>${myorderform.orderformPostalcode}</td>
    		</tr>
    		<tr>
    			<td style="padding-left:40">��ϵ�绰��</td>
    			<td>${myorderform.orderformLinkphone}</td>
    		</tr>
    		<tr bgcolor="#F2F3F5"><td colspan="2">�ͻ���ʽ</td></tr>
    		<tr height="50">
    			<td colspan="2" style="padding-left:40">
    				<c:if test="${myorderform.orderformShipment eq '1'}">
    					��ͨ����ͻ����ţ��ͻ�ʱ�䣺
    					<c:if test="${myorderform.orderformShipmenttime eq '1'}">����ʱ�䡣</c:if>
    					<c:if test="${myorderform.orderformShipmenttime eq '2'}">3���ڡ�</c:if>
    					<c:if test="${myorderform.orderformShipmenttime eq '3'}">1���ڡ�</c:if>
    					<c:if test="${myorderform.orderformShipmenttime eq '4'}">1���ڡ�</c:if>
    					���˷ѣ�20Ԫ��
    				</c:if>
    				<c:if test="${myorderform.orderformShipment eq '2'}">��ͨ�ʵݡ��˷ѣ�30Ԫ��</c:if>
    				<c:if test="${myorderform.orderformShipment eq '3'}">�����ؿ�ר�ݡ��˷ѣ�40Ԫ��</c:if>
     			</td>  	
    		</tr>
    		<tr bgcolor="#F2F3F5"><td colspan="2">֧����ʽ</td></tr>
    		<tr height="50">
    			<td colspan="2" style="padding-left:40">
    				<c:if test="${myorderform.orderformPayment eq '1'}">
    					����֧����
    					<c:if test="${myorderform.orderformNetworkpayment eq '1'}">ͨ�� <b>��������</b> ֧����</c:if>
    					<c:if test="${myorderform.orderformNetworkpayment eq '2'}">ͨ�� <b>��������</b> ֧����</c:if>
    					<c:if test="${myorderform.orderformNetworkpayment eq '3'}">ͨ�� <b>��������</b> ֧����</c:if>
    					<c:if test="${myorderform.orderformNetworkpayment eq '4'}">ͨ�� <b>֧����֧��ƽ̨</b> ֧����</c:if>
    				</c:if>
    				<c:if test="${myorderform.orderformPayment eq '2'}">��������</c:if>
    				<c:if test="${myorderform.orderformPayment eq '3'}">�������</c:if>
    				<c:if test="${myorderform.orderformPayment eq '4'}">����ת��</c:if>
    			</td>
    		</tr>
    		<tr bgcolor="#F2F3F5"><td colspan="2">��Ʒ�嵥</td></tr>
    		<tr>
    			<td colspan="2" align="center">
    				<c:if test="${!empty myorderform.orderformBuyGoods}">
    				<table border="0" width="99%" rules="none" cellpadding="0" cellspacing="0">
	    				<tr height="40" style="font-size:12">
	    					<th width="10%" align="center">���</th>
    						<th align="left">��Ʒ����</th>
    						<th align="left" width="15%">�۸�</th>
    						<th align="left" width="15%">����</th>
    						<th align="left" width="15%">�ܼ�</th>
	    				</tr>
    					<c:forEach var="buysingle" varStatus="bvs" items="${myorderform.orderformBuyGoods}">
    					<tr>
    						<td align="center">${bvs.count}</td>
    						<td>${buysingle.goodsName}</td>
    						<td>��${buysingle.goodsPrice}</td>
    						<td>${buysingle.goodsBuyNum}</td>
    						<td>��${buysingle.goodsMoney}</td>
    					</tr>
    					<tr height="2"><td colspan="5"><hr width="98%" color="black"></td></tr>
    					</c:forEach>
    					<tr height="50" valign="bottom">
    						<td colspan="5" align="right">
    							��Ʒ�ϼƣ���${requestScope.goodsprices}
    							<hr color="black" width="40%" style="border-style:solid">
    						</td>
    					</tr>
    					<tr height="50" valign="top"><td colspan="5" align="right">����ҪΪ�ö���֧������${requestScope.totalprices}�����˷ѣ�</td></tr>
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
	    	<input type="button" value="ȷ�϶���" onclick="affirmorderform.submit();this.disabled=true">
    	</form>
   		</c:if>
	   	<table border="0" cellpadding="0" cellspacing="0">
			<tr><td><img src="images/end.jpg" width="790" height="104"></td></tr>
		</table>
    	</center>    	
  	</body>
</html>
