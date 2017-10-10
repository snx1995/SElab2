package lab2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;

import com.opensymphony.xwork2.ActionSupport;

public class AuthorInfoQuery extends ActionSupport {
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String CLOUD_DB_URL = "jdbc:mysql://localhost:3306/bookdb?characterEncoding=UTF-8";
	static final String DB_URL = "jdbc:mysql://bycaiiskjonq.mysql.sae.sina.com.cn:10018/bookdb?characterEncoding=UTF-8";
	static final String USER = "banyq";
	static final String PASSWD = "950714";
	
	private String name;
	private String country;
	private int ageMin;
	private int ageMax;
	private int authorID;
	private Author[] authorQueryResult;
	
	public AuthorInfoQuery(){
		name="";
		country="";
		ageMin = -1;
		ageMax = 999999;
	}
	
	public String queryAuthor() throws Exception{
		String result = ERROR;
		Connection con = null;
		Statement st = null;
		try{
			Class.forName(JDBC_DRIVER).newInstance();
			con=DriverManager.getConnection(DB_URL,USER,PASSWD);
			st=con.createStatement();
			String sql = "select * from author where age>= "+ ageMin +" and age<= "+ageMax;
			sql += name.equals("")? "":(" and name= \""+name+"\"");
			sql +=country.equals("")? "":("and country = \"" +country + "\"");
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()){
				if(authorQueryResult==null) authorQueryResult = new Author[1];
				else authorQueryResult = Arrays.copyOf(authorQueryResult, authorQueryResult.length+1);
				int l = authorQueryResult.length;
				authorQueryResult[l-1]=new Author();
				authorQueryResult[l-1].setName(rs.getString("name"));
				authorQueryResult[l-1].setAge(rs.getInt("age"));
				authorQueryResult[l-1].setCountry(rs.getString("country"));
				authorQueryResult[l-1].setAuthorID(rs.getInt("authorid"));
			}
			result = SUCCESS;
		}catch(SQLException se){
			se.printStackTrace();
			result = ERROR;
		}catch(Exception e){
			result=ERROR;
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
		return result;
	}
	
	public int getAuthorID() {
		return authorID;
	}

	public void setAuthorID(int authorID) {
		this.authorID = authorID;
	}

	public int getAgeMin() {
		return ageMin;
	}

	public void setAgeMin(int ageMin) {
		this.ageMin = ageMin;
	}

	public int getAgeMax() {
		return ageMax;
	}

	public void setAgeMax(int ageMax) {
		this.ageMax = ageMax;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public Author[] getAuthorQueryResult() {
		return authorQueryResult;
	}
	public void setAuthorQueryResult(Author[] authorQueryResult) {
		this.authorQueryResult = authorQueryResult;
	}
}
