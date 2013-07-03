package com.myforms.anonymous;

public enum ClientStatus {
Approved("approve"), Declined("decline");
String status;
ClientStatus(String status){
	this.status = status;
}
public static ClientStatus getClientStatus(String type){
	if(Approved.status.equals(type))
		return Approved;
	if(Declined.status.equals(type))
		return Declined;	
	throw new RuntimeException("NOt a valid client status enum type");
}

}
