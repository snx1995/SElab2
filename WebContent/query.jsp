<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>BanYQ's图书管理系统-书目检索</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

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
        <div class="white-region">
        </div>
    </div>

    <div class="container query">
        <div class="row">
            <div class="col-md-8 query-result">
            	<div class="query-border">
            		<div class="item-header query-color">
            		</div>
	            		<div class="query-optons">
	            			<ul class="nav nav-tabs nav-justified">
		                        <li class="active"><a href="#book" data-toggle="tab"><span>按图书</span></a></li>
		                        <li><a href="#author" data-toggle="tab"><span>按作者</span></a></li>
		                    </ul>
		                    <div class="tab-content">
		                        <div class="tab-pane fade in active query-option-padding" id="book">
		                            <form action="query-book">
		                                <table align="center" width="95%" cellpadding="10" cellspacing="10" class="table">
		                                    <tr>
		                                        <td>ISBN :</td>
		                                    </tr>
		                                    <tr>
		                                        <td colspan="7">
		                                            <input type="text" class="form-control input-md" name="isbn" id="ISBN">
		                                        </td>
		                                    </tr>
		                                    <tr>
		                                        <td>书名 :</td>
		                                    </tr>
		                                    <tr>
		                                        <td colspan="7">
		                                            <input type="text" class="form-control input-md" name="title" id="Title">
		                                        </td>
		                                    </tr>
		                                    <tr>
		                                        <td>出版社 :</td>
		                                    </tr>
		                                    <tr>
		                                        <td colspan="7">
		                                            <input type="text" class="form-control input-md" name="publisher" id="Publisher">
		                                        </td>
		                                    </tr>
		                                    <tr>
		                                        <td colspan="4">价格区间 ：</td>
		                                        <td colspan="3">出版时间区间：</td>
		                                    </tr>
		                                    <tr>
		                                        <td>
		                                            <input type="text" class="form-control input-md" name="priceMin" id="PriceMin">
		                                        </td>
		                                        <td><span>~</span></td>
		                                        <td>
		                                            <input type="text" class="form-control input-md" name="priceMax" id="PriceMax">
		                                        </td>
		                                        <td><p>&nbsp;</p></td>
		                                        <td>
		                                            <input type="date" class="form-control input-md" name="dateMin" id="DateMin">
		                                        </td>
		                                        <td><span>~</span></td>
		                                        <td>
		                                            <input type="date" class="form-control input-md" name="dateMax" id="DateMax">
		                                        </td>
		                                    </tr>
		                                    <tr>
		                                        <td colspan="7">
		                                            <span>***以上选项均为选填，全不填则查询所有图书~</span>
		                                        </td>
		                                    </tr>
		                                </table>
		                                <br>
		                                <input type="button" class="btn btn-default btn-lg pull-right"  onclick="checkBookQuery(this)" value="检索">
		                                <input type="reset" class="btn btn-default btn-lg pull-right" value="重置">
		                            </form>
		                        </div>
		                        <div class="tab-pane fade query-option-padding" id="author">
		                            <form action="query-author">
		                                <table align="center" width="95%" cellpadding="10" cellspacing="10" class="table">
		                                    <tr>
		                                        <td>作者姓名 ：</td>
		                                    </tr>
		                                    <tr>
		                                        <td colspan="7">
		                                            <input type="text" class="form-control input-md" name="name" id="AuthorName">
		                                        </td>
		                                    </tr>
		                                    <tr>
		                                        <td>年龄区间 ：</td>
		                                    </tr>
		                                    <tr>
		                                        <td>
		                                            <input type="text" class="form-control input-md" name="ageMin" id="AgeMin">
		                                        </td>
		                                        <td>
		                                        	<span>&nbsp;~&nbsp;</span>
		                                        </td>
		                                        <td>
		                                            <input type="text" class="form-control input-md" name="ageMax" id="AgeMax">
		                                        </td>
		                                    </tr>
		                                    <tr>
		                                        <td>国籍 ：</td>
		                                    </tr>
		                                    <tr>
		                                        <td colspan="7">
		                                            <input type="text" class="form-control input-md" name="country" id="Country">
		                                        </td>
		                                    </tr>
		                                </table>
		                                <br><br><br>
		                                <span>***以上选项均为选填，全不填则查找所有作者</span><br>
		                                <input type="button" class="btn btn-default btn-lg pull-right"  onclick="checkAuthorQuery(this)" value="检索">
		                                <input type="reset" class="btn btn-default btn-lg pull-right" value="重置">
		                            </form>
		                        </div>
	            		</div>
	            	</div>
	            </div>
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
    <script src="lab2.js"></script>
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="bootstrap.min.js"></script>
</body>
</html>
