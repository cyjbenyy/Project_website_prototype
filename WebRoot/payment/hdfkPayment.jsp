<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
	<head> 
    	<title>֧������</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
  	</head>
    <body>
    	<center>
    	<div style="background:url(images/payfor_bk.jpg);width:720;height:583;">
    		<form action="" method="post">
    		<table border="1" bordercolor="lightgrey" bgcolor="#F9F9F9" width="600" height="200" rules="none" cellpadding="0" cellspacing="0" style="margin-top:230">
				 <tr>
				 	<td style="padding-left:100">
				 		�����ţ�<font color="red">${param.orderid}</font>������Ҫ֧����<font color="red">��${param.amount}</font><br><br>
				 		��ѡ����ǻ�������֧����ʽ��������ָ����ʱ�䣬���ǽ���ʱ�ͻ����ţ���׼����Money��^_^
				 	</td>
				 </tr>
    		</table>
    		</form>
    	</div>
    	</center>    	
  	</body>
</html>