package org.apache.struts.helloworld.model;

public class MessageStore {
	private String message;
	
	public MessageStore(String name, int age){
		message = "Hello " + age +" years old struts user : " +name;
	}
	
	public String getMessage(){
		return message;
	}
}
