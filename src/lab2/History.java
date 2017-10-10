package lab2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;

import com.opensymphony.xwork2.ActionSupport;

public class History extends ActionSupport{
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String CLOUD_DB_URL = "jdbc:mysql://localhost:3306/bookdb?characterEncoding=UTF-8";
	static final String DB_URL = "jdbc:mysql://bycaiiskjonq.mysql.sae.sina.com.cn:10018/bookdb?characterEncoding=UTF-8";
	static final String USER = "banyq";
	static final String PASSWD = "950714";
	
	private String[] logs;
	private String[] his;
	
	public History(){
		logs=new String[10];
	}
	
	public String queryHistory() throws Exception{
		Connection con = null;
		Statement st = null;
		try{
			Class.forName(JDBC_DRIVER);
			con=DriverManager.getConnection(DB_URL,USER,PASSWD);
			st=con.createStatement();
			String sql = "select * from history";
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				if(his==null) his = new String[1];
				else his = Arrays.copyOf(his, his.length+1);
				int l = his.length;
				his[l-1] = rs.getString("operation");
			}
			int j=0;
			for(int i=his.length-1;i>=0&&j<10;i--){
				logs[j]=his[i];
				j++;
			}
		}catch(SQLException se){
			se.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			// 关闭资源
            try{
                if(st!=null) st.close();
            }catch(SQLException se2){
            }// 什么都不做
            try{
                if(con!=null) con.close();
            }catch(SQLException se){
                se.printStackTrace();
            }
		}
		return SUCCESS;
	}

	public String[] getLogs() {
		return logs;
	}

	public void setLogs(String[] logs) {
		this.logs = logs;
	}
}
