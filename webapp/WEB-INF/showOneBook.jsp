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
	<div>
	<h1>Book Details:</h1>
	<div class="card bg-dark text-warning border-warning w-auto">
		<div class="card-header border-warning"><c:out value="${book.title}"></c:out></div>
		<div class="card-body ">
			<h5 class="card-title"><c:out value="${expense.amount}"></c:out></h5>
			<p>Author:
				<c:out value="${book.authorName}"></c:out>
			</p>
			<p>Poster's Thoughts:
				<c:out value="${book.comment}"></c:out>
			</p>
			<a href="https://www.google.com/search?q=${book.title}" class="btn btn-warning">Find out more!</a>
		</div>
		<div class="card-footer text-warning border-warning">Added by: ${book.reader.userName}</div>
	</div>
	<div class="d-flex justify-content-between">
	<a href="/home" class="link-warning">Back to Dashboard</a>
	<a href="/books/${book.id}/edit" class="link-warning">Edit Entry</a>
	</div>
	</div>
</body>
</html>