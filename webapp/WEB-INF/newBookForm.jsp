<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="container bg-dark text-warning w-50 p-3 d-flex justify-content-center">
	<div class="d-flex align-items-centerflex-column  mt-5 ">
		<div class="rounded bg-dark text-warning border w-75 border-warning ps-4 pe-4 pb-2 pt-4 mt-4">
		<h1>New Book</h1>
			<form:form action="/books/new" method="post" modelAttribute="book">
				<form:hidden path="reader" value="${userId}"/>
				<p>
					<form:label path="title">Title</form:label>
					<form:input path="title"/>
					<form:errors path="title"/>
				</p>
				<p>
					<form:label path="authorName">Author Name:</form:label>
					<form:input path="authorName"/>
					<form:errors path="authorName"/>
				</p>
				<p>
					<form:label path="comment">Your Thoughts:</form:label>
					<form:input path="comment"/>
					<form:errors path="comment"/>
				</p>
				<button class="btn btn-warning mt-1 mb-3">Add Book</button>
			</form:form>
		</div>
	</div>
</body>
</html>