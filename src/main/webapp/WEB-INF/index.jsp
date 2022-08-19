<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <title>Login/Register</title>
</head>
<body>
    <div class="container">
        <div class="row mt-3">
            <div class="col-lg-6 col-md-6 col-sm-12">
                <div class="card">
                    <h5 class="card-header">REGISTER</h5>
                    <div class="card-body">
                        <form:form action="/users/register" method="POST" modelAttribute="user">
                            <div class="mb-3">
                                <form:label class="form-label" path="firstName">First Name:</form:label>
                                <form:input class="form-control" path="firstName" />
                                <form:errors class="form-text text-danger" path="firstName" />
                            </div>
                            <div class="mb-3">
                                <form:label class="form-label" path="lastName">Last Name:</form:label>
                                <form:input class="form-control" path="lastName" />
                                <form:errors class="form-text text-danger" path="lastName" />
                            </div>
                            <div class="mb-3">
                                <form:label class="form-label" path="email">Email:</form:label>
                                <form:input class="form-control" path="email" />
                                <form:errors class="form-text text-danger" path="email" />
                            </div>
                            <div class="mb-3">
                                <form:label class="form-label" path="password">Password:</form:label>
                                <form:password class="form-control" path="password" />
                                <form:errors class="form-text text-danger" path="password" />
                            </div>
                            <div class="mb-3">
                                <form:label class="form-label" path="confirm">Confirm Password:</form:label>
                                <form:password class="form-control" path="confirm" />
                                <form:errors class="form-text text-danger" path="confirm" />
                            </div>
                            <div class="d-flex justify-content-end">
                                <input type="submit" value="REGISTER" class="btn btn-primary">
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12">
                <div class="card">
                    <h5 class="card-header">LOGIN</h5>
                    <div class="card-body">
                        <form:form action="/users/login" method="POST" modelAttribute="loginUser">
                            <div class="mb-3">
                                <form:label class="form-label" path="email">Email:</form:label>
                                <form:input class="form-control" path="email" />
                                <form:errors class="form-text text-danger" path="email" />
                            </div>
                            <div class="mb-3">
                                <form:label class="form-label" path="password">Password:</form:label>
                                <form:password class="form-control" path="password" />
                                <form:errors class="form-text text-danger" path="password" />
                            </div>
                            <div class="d-flex justify-content-end">
                                <input type="submit" value="LOGIN" class="btn btn-primary">
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>