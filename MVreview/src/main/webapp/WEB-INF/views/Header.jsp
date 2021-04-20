<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<style type="text/css">

.blog-header {
  line-height: 1;
  border-bottom: 1px solid #e5e5e5;
}

.blog-header-logo {
  font-family: "Playfair Display", Georgia, "Times New Roman", serif/*rtl:Amiri, Georgia, "Times New Roman", serif*/;
  font-size: 4.25rem;
  color: black;
}

.blog-header-logo:hover {
  text-decoration: none;
}



.nav-scroller {
  position: relative;
  z-index: 2;
  height: 2.75rem;
  overflow-y: hidden;
}

.nav-scroller .nav {
  display: flex;
  flex-wrap: nowrap;
  padding-bottom: 1rem;
  margin-top: -1px;
  overflow-x: auto;
  text-align: center;
  white-space: nowrap;
  -webkit-overflow-scrolling: touch;
  color: black;
}

.nav-scroller .nav-link {
  padding-top: .75rem;
  padding-bottom: .75rem;
  font-size: .875rem;
  
  
}


</style>
</head>
<body>
	<header class="blog-header py-3">
		<div class="row flex-nowrap justify-content-between align-items-center"align="center">
			<div class="col-4 pt-1">
				<a class="link-secondary" href="/"> <img
					src="<spring:url value ='#'/>" height="70"
					alt="로고출력자리"></a>
			</div>
			<div class="col-4 text-center">
				<a class="blog-header-logo text=dark" href="/">MVreview</a>
			</div>
			<div class="col-4 d-flex justify-content-end align-items-left" >
				<a class="btn btn-lg btn-outline-secondary" href="#">Login</a>
			</div>
		</div>
	</header>
	<div class="nav-scroller py-1 mb-2"align="center">
		<nav class="nav d-flex justify-content-between">
		<a class="p-2 link-secondary" ></a>
		<a class="p-2 link-secondary" ></a>
		<a class="p-2 link-secondary" ></a>
		<a class="p-2 link-secondary" href="/">Home</a>
		<a class="p-2 link-secondary" href="#">Movie</a>
		<a class="p-2 link-secondary" href="#">Movie Post</a>
		<a class="p-2 link-secondary" href="#">Sign Up</a>
		<a class="p-2 link-secondary" ></a>
		<a class="p-2 link-secondary" ></a>
		<a class="p-2 link-secondary" ></a>
		</nav>
	</div>
</body>
</html>
