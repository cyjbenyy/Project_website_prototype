<%@ page contentType="text/html;charset=gb2312"%>
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
    	<title>��д������Ϣ</title>	
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<script type="text/javascript" src="js/validateorderform.js"></script>
  	</head>  
 	<body>
    	<center>
    	<table border="0" cellpadding="0" cellspacing="0">
			<tr><td><img src="images/top.jpg" width="790" height="149"></td></tr>
			<tr height="54"><td background="images/car_m.jpg" style="padding-left:15;padding-top:20"><b>��д������Ϣ</b></td></tr>
		</table>
		
    	<form action="createorderform" name="orderform" method="post">
    	<input type="hidden" name="buygoodsids" value="${requestScope.buygoodsids}">
    	<input type="hidden" name="buygoodsnum" value="${requestScope.buygoodsnum}">
    	<input type="hidden" name="goodsprices" value="${param.goodsprices}">
    	<table border="1" bordercolor="#F2F3F5" width="790" cellpadding="3" cellspacing="0" rules="none">
    		<tr height="25" bgcolor="#F2F3F5"><td colspan="3">�ջ�����Ϣ</td></tr>
    		<tr bgcolor="white">
    			<td width="20%">�� �� �ˣ�</td>
    			<td colspan="2"><input type="text" name="getter" size="30" onpropertychange="gettermessage.innerHTML=''">&nbsp;<b><span id="gettermessage" style="color:red"></span></b></td>
    		</tr>
    		<tr bgcolor="white">
    			<td>��ϸ��ַ��</td>
    			<td colspan="2"><input type="text" name="address" size="60" onpropertychange="addressmessage.innerHTML=''">&nbsp;<b><span id="addressmessage" style="color:red"></span></b></td>
    		</tr>
    		<tr bgcolor="white">
    			<td>�������룺</td>
    			<td colspan="2"><input type="text" name="postalcode" size="30" onpropertychange="postalcodemessage.innerHTML=''">&nbsp;<b><span id="postalcodemessage" style="color:red"></span></b></td>
    		</tr>
    		<tr bgcolor="white">
    			<td>�ƶ��绰��</td>
    			<td><input type="text" name="telephone1" size="20" onpropertychange="linkphonemessage.innerHTML=''"></td>
    			<td>�̶��绰��<input type="text" name="telephone2" size="20" onpropertychange="linkphonemessage.innerHTML=''"> (��:0431-1234560)</td>
    		</tr>
    		<tr><td colspan="3"><b><span id="linkphonemessage" style="color:red"></span></b></td></tr>
    		<tr bgcolor="#F2F3F5"><td colspan="3">�ͻ���ʽ&nbsp;<b><span id="shipmentmessage" style="color:red"></span></b></td></tr>
    		<tr bgcolor="white">
    			<td><input type="radio" id="shipment1" name="shipment" value="1" onclick="clickshipment1();shipmentmessage.innerHTML=''">��ͨ����ͻ�����</td>
    			<td colspan="2" style="text-indent:20">
    				<div id="shipmenttimes" style="display:'none'">
    				�ͻ�ʱ�䣺
    				<select name="shipmenttime" onchange="shipmentmessage.innerHTML=''">
    					<option value="">-��ѡ��ʱ��-</option>
    					<option value="1">����ʱ��</option>
    					<option value="2">3����</option>
    					<option value="3">1����</option>
    					<option value="4">1����</option>    					
    				</select>
    				(֧�ֻ�������)���˷ѣ�20Ԫ��
    				</div>
    			</td>
    		</tr>
    		<tr bgcolor="white"><td colspan="3"><input type="radio" id="shipment2" name="shipment" value="2" onclick="clickshipment23();shipmentmessage.innerHTML=''">��ͨ�ʵ�(��֧�ֻ�������)���˷ѣ�30Ԫ��</td></tr>
    		<tr bgcolor="white"><td colspan="3"><input type="radio" id="shipment3" name="shipment" value="3" onclick="clickshipment23();shipmentmessage.innerHTML=''">�����ؿ�ר��(��֧�ֻ�������)���˷ѣ�40Ԫ��</td></tr>
    		<tr bgcolor="#F2F3F5"><td colspan="3">֧����ʽ&nbsp;<b><span id="paymentmessage" style="color:red"></span></b></td></tr>
    		<tr bgcolor="white">
    			<td colspan="3">
    				<input type="radio" id="payment1" name="payment" value="1" onclick="clickpayment1();paymentmessage.innerHTML=''">����֧��<br>
    				<div id="networkpayments" style="padding-left:30;display:">
    				<input type="radio" id="networkpayment1" name="networkpayment" value="1" onclick="paymentmessage.innerHTML=''">��������<br>
    				<input type="radio" id="networkpayment2" name="networkpayment" value="2" onclick="paymentmessage.innerHTML=''">��������<br>
    				<input type="radio" id="networkpayment3" name="networkpayment" value="3" onclick="paymentmessage.innerHTML=''">��������<br>
    				<input type="radio" id="networkpayment4" name="networkpayment" value="4" onclick="paymentmessage.innerHTML=''">֧����֧��ƽ̨<br>
    				</div>
    			</td>
    		</tr>
    		<tr bgcolor="white"><td colspan="3"><input type="radio" id="payment2" name="payment" value="2" onclick="clickpayment234();paymentmessage.innerHTML=''">��������</td></tr>
    		<tr bgcolor="white"><td colspan="3"><input type="radio" id="payment3" name="payment" value="3" onclick="clickpayment234();paymentmessage.innerHTML=''">�������</td></tr>
    		<tr bgcolor="white"><td colspan="3"><input type="radio" id="payment4" name="payment" value="4" onclick="clickpayment234();paymentmessage.innerHTML=''">����ת��</td></tr>
    		<tr><td colspan="3" align="center"><input type="button" name="createorderformb" value="���ɶ���" onclick="myorderformsubmit()"></td></tr>
    	</table>
    	</form>
    	<table border="0" cellpadding="0" cellspacing="0">
			<tr><td><img src="images/end.jpg" width="790" height="104"></td></tr>
		</table>
    	</center>
  	</body>
</html>
