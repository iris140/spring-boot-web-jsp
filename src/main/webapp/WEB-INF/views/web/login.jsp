<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Login</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f6f9;
        }

        .login-wrapper {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .login-card {
            width: 100%;
            max-width: 380px;
            background: #ffffff;
            padding: 36px;
            border-radius: 10px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
        }

        .login-title {
            margin: 0;
            text-align: center;
            font-size: 28px;
            font-weight: 700;
        }

        .login-description {
            margin: 10px 0 28px;
            text-align: center;
            color: #777777;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            margin-bottom: 7px;
            font-size: 14px;
            font-weight: 600;
        }

        .form-control {
            width: 100%;
            height: 42px;
            padding: 0 12px;
            border: 1px solid #cccccc;
            border-radius: 5px;
            font-size: 14px;
            outline: none;
            transition: 0.2s;
        }

        .form-control:focus {
            border-color: #555555;
            box-shadow: 0 0 0 2px rgba(0, 0, 0, 0.05);
        }

        .btn-login {
            width: 100%;
            height: 44px;
            margin-top: 5px;
            border: none;
            border-radius: 5px;
            background: #222222;
            color: #ffffff;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.2s;
        }

        .btn-login:hover {
            background: #000000;
        }

        .alert {
            padding: 11px 12px;
            margin-bottom: 18px;
            border-radius: 5px;
            font-size: 14px;
        }

        .alert-danger {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        .alert-success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
    </style>
</head>

<body>

<div class="login-wrapper">

    <div class="login-card">

        <h2 class="login-title">LOGIN</h2>

        <p class="login-description">
            Please enter your username and password
        </p>

        <!-- Sai username / password -->
        <c:if test="${not empty param.incorrectAccount}">
            <div class="alert alert-danger">
                Username or password is incorrect.
            </div>
        </c:if>

        <!-- Không có quyền -->
        <c:if test="${not empty param.accessDenied}">
            <div class="alert alert-danger">
                You are not authorized to access this page.
            </div>
        </c:if>

        <!-- Session hết hạn -->
        <c:if test="${not empty param.sessionTimeout}">
            <div class="alert alert-danger">
                Your session has expired. Please login again.
            </div>
        </c:if>

        <!-- Logout thành công -->
        <c:if test="${not empty param.logout}">
            <div class="alert alert-success">
                You have been logged out successfully.
            </div>
        </c:if>

        <form
                id="formLogin"
                method="post"
                action="${pageContext.request.contextPath}/j_spring_security_check">

            <div class="form-group">

                <label for="username">
                    Username
                </label>

                <input
                        type="text"
                        id="username"
                        name="j_username"
                        class="form-control"
                        autocomplete="username"
                        autofocus
                        required>

            </div>

            <div class="form-group">

                <label for="password">
                    Password
                </label>

                <input
                        type="password"
                        id="password"
                        name="j_password"
                        class="form-control"
                        autocomplete="current-password"
                        required>

            </div>

            <button
                    type="submit"
                    class="btn-login">
                Login
            </button>

        </form>

    </div>

</div>

</body>
</html>