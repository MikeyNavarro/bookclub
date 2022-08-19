<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> <%@
taglib prefix="form" uri="http://www.springframework.org/tags/form"%> <%@ page
isErrorPage="true" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <title>Books</title>
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-3">
      <div class="container">
        <span class="navbar-brand mb-0 h1">Welcome, ${user.firstName}</span>
        <a href="/users/logout" class="btn btn-danger btn-sm">LOGOUT</a>
      </div>
    </nav>
    <div class="col">
      <div class="row">
        <div class="card">
          <div class="card-header">
            <h5 class="mt-5 text-center align-items-center">
              Books from everyone's shelves:
            </h5>
            <div class="d-flex justify-content-end">
              <a class="" href="/book/create">Add A Book!</a>
            </div>
          </div>
          <div class="card-body">
            <table class="table table-stripped table-dark">
              <thead>
                <th>ID</th>
                <th>Title</th>
                <th>Author Name</th>
                <th>Posted By</th>
              </thead>
              <tbody>
                <c:forEach var="book" items="${allBooks}">
                  <tr>
                    <td>${book.id}</td>
                    <td><a href="/book/${book.id}/show">${book.title}</a></td>
                    <td>${book.author}</td>
                    <td>${book.user.firstName}</td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    <div class="container"></div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
