<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>BanYQ's图书管理系统-更新历史</title>
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

	<div class="container">
        <div class="row">
           <div class="col-md-12">
               <div class="query-border" style="padding:100px 100px 100px 100px;">
               		<div class="item-header success-color">
                	</div>
               		<div>
               			<table>
               				<tr>
               					<td rowspan="2">
               						<img src="img/success.png" height="300px" width="300Px" style="float:left" class="img-responsive">
               					</td>
               					<td>
               						<span style="font-size:30px;float:left;">图书已从数据库中删除！！</span>
               					</td>
               				</tr>
               				<tr>
               					<td>
               						<a href="query-book" class="btn btn-lg btn-success">返回</a>
               					</td>
               				</tr>
               			</table>
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
