<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Thông tin cá nhân</title>
</head>

<body>

<h1>Thông tin cá nhân</h1>

<table border="1" cellpadding="8" cellspacing="0">

    <tr>
        <th>ID</th>
        <td>${user.id}</td>
    </tr>

    <tr>
        <th>Tên đăng nhập</th>
        <td>${user.username}</td>
    </tr>

    <tr>
        <th>Họ tên</th>
        <td>${user.fullname}</td>
    </tr>

    <tr>
        <th>Email</th>
        <td>${user.email}</td>
    </tr>

    <tr>
        <th>Số điện thoại</th>
        <td>${user.phone}</td>
    </tr>

</table>

<br>

<a href="${pageContext.request.contextPath}/admin/user/edit/${user.id}">
    Chỉnh sửa thông tin
</a>

&nbsp; | &nbsp;

<a href="${pageContext.request.contextPath}/admin/user/password">
    Đổi mật khẩu
</a>

</body>
</html>