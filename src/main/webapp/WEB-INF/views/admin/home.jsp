<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <title>Trang quản trị</title>
</head>

<body>

<div class="page-bar">

    <span class="page-title">
        <span class="glyphicon glyphicon-dashboard"></span>
        Dashboard
    </span>

    <span class="breadcrumb-custom">
        Trang quản trị / Dashboard
    </span>

    <div style="clear:both;"></div>

</div>


<div class="row">

    <div class="col-md-3 col-sm-6">

        <div class="dashboard-box">

            <div class="number">
                0
            </div>

            <div class="title">
                Tòa nhà
            </div>

            <span class="glyphicon glyphicon-home icon"></span>

        </div>

    </div>


    <div class="col-md-3 col-sm-6">

        <div class="dashboard-box">

            <div class="number">
                0
            </div>

            <div class="title">
                Nhân viên
            </div>

            <span class="glyphicon glyphicon-user icon"></span>

        </div>

    </div>


    <div class="col-md-3 col-sm-6">

        <div class="dashboard-box">

            <div class="number">
                0
            </div>

            <div class="title">
                Khách hàng
            </div>

            <span class="glyphicon glyphicon-briefcase icon"></span>

        </div>

    </div>


    <div class="col-md-3 col-sm-6">

        <div class="dashboard-box">

            <div class="number">
                0
            </div>

            <div class="title">
                Giao dịch
            </div>

            <span class="glyphicon glyphicon-list-alt icon"></span>

        </div>

    </div>

</div>


<div class="row">

    <div class="col-md-7">

        <div class="panel panel-default">

            <div class="panel-heading">
                <span class="glyphicon glyphicon-th-large"></span>
                Chức năng quản trị
            </div>

            <div class="panel-body">

                <div class="row">

                    <div class="col-sm-6">

                        <a href="${pageContext.request.contextPath}/admin/user"
                           class="quick-link">

                            <span class="glyphicon glyphicon-user"></span>

                            Quản lý người dùng

                        </a>

                    </div>
                    <div class="col-sm-6">

                        <a href="${pageContext.request.contextPath}/admin/user"
                           class="quick-link">

                            <span class="glyphicon glyphicon-user"></span>

                            Quản lý người dùng

                        </a>

                    </div>

                </div>

            </div>

        </div>

    </div>


    <div class="col-md-5">

        <div class="panel panel-default">

            <div class="panel-heading">
                <span class="glyphicon glyphicon-info-sign"></span>
                Thông tin hệ thống
            </div>

            <div class="panel-body">

                <table class="table table-bordered">

                    <tr>

                        <td>
                            Người đăng nhập
                        </td>

                        <td>
                            <strong>
                                ${pageContext.request.userPrincipal.name}
                            </strong>
                        </td>

                    </tr>

                    <tr>

                        <td>
                            Trạng thái
                        </td>

                        <td>
                            <span class="label label-success">
                                Đang hoạt động
                            </span>
                        </td>

                    </tr>

                </table>

            </div>

        </div>

    </div>

</div>

</body>

</html>