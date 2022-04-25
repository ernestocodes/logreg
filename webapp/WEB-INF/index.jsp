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
	<h1>Welcome, <c:out value="${userName}"></c:out>!</h1>
	<p>This is your dashboard!</p>
	<table class="table table-bordered">
		<tbody>
			<tr class="text-warning">
				<th scope="col">ID</th>
				<th scope="col">Title</th>
				<th scope="col">Author Name</th>
				<th scope="col">Posted By</th>
				<th scope="col">Actions</th>
			</tr>
			<c:forEach var="book" items="${books}">
				<tr class="text-warning">
					<td><c:out value="${book.id}"></c:out></td>
					<td><a class="text-warning" href="/books/${book.id}"><c:out value="${book.title}"></c:out></a></td>
					<td><c:out value="${book.authorName}"></c:out></td>
					<td><c:out value="${book.reader.userName}"></c:out></td>
					<td class="d-flex flex-nowrap"><a href="/books/${book.id}/edit" class="text-warning mt-2">Edit</a> 
					<form action="/books/${book.id}/delete" method="post">
					<input type="hidden" name="_method" value="delete" />
					<button class="btn btn-link text-warning text-center">Delete</button>
					</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="/books/new" class="link-warning">Add a book</a>
	<a href="/logout" class="link-warning">Logout</a>
	</div>
</body>
</html>