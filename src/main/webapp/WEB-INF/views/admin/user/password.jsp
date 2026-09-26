<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Đổi mật khẩu</title>
</head>

<body>

<h1>Đổi mật khẩu</h1>

<form action="${pageContext.request.contextPath}/admin/user/password"
      method="post">

    <div>
        <label>Mật khẩu hiện tại:</label>

        <input type="password"
               name="currentPassword">
    </div>

    <br>

    <div>
        <label>Mật khẩu mới:</label>

        <input type="password"
               name="newPassword">
    </div>

    <br>

    <div>
        <label>Xác nhận mật khẩu:</label>

        <input type="password"
               name="confirmPassword">
    </div>

    <br>

    <button type="submit">
        Đổi mật khẩu
    </button>

</form>

</body>
</html>