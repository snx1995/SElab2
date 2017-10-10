<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>BanYQ's图书管理系统-书目检索</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<script>
		function showUpdate(id){
			var window = document.getElementById(id);
			window.style.visibility="visible";
		}
		
		function hideUpdate(id){
			var window = document.getElementById(id);
			window.style.visibility="hidden";
		}
		
		function checkNewInput(f){
			var numRegx = /^\d+\.?\d*$/;
			var num = document.getElementById("newPrice").value;
			var publisher = document.getElementById("newPublisher").value;
			var publishDate = document.getElementById("newPublishDate").value;
			var title = document.getElementById("newTitle").value;
			if(num!=""&&!numRegx.test(num)){
				alert("请输入正确的价格！");
			}
			else if(num==""||publisher==""||publishDate==""||title==""){
				alert("所有项目均为必填！")
			}
			else{
				f.form.submit();
			}
		}
	
	</script>
	
    <link rel="manifest" href="site.webmanifest">
    <link rel="apple-touch-icon" href="icon.png">
    <!-- Place favicon.ico in the root directory -->

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="lab2_2.css">
</head>
<body style="background-color: rgb(248,248,248)">
    <!--[if lte IE 9]>
    <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
    <![endif]-->

    <!-- Add your site or application content here -->
    <header role="banner">
        <nav role="navigation" class="navbar navbar-static-top navbar-default">

            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse"
                            data-target=".navbar-collapse">
                        <span class="icon-bar"></span> <span class="icon-bar"></span> <span
                        class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="main"><img
                        src="logo/logo.png" alt="BanYQ" width="120px"></a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="main" >首页</a></li>
                        <li class="active"><a href="query-tab" >书目检索</a></li>
                        <li><a href="manage-tab">添加新项</a></li>
                        <li><a href="history-tab">更新历史</a></li>
                        <li><a href="about-tab">关于网站</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <div>
        <div class="img-main">
            <img class="img-responsive" src="img/query.png" alt="1">
        </div>
        <div class="white-region"></div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-8">
            	<s:iterator value="authorQueryResult" var="author">
            		<div class="book-item margin-top30">
            			<div class="item-header query-color">
            			 </div>
            			 <div class="author-info">
            				<table width="95%" height="95%" align="center">
            					<tr>
            						<td rowspan="5">
            							<img alt="1" src="img/authorTmp2.png" width="160px" height="160px">
            						</td>
            					</tr>
            					<tr>
            						<td>
            							<h3>${author.name }</h3>
            						</td>
            					</tr>
            					<tr>
            						<td>
            							<span>年龄：${author.age }</span>
            						</td>
            					</tr>
            					<tr>
            						<td>
            							<span>国籍：${author.country }</span>
            						</td>
            					</tr>
            					<tr>
            						<td>
            							<a href="query-all-books?authorID=${author.authorID }" class="btn btn-default">全部作品</a>
            						</td>
            					</tr>
            				</table>
            			</div>
            		</div>
            	</s:iterator>
            
            	<s:iterator value="bookQueryResult" var="book">
            		<div class="update-window" id="${book.isbn}">
            		<div class="item-header query-color">
					</div>
						<form action="update-book">
							<table class="table">
								<tr>
									<td colspan="2">
										<h3>更新图书信息</h3>
									</td>
								</tr>
								<tr>
									<td>
										ISBN:
									</td>
									<td>
										<input type="text" class="form-control input-md"  name="isbn"  readonly="readonly" value="${book.isbn }">
									</td>
								</tr>
								<tr>
									<td>
										书名：
									</td>
									<td>
										<input type="text" class="form-control input-md"  name="title"  id="newTitle" placeholder="请输入新书名(必填)">
									</td>
								</tr>
								<tr>
									<td>
										出版社：
									</td>
									<td>
										<input type="text" class="form-control input-md"  name="publisher" id="newPublisher" placeholder="请输入新出版社(必填)">
									</td>
								</tr>
								<tr>
									<td>
										出版日期：
									</td>
									<td>
										<input type="date" class="form-control input-md"  name="publishDate" id="newPublishDate" placeholder="请输入新出版日期(必填)">
									</td>
								</tr>
								<tr>
									<td>
										价格：
									</td>
									<td>
										<input type="text" class="form-control input-md"  id="newPrice" name="price" placeholder="请输入新价格(必填)">
									</td>
								</tr>
							</table>
							<input type="button" class="btn btn-default pull-right"  onclick="checkNewInput(this)" value="确认">
							<input type="button" class="btn btn-default pull-right" onclick="hideUpdate('${book.isbn}')" value="取消">
							<input type="reset" class="btn btn-default pull-right" value="重置">
						</form>
					</div>
            	
            		<div class="book-item margin-top30">
                    <div class="item-header query-color">
                    	<div class="dropdown  pull-right">
                    		<a href="#" data-toggle="dropdown" class="dropdown-toggle btn item-option">Options<b class="caret"></b></a>
                    		<ul class="dropdown-menu">
                    			<li><a class="btn" onclick="showUpdate('${book.isbn}')">update</a></li>
                    			<li><a href="delete-book?isbn=${book.isbn }" class="btn">delete</a></li>
                    			<li><a href="query-author?name=${author.name}&ageMin=${author.age}&ageMax=${author.age}&country=${author.country}" class="btn">about author</a></li>
                    		</ul>
                    	</div>
                    </div>
                    <div class="book-info">
                        <table width="95%" height="95%" align="center">
                            <tr>
                                <td colspan="2" rowspan="5">
                                    <img src="img/bookTmp2.png" width="160px" height="160px">
                                </td>
                                <td colspan="2"><h3>${book.title }</h3></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <span>作者 : <a href="query-author?name=${author.name}&ageMin=${author.age}&ageMax=${author.age}&country=${author.country}" class="btn btn-default">${book.author.name }</a></span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <span>出版社 : ${book.publisher }</span>
                                </td>
                            </tr>
                            <tr>
                            	 <td colspan="2">
                            			<span>ISBN : ${book.isbn }</span>
                            	</td>
                            </tr>
                            <tr>
                                <td>
                                    <span>出版日期: ${book.publishDate }</span>
                                </td>
                                <td>
                                    <span>价格：${book.price }</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                </s:iterator>
            </div>

            <div class="col-md-4 query-result margin-top10">
                <div class="book-item">
                    <div class="item-header query-color">
                    </div>
                    <div class="query-padding">
                        <ul class="nav">
                            <li>
                                <a href="query-book" class="btn btn-default btn-lg">全部书籍</a>
                            </li>
                            <br>
                            <li>
                                <a href="query-author" class="btn btn-default btn-lg">全部作者</a>
                            </li>
                            <br>
                            <li>
                                <a href="rand-books" class="btn btn-default btn-lg">随便看看</a>
                            </li>
                            <br>
                            <li>
                                <a href="query-tab" class="btn btn-default btn-lg">重新检索</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>






    <footer role="contentinfo" class="panel-footer darkfooter">
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="footer-title">
                        <p>关于实验2</p>
                        <hr class="footer-divide">
                    </div>

                    <div class="foot-tab">
                        <p>掌握MVC框架下的SaaS开发的基本流程</p>
                    </div>
                    <div class="foot-tab">
                        <p>在Eclipse中配置Struts开发环境，开发一个小型SaaS，在web页面中对数据库的数据进行CRUD操作</p>
                    </div>
                    <div class="foot-tab">
                        <p>部署在自选的公共云平台上并对外发布，模拟用户访问</p>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="footer-title">
                        <p>联系方式</p>
                        <hr class="footer-divide">
                    </div>

                    <div class="foot-tab">
                        <p>EMAIL：snx1788@gmail.com</p>
                    </div>
                    <div class="foot-tab">
                        <p>Github :  <a class="btn btn-default" href="https://github.com/snx1995" target="-blank">我的首页</a></p>
                    </div>
                    <div class="foot-tab">
                        <p>CSDN   : <a class="btn btn-default" href="http://blog.csdn.net/cfmy_ban" target="-blank">我的博客</a> </p>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="footer-title">
                        <p>其他</p>
                        <hr class="footer-divide">
                    </div>

                    <div class="foot-tab">
                        <p>本站前端基于bootstrap，图片等资源均为原创~</p>
                    </div>
                    <div class="foot-tab">
                        <p>Copyright &copy; Ban Yaoqiang's Lab2</p>
                    </div>
                    <div class="foot-tab">
                        <p>没什么可说的了，提前祝大家新年快乐吧~</p>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous"></script>
    <script>
        window.jQuery
        || document
            .write('<script src="js/vendor/jquery-3.2.1.min.js"><\/script>')
    </script>
    <!--<script src="js/plugins.js"></script>  -->

    <!-- Google Analytics: change UA-XXXXX-Y to be your site's ID. -->
    <script>
        window.ga = function() {
            ga.q.push(arguments)
        };
        ga.q = [];
        ga.l = +new Date;
        ga('create', 'UA-XXXXX-Y', 'auto');
        ga('send', 'pageview')
    </script>
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="bootstrap.min.js"></script>
</body>
</html>
