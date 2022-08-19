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
    <title>Insert Book</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
  </head>
  <body>
    <div class="container">
      <div class="mt-5 row justify-content-center">
          <div class="mt-5 col-6 text-white">
          <div class="card bg-dark">
            <div class="card-header">
              <h2 class="text-center">Edit your Book!</h2>
            </div>
            <div class="card-body">
              <form:form
                action="/book/${book.id}/update"
                method="post"
                modelAttribute="book"
              >
              <input type="hidden" name="_method" value="put">
                <div class="mb-3">
                  <form:label class="form-label" path="title">Title</form:label>
                  <form:input class="form-control" path="title" />
                  <form:errors class="text-danger form-text" path="title" />
                </div>
                <div class="mb-3">
                  <form:label class="form-label" path="author">Author</form:label>
                  <form:input class="form-control" path="author" />
                  <form:errors class="text-danger form-text" path="author" />
                </div>
                <div class="mb-3">
                  <form:label class="form-label" path="comments"
                    >Comments</form:label
                  >
                  <form:textarea class="form-control" path="comments" />
                  <form:errors class="text-danger form-text" path="comments" />
                </div>
                <div class="d-flex justify-content-right">
                  <button type="submit">Edit Book</button>
                </div>
                <input type="hidden" name="user" value="${userId}">
              </form:form>
              <form action="/book/${book.id}/delete" method="post">
                <div class="d-flex flex-nowrap">
                  <input type="hidden" name="_method" value="delete">
                  <input class="btn btn-primary" type="submit" value="DELETE BOOK">
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
