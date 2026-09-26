<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"
         language="java" %>

<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">

<head>

    <meta charset="UTF-8">

    <title>Quản lý người dùng</title>

    <style>

        /* =============================
           PAGE HEADER
           ============================= */

        .page-bar {
            margin-bottom: 20px;
            padding: 13px 17px;

            background: #ffffff;

            border: 1px solid #dddddd;
        }

        .page-title {
            font-size: 18px;
            font-weight: bold;
        }

        .breadcrumb-custom {
            float: right;

            color: #999999;

            font-size: 12px;
        }


        /* =============================
           SEARCH
           ============================= */

        .search-panel {
            margin-bottom: 20px;
            padding: 15px;

            background: #ffffff;

            border: 1px solid #dddddd;
        }

        .search-panel label {
            font-size: 12px;
        }

        .search-actions {
            padding-top: 19px;
        }


        /* =============================
           USER TABLE
           ============================= */

        .user-panel {
            width: 100%;

            background: #ffffff;

            border: 1px solid #dddddd;
        }

        .user-panel-header {
            padding: 13px 15px;

            background: #fafafa;

            border-bottom: 1px solid #dddddd;

            font-weight: bold;
        }

        .user-panel-body {
            padding: 15px;
        }

        .table {
            width: 100%;
            margin-bottom: 0;
        }

        .table > thead > tr > th {
            background: #f7f7f7;

            vertical-align: middle;
        }

        .table > tbody > tr > td {
            vertical-align: middle;
        }

        .column-number {
            width: 60px;

            text-align: center;
        }

        .column-action {
            width: 180px;

            text-align: center;
            white-space: nowrap;
        }

        .role-label {
            display: inline-block;

            margin-right: 4px;
            margin-bottom: 3px;
        }

        .empty-data {
            padding: 30px !important;

            text-align: center;

            color: #999999;
        }


        /* =============================
           BUTTON
           ============================= */

        .btn-green {
            color: #ffffff;

            background: #28b77b;

            border-color: #23a66f;
        }

        .btn-green:hover,
        .btn-green:focus {
            color: #ffffff;

            background: #209b68;

            border-color: #1d8c5e;
        }


        /* =============================
           RESPONSIVE
           ============================= */

        @media (max-width: 767px) {

            .breadcrumb-custom {
                float: none;

                display: block;

                margin-top: 8px;
            }

            .search-actions {
                padding-top: 10px;
            }

        }

    </style>

</head>

<body>


<!-- =============================
     PAGE TITLE
     ============================= -->

<div class="page-bar">

    <span class="page-title">

        <span class="glyphicon glyphicon-user"></span>

        Quản lý người dùng

    </span>


    <span class="breadcrumb-custom">

        Trang quản trị / Người dùng

    </span>


    <div style="clear: both;"></div>

</div>


<!-- =============================
     SEARCH
     ============================= -->

<div class="search-panel">

    <div class="row">


        <div class="col-md-8 col-sm-8">

            <label for="keyword">
                Tìm kiếm
            </label>

            <input type="text"
                   id="keyword"
                   class="form-control"
                   placeholder="Nhập tên tài khoản..."
                   onkeyup="filterUsers()">

        </div>


        <div class="col-md-4 col-sm-4">

            <div class="search-actions">

                <button type="button"
                        class="btn btn-green"
                        onclick="filterUsers()">

                    <span class="glyphicon glyphicon-search"></span>

                    Tìm kiếm

                </button>


                <button type="button"
                        class="btn btn-default"
                        onclick="clearSearch()">

                    <span class="glyphicon glyphicon-refresh"></span>

                    Làm mới

                </button>

            </div>

        </div>


    </div>

</div>


<!-- =============================
     USER LIST
     ============================= -->

<div class="user-panel">


    <div class="user-panel-header">

        <span class="glyphicon glyphicon-list"></span>

        Danh sách người dùng

    </div>


    <div class="user-panel-body">


        <div class="table-responsive">


            <table id="userTable"
                   class="table table-bordered table-hover">


                <thead>

                <tr>

                    <th class="column-number">
                        STT
                    </th>

                    <th>
                        Tên tài khoản
                    </th>

                    <th>
                        Quyền
                    </th>

                    <th class="column-action">
                        Thao tác
                    </th>

                </tr>

                </thead>


                <tbody>


                <c:forEach items="${users}"
                           var="user"
                           varStatus="status">

                    <tr>


                        <td class="column-number">

                            ${status.index + 1}

                        </td>


                        <td class="user-name">

                            <strong>
                                <c:out value="${user.userName}"/>
                            </strong>

                        </td>


                        <td>

                            <c:forEach items="${user.roles}"
                                       var="role">

                                <span class="label label-success role-label">

                                    <c:out value="${role.code}"/>

                                </span>

                            </c:forEach>

                        </td>


                        <td class="column-action">


                            <a href="${pageContext.request.contextPath}/admin/user/edit/${user.id}"
                               class="btn btn-primary btn-xs">

                                <span class="glyphicon glyphicon-pencil"></span>

                                Sửa

                            </a>


                            <a href="${pageContext.request.contextPath}/admin/user/profile/${user.id}"
                               class="btn btn-default btn-xs">

                                <span class="glyphicon glyphicon-eye-open"></span>

                                Chi tiết

                            </a>


                        </td>


                    </tr>

                </c:forEach>


                <c:if test="${empty users}">

                    <tr>

                        <td colspan="4"
                            class="empty-data">

                            Không có dữ liệu người dùng.

                        </td>

                    </tr>

                </c:if>


                </tbody>


            </table>


        </div>


    </div>


</div>


<!-- =============================
     SEARCH SCRIPT
     ============================= -->

<script>

    function filterUsers() {

        var keyword = document
            .getElementById("keyword")
            .value
            .toLowerCase()
            .trim();


        var table = document.getElementById("userTable");


        var rows = table
            .getElementsByTagName("tbody")[0]
            .getElementsByTagName("tr");


        for (var i = 0; i < rows.length; i++) {

            var userNameCell =
                rows[i].querySelector(".user-name");


            /*
             * Dòng "Không có dữ liệu" không có class user-name.
             */
            if (!userNameCell) {
                continue;
            }


            var userName = userNameCell
                .textContent
                .toLowerCase();


            if (userName.indexOf(keyword) !== -1) {

                rows[i].style.display = "";

            } else {

                rows[i].style.display = "none";

            }

        }

    }


    function clearSearch() {

        document.getElementById("keyword").value = "";

        filterUsers();

        document.getElementById("keyword").focus();

    }

</script>


</body>

</html>