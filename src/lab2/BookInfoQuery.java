package lab2;

import java.util.Arrays;
import java.util.Date;
import java.util.Random;

import org.eclipse.jdt.internal.compiler.lookup.ReductionResult;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;

public class BookInfoQuery extends ActionSupport {
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String CLOUD_DB_URL = "jdbc:mysql://localhost:3306/bookdb?characterEncoding=UTF-8";
	static final String DB_URL = "jdbc:mysql://bycaiiskjonq.mysql.sae.sina.com.cn:10018/bookdb?characterEncoding=UTF-8";
	static final String USER = "banyq";
	static final String PASSWD = "950714";

	private String isbn;
	private String title;
	private String publisher;
	private double priceMax;
	private double priceMin;
	private String dateMax;
	private String dateMin;
	private int authorID;
	
	private String[] testData;
	private Book[] bookQueryResult;
	
	public BookInfoQuery(){
		isbn="";
		title="";
		publisher="";
		priceMax = 9999999;
		priceMin = -1;
		dateMax = "3000-12-31";
		dateMin = "1000-01-01";
	}

	public void setTestData(String[] testData) {
		this.testData = testData;
	}

	public String[] getTestData() {
		return this.testData;
	}
	
	public String getAllBookByAuthor()throws Exception{
		Connection con = null;
		Statement st = null;
		try{
			Class.forName(JDBC_DRIVER).newInstance();
			con=DriverManager.getConnection(DB_URL,USER,PASSWD);
			st=con.createStatement();
			String sql = "select * from book where authorid = "+authorID;
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				if(bookQueryResult==null) bookQueryResult = new Book[1];
				else bookQueryResult = Arrays.copyOf(bookQueryResult, bookQueryResult.length+1);
				int l = bookQueryResult.length;
				bookQueryResult[l-1]=new Book();
				bookQueryResult[l-1].setIsbn(rs.getString("isbn"));
				bookQueryResult[l-1].setTitle(rs.getString("title"));
				bookQueryResult[l-1].setAuthor(new Author().setAuthorByID(rs.getInt("authorid")));
				bookQueryResult[l-1].setPublisher(rs.getString("publisher"));
				bookQueryResult[l-1].setPublishDate(rs.getString("publishdate"));
				bookQueryResult[l-1].setPrice(rs.getDouble("price"));
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
	
	public String test() throws Exception {
		String result = ERROR;
		Connection con = null;
		Statement st = null;
		try{
			Class.forName(JDBC_DRIVER).newInstance();
			con=DriverManager.getConnection(DB_URL,USER,PASSWD);
			st=con.createStatement();
			String sql = "select * from book where price>= "+priceMin +" and price<= "+priceMax +" and publishdate >= \""+dateMin+"\" and publishdate<= \"" + dateMax+"\"";
			sql+=isbn.equals("")? "":(" and isbn = \""+isbn+"\"");
			sql+=title.equals("")? "":("and title = \""+title+"\"");
			sql+=publisher.equals("")? "":(" and publisher = \""+publisher+"\"");
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()){
				if(bookQueryResult==null) bookQueryResult = new Book[1];
				else bookQueryResult = Arrays.copyOf(bookQueryResult, bookQueryResult.length+1);
				int l = bookQueryResult.length;
				bookQueryResult[l-1]=new Book();
				bookQueryResult[l-1].setIsbn(rs.getString("isbn"));
				bookQueryResult[l-1].setTitle(rs.getString("title"));
				bookQueryResult[l-1].setAuthor(new Author().setAuthorByID(rs.getInt("authorid")));
				bookQueryResult[l-1].setPublisher(rs.getString("publisher"));
				bookQueryResult[l-1].setPublishDate(rs.getString("publishdate"));
				bookQueryResult[l-1].setPrice(rs.getDouble("price"));
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
	
	public String randBooks() throws Exception{
		Connection con = null;
		Statement st = null;
		try{
			Class.forName(JDBC_DRIVER).newInstance();
			con=DriverManager.getConnection(DB_URL,USER,PASSWD);
			st=con.createStatement();
			String sql = "select * from book";
			ResultSet rs = st.executeQuery(sql);
			Book[] bookQueryTmp = null;
			while(rs.next()){
				if(bookQueryTmp==null) bookQueryTmp = new Book[1];
				else bookQueryTmp = Arrays.copyOf(bookQueryTmp, bookQueryTmp.length+1);
				int l = bookQueryTmp.length;
				bookQueryTmp[l-1]=new Book();
				bookQueryTmp[l-1].setIsbn(rs.getString("isbn"));
				bookQueryTmp[l-1].setTitle(rs.getString("title"));
				bookQueryTmp[l-1].setAuthor(new Author().setAuthorByID(rs.getInt("authorid")));
				bookQueryTmp[l-1].setPublisher(rs.getString("publisher"));
				bookQueryTmp[l-1].setPublishDate(rs.getString("publishdate"));
				bookQueryTmp[l-1].setPrice(rs.getDouble("price"));
			}
			Random random = new Random();
			int blength = bookQueryTmp.length;
			if(blength>5){
				bookQueryResult = new Book[5];
				for(int i=0;i<5;i++){
					int j=random.nextInt(blength);
					while(bookQueryTmp[j]==null){
						j=random.nextInt(blength);
					}
					bookQueryResult[i]=bookQueryTmp[j];
					bookQueryTmp[j]=null;
				}
			}
			else bookQueryResult=bookQueryTmp;
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

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public double getPriceMax() {
		return priceMax;
	}

	public void setPriceMax(double priceMax) {
		this.priceMax = priceMax;
	}

	public double getPriceMin() {
		return priceMin;
	}

	public void setPriceMin(double priceMin) {
		this.priceMin = priceMin;
	}

	public String getDateMax() {
		return dateMax;
	}

	public void setDateMax(String dateMax) {
		this.dateMax = dateMax.equals("")? "3000-12-31":dateMax;
	}

	public String getDateMin() {
		return dateMin;
	}

	public void setDateMin(String dateMin) {
		this.dateMin = dateMin.equals("")? "1000-01-01":dateMin;
	}

	public Book[] getBookQueryResult() {
		return bookQueryResult;
	}

	public void setBookQueryResult(Book[] bookQueryResult) {
		this.bookQueryResult = bookQueryResult;
	}

	@Override
	public String toString() {
		return "BookInfoQuery [isbn=" + isbn + ", title=" + title + ", publisher=" + publisher + ", priceMax="
				+ priceMax + ", priceMin=" + priceMin + ", dateMax=" + dateMax + ", dateMin=" + dateMin + "]";
	}

}
