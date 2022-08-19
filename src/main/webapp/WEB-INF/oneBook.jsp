<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
  </head>
  <body>
    <div class="row">
      <div class="col">
        <div class="text-center card mt-5">
          <div class="card-header">
            <h1>${book.title}</h1>
            <div class="card-body">
              <h3>Here are ${book.user.firstName}'s thoughts</h3>
              <p>${book.comments}</p>
            </div>
            <a class="btn btn-secondary" href="/book/${id}/edit">Edit Book</a>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
