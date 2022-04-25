<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login and Register</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="container bg-dark text-warning w-50 p-3 d-flex justify-content-around">
	<div class="d-flex align-items-centerflex-column  mt-5 ">
		<div class="rounded bg-dark text-warning border w-75 border-warning ps-4 pe-4 pb-2 pt-4 mt-4">
		<h1>Register</h1>
			<form:form action="/register" method="post" modelAttribute="newUser">
				<p>
					<form:label path="userName">Username:</form:label>
					<form:input path="userName"/>
					<form:errors path="userName"/>
				</p>
				<p>
					<form:label path="email">Email:</form:label>
					<form:input path="email"/>
					<form:errors path="email"/>
				</p>
				<p>
					<form:label path="password">Password:</form:label>
					<form:password path="password"/>
					<form:errors path="password"/>
				</p>
				<p>
					<form:label path="confirm">Confirm Password:</form:label>
					<form:password path="confirm"/>
					<form:errors path="confirm"/>
				</p>
				<button class="btn btn-warning mt-1 mb-3">Register</button>
			</form:form>
		</div>
	</div>
	<div class="d-flex align-items-centerflex-column  mt-5 ">
		<div class="rounded bg-dark text-warning border w-75 h-75 border-warning ps-4 pe-4 pb-2 pt-4 mt-4">
		<h1>Login</h1>
			<form:form action="/login" method="post" modelAttribute="newLogin">
				<p>
					<form:label path="email">Email:</form:label>
					<form:input path="email"/>
					<form:errors path="email"/>
				</p>
				<p>
					<form:label path="password">Password:</form:label>
					<form:password path="password"/>
					<form:errors path="password"/>
				</p>
				<button class="btn btn-warning mt-1 mb-3">Login</button>
			</form:form>
		</div>
	</div>
</body>
</html>