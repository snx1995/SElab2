package lab2;

import com.opensymphony.xwork2.ActionSupport;

public class Users extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String userName;
	private String password;
	
	private String inputName;
	private String inputPasswd;
	
	public String index(){
		if(inputName.equals(userName)&&inputPasswd.equals(password))
			return SUCCESS;
		else return ERROR;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getInputName() {
		return inputName;
	}

	public void setInputName(String inputName) {
		this.inputName = inputName;
	}

	public String getInputPasswd() {
		return inputPasswd;
	}

	public void setInputPasswd(String inputPasswd) {
		this.inputPasswd = inputPasswd;
	}
	
	
}
