function myorderformsubmit(){
	if(validateForm()){
		orderform.createorderformb.disabled=true;
		orderform.submit();
	}
	else
		return false;
}
function validateForm(){
	if(tirm(orderform.getter.value).length==0){
		gettermessage.innerHTML="���������ջ��ˣ�";
		orderform.getter.focus();
		return false;
	}	
	if(tirm(orderform.address.value).length==0){
		addressmessage.innerHTML="���������ջ�����ϸסַ��";
		orderform.address.focus();
		return false;
	}
	var postalcodereg=/^[0-9]{6}$/;
	if(!postalcodereg.test(orderform.postalcode.value)){
		postalcodemessage.innerHTML="���������������6λ������ɣ�";
		orderform.postalcode.focus();
		return false;
	}
	if(tirm(orderform.telephone1.value).length!=0){
		var telephone1reg=/^[1]\d{10}$/;
		if(!telephone1reg.test(orderform.telephone1.value)){
			linkphonemessage.innerHTML="���ֻ����������11λ�������";
			orderform.telephone1.focus();
			return false;
		}		
	}
	else if(tirm(orderform.telephone2.value).length!=0){
		var telephone2reg=/^[0-9]{3,4}-[0-9]{7,8}$/;
		if(!telephone2reg.test(orderform.telephone2.value)){
			linkphonemessage.innerHTML="������Ĺ̶��绰����";
			orderform.telephone2.focus();
			return false;
		}
	}
	else{
		linkphonemessage.innerHTML="����������ϵ�绰��";
		orderform.telephone1.focus();
		return false;
	}
	if(!ischecked(document.all.shipment1)&&!ischecked(document.all.shipment2)&&!ischecked(document.all.shipment3)){
		shipmentmessage.innerHTML="����ѡ��һ���ͻ���ʽ��";
		return false;
	}	
	else if(ischecked(document.all.shipment1)){
		if(orderform.shipmenttime.value==null||orderform.shipmenttime.value==""){
			shipmentmessage.innerHTML="����ѡ���ͻ�ʱ�䣡";
			return false;
		}
	}
	if(!ischecked(document.all.payment1)&&!ischecked(document.all.payment2)&&!ischecked(document.all.payment3)&&!ischecked(document.all.payment4)){
		paymentmessage.innerHTML="����ѡ��һ��֧����ʽ��";
		return false;
	}	
	else if(ischecked(document.all.payment1)){
		if(!ischecked(document.all.networkpayment1)&&!ischecked(document.all.networkpayment2)&&!ischecked(document.all.networkpayment3)&&!ischecked(document.all.networkpayment4)){
			paymentmessage.innerHTML="����ѡ��һ�����ϵ�֧����ʽ��";
			return false;
		}
	}
	return true;
}
function tirm(stxt){
	if(stxt!=null&&stxt!=""){
		var re=/(^\s*)|(\s*$)/;
		stxt=stxt.replace(re,"");
	}
	else
		stxt="";
	return stxt;
}
function ischecked(field){
	if(!field.checked)
		return false;
	else 
		return true;
}
function clickshipment1(){
	shipmenttimes.style.display="";
	document.all.payment2.disabled=false;
}
function clickshipment23(){
	shipmenttimes.style.display="none";
	document.all.payment2.disabled=true;
	document.all.payment2.checked=false
}
function clickpayment1(){
	networkpayments.style.display="";
}
function clickpayment234(){
	networkpayments.style.display="none";
}