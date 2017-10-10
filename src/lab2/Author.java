package lab2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.Date;

import com.opensymphony.xwork2.ActionSupport;

public class Author extends ActionSupport {
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String CLOUD_DB_URL = "jdbc:mysql://localhost:3306/bookdb?characterEncoding=UTF-8";
	static final String DB_URL = "jdbc:mysql://bycaiiskjonq.mysql.sae.sina.com.cn:10018/bookdb?characterEncoding=UTF-8";
	static final String USER = "banyq";
	static final String PASSWD = "950714";

	private int authorID;
	private String name;
	private int age;
	private String country;
	private Book[] books;

	public String addNewAuthor() throws Exception {
		String result = ERROR;
		Connection con = null;
		Statement st = null;
		try {
			Class.forName(JDBC_DRIVER).newInstance();
			con = DriverManager.getConnection(DB_URL, USER, PASSWD);
			st = con.createStatement();
			String sql = "insert into author(name,age,country)values(\"" + name + "\"," + age + ",\"" + country + "\")";
			st.execute(sql);
			String sql2 = "insert into history(operation)values(\"" + new Date() + " : AddNewAuthor : " + name + "\")";
			st.execute(sql2);
			result = SUCCESS;
		} catch (SQLException se) {
			System.out.println("1");
			se.printStackTrace();
			result = ERROR;
		} catch (Exception e) {
			System.out.println("2");
			result = ERROR;
			e.printStackTrace();
		} finally {
			// 关闭资源
			try {
				if (st != null)
					st.close();
			} catch (SQLException se2) {
			} // 什么都不做
			try {
				if (con != null)
					con.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return result;
	}

	public Author setAuthorByID(int id) {
		Connection con = null;
		Statement st = null;
		try {
			Class.forName(JDBC_DRIVER).newInstance();
			con = DriverManager.getConnection(DB_URL, USER, PASSWD);
			st = con.createStatement();
			String sql = "select * from author where authorid = " + id;
			ResultSet rs = st.executeQuery(sql);
			rs.next();
			this.authorID = id;
			this.name = rs.getString("name");
			this.age = rs.getInt("age");
			this.country = rs.getString("country");
		} catch (SQLException se) {
			se.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (st != null)
					st.close();
			} catch (SQLException se2) {
			}
			try {
				if (con != null)
					con.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return this;
	}

	public Author() {
		authorID = 0;
		name = "Author example";
		age = 0;
		country = "Country example";
	}

	public int getAuthorID() {
		return authorID;
	}

	public void setAuthorID(int authorID) {
		this.authorID = authorID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public Book[] getBooks() {
		return books;
	}

	public void setBooks(Book[] books) {
		this.books = books;
	}

	@Override
	public String toString() {
		return "Author [authorID=" + authorID + ", name=" + name + ", age=" + age + ", country=" + country + ", books="
				+ Arrays.toString(books) + "]";
	}
}
