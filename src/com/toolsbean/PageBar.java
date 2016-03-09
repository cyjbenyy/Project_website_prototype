package com.toolsbean;

public class PageBar {
	private int allR;				//all records
	private int perR;				//records per page
	private int perP;				//Page nums per page
	private int allP;				//All page nums
	private int allG;				//All group nums
	private int currentP=1;			//current page
	private int currentG=1;			//current group num
	private String pageLink;		//navigation bars
	
	public PageBar(){
		allR=0;				
		perR=12;				
		perP=3;				
		currentP=1;
		currentG=1;
		pageLink="";
	}
	
	/** setters for all private variables*/
	public void setAllR(int allR){
		this.allR=allR;
	}

	public void setPerR(int perR){
		this.perR=perR;
	}	

	public void setPerP(int perP){
		this.perP=perP;
	}

	public void setPageBar(String strcurrentP,String strcurrentG,String goWhich){
		setAllP();								//set all page number
		setAllG();								//set all group number
		setCurrentP(strcurrentP);				//set current page
		setCurerntG(strcurrentG);				//set current group
		setCurrent();							//calculate final current page and current group
		setPageLink(goWhich);					//generate navigation bars
	}

	private void setAllP(){
		allP=(allR%perR==0)?(allR/perR):(allR/perR+1);
	}

	private void setAllG(){
		allG=(allP%perP==0)?(allP/perP):(allP/perP+1);
	}

	private void setCurrentP(String currentP) {		
		try{
			this.currentP=Integer.parseInt(currentP);
		}catch(NumberFormatException e){
			this.currentP=-1;
		}	
	}

	private void setCurerntG(String currentG){
		try{
			this.currentG=Integer.parseInt(currentG);
		}catch(Exception e){
			this.currentG=-1;
		}
	}

	private void setCurrent(){
		if(currentP==-1&&currentG==-1){
			currentP=1;
			currentG=1;
		}
		else if(currentP!=-1&&currentG!=-1){
			currentP=1;
			currentG=1;
		}		
		else if(currentP!=-1){
			if(currentP>allP)
				currentP=allP;
			currentG=currentP/perP+1;
		}
		else if(currentG!=-1){
			if(currentG>allG)
				currentG=allG;
			currentP=(currentG-1)*perP+1;
		}
	}

	private void setPageLink(String goWhich){
		pageLink="<table width='100%' border='0' cellpadding='2' cellspacing='0'>";
		pageLink+="<tr class='pager'>";
		pageLink+="<td>";
		pageLink+="共("+allR+")记录&nbsp;&nbsp;&nbsp;共("+allP+")页&nbsp;&nbsp;&nbsp;";
		pageLink+="</td>";
		
		if(goWhich==null)goWhich="";
		if(goWhich.indexOf("?")>=0)
			goWhich+="&";
		else
			goWhich+="?";		
		
		pageLink+="<td align='right'>[";

		if(currentG>1)
			pageLink+="<a href='"+goWhich+"currentG="+(currentG-1)+"' class='pagertext'>上"+perP+"页</a> ";
		if(currentP>1){
			pageLink+="<a href='"+goWhich+"currentP=1'>首页</a> ";
			pageLink+="<a href='"+goWhich+"currentP="+(currentP-1)+"'>上一页</a> | ";
		}
		
		if(currentP%perP==0)
			pageLink+="<a class='pagerCurrentP'>"+currentP+"</a>&nbsp;&nbsp;";
		
		int temp=currentG;
		int start=(currentG-1)*perP+1;
		for(int i=0;((i<perP)&&((start+i)<=allP));i++){
			if((start+i)%perP==0)
				temp++;
			else
				temp=currentG;
			if((start+i)==currentP)
				pageLink+="<a class='pagerCurrentP'>"+(start+i)+"</a>&nbsp;&nbsp;";
			else
				pageLink+="<a href='"+goWhich+"currentP="+(start+i)+"' class='pagerline'>"+(start+i)+"</a>&nbsp;&nbsp;";
		}		
		
		if(currentP<allP){
			pageLink+="| <a href='"+goWhich+"currentP="+(currentP+1)+"'>下一页</a>";
			pageLink+=" <a href='"+goWhich+"currentP="+allP+"#listtop'>尾页</a>";
		}		
		if(currentG<allG)
			pageLink+=" <a href='"+goWhich+"currentG="+(currentG+1)+"' class='pagertext'>下"+perP+"页</a>";
		
		pageLink+="]</td>";		
		pageLink+="</tr></table>";	
	}

	public int getAllR() {
		return allR;
	}
	public int getPerR() {
		return perR;
	}
	public int getPerP() {
		return perP;
	}
	public int getAllP() {
		return allP;
	}
	public int getAllG() {
		return allG;
	}
	public int getCurrentP() {
		return currentP;
	}
	public int getCurrentG() {
		return currentG;
	}
	public String getPageLink() {
		return pageLink;
	}	
}
