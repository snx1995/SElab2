package lab2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Result;

public class Book extends ActionSupport{
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String CLOUD_DB_URL = "jdbc:mysql://localhost:3306/bookdb?characterEncoding=UTF-8";
	static final String DB_URL = "jdbc:mysql://bycaiiskjonq.mysql.sae.sina.com.cn:10018/bookdb?characterEncoding=UTF-8";
	static final String USER = "banyq";
	static final String PASSWD = "950714";
	
	private String isbn;
	private String title;
	private Author author;
	private String publisher;
	private String publishDate;
	private double price;
	private int authorID;
	
	public Book(){
		Random random=new Random();
		isbn="000-0-000-00000-0";
		title="Book example"+random.nextInt(100);
		author=new Author();
		publisher="Publisher example";
		publishDate = "0000-00-00";
		price=0;
	}
	
	public String updateBook() throws Exception{
		String result =ERROR;
		Connection con = null;
		Statement st = null;
		try{
			Class.forName(JDBC_DRIVER).newInstance();
			con=DriverManager.getConnection(DB_URL,USER,PASSWD);
			st=con.createStatement();
			SimpleDateFormat s = new SimpleDateFormat("yy-mm-dd");
			String sql = "select * from book where isbn = \"" +isbn + "\"" ;
			sql = "update book set ";
			sql += "title = \"" + title + "\" ";
			sql += ",publisher = \"" + publisher +"\"";
			sql += ",publishdate = \"" +publishDate + "\"";
			sql += ",price=" + price;
			sql += " where isbn = \"" +isbn +"\"";
			st.execute(sql);
			String sql2 = "insert into history(operation)values(\""+new Date()+" : UpdateBook : "+isbn+"\")";
			st.execute(sql2);
			result=SUCCESS;
		}catch(SQLException se){
			result =ERROR;
			se.printStackTrace();
		}catch(Exception e){
			result =ERROR;
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
	
	public String addNewBook() throws Exception{
		String result = ERROR;
		Connection con = null;
		Statement st = null;
		try{
			Class.forName(JDBC_DRIVER).newInstance();
			con=DriverManager.getConnection(DB_URL,USER,PASSWD);
			st=con.createStatement();
			SimpleDateFormat s = new SimpleDateFormat("yy-mm-dd");
			
			String sql = "insert into book(isbn,title,authorid,publisher,publishdate,price)values(\""+isbn+"\",\""+title+"\","+authorID+",\""+publisher+"\""+",\""+publishDate+"\","+price+")";
			st.execute(sql);
			String sql2 = "insert into history(operation)values(\""+new Date()+" : AddNewBook : "+title+"\")";
			st.execute(sql2);
			result = SUCCESS;
		}catch(SQLException se){
			System.out.println("1");
			se.printStackTrace();
			result = ERROR;
		}catch(Exception e){
			System.out.println("2");
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
	
	public String deleteBook() throws Exception{
		Connection con = null;
		Statement st = null;
		try{
			Class.forName(JDBC_DRIVER).newInstance();
			con=DriverManager.getConnection(DB_URL,USER,PASSWD);
			st=con.createStatement();
			String sql = "delete from book where isbn = \""+isbn +"\"";
			String sql2 = "select * from book where isbn = \""+isbn+"\"";
			ResultSet resultSet= st.executeQuery(sql2);
			resultSet.next();
			title = resultSet.getString("title");
			st.execute(sql);
			sql2 = "insert into history(operation)values(\""+new Date()+" : DeleteBook : "+title+"\")";
			st.execute(sql2);
		}catch(SQLException se){
			System.out.println("1");
			se.printStackTrace();
		}catch(Exception e){
			System.out.println("2");
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
	

	
	public int getAuthorID() {
		return authorID;
	}

	public void setAuthorID(int authorID) {
		this.authorID = authorID;
	}

	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Author getAuthor() {
		return author;
	}
	public void setAuthor(Author author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Book [isbn=" + isbn + ", title=" + title + ", author=" + author + ", publisher=" + publisher
				+ ", publishDate=" + publishDate + ", price=" + price + "]";
	}
	
}
