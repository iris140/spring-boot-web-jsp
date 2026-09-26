<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="/common/taglib.jsp" %>

<%@ taglib prefix="decorator"
           uri="http://www.opensymphony.com/sitemesh/decorator" %>

<!DOCTYPE html>

<html lang="vi">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>
        <decorator:title default="Trang quản trị"/>
    </title>


    <!-- Bootstrap 3 -->

    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


    <!-- CSS riêng của từng page nếu có -->

    <decorator:head/>


    <style>

        html,
        body {
            min-height: 100%;
        }

        body {
            margin: 0;

            background: #f5f6f7;

            font-family: Arial, Helvetica, sans-serif;

            color: #333;
        }


        /* =========================
           HEADER
           ========================= */

        .admin-header {
            position: fixed;

            top: 0;
            left: 0;
            right: 0;

            height: 50px;

            background: #28b77b;

            color: #fff;

            z-index: 1000;

            display: flex;
            align-items: center;
        }


        .admin-brand {
            width: 220px;

            padding-left: 20px;

            font-size: 18px;
            font-weight: bold;
        }


        .admin-brand .glyphicon {
            margin-right: 7px;
        }


        .admin-top {
            flex: 1;

            padding-right: 20px;

            text-align: right;

            font-size: 12px;
        }


        .admin-top a {
            margin-left: 15px;

            color: #fff;

            text-decoration: none;
        }


        .admin-top a:hover {
            text-decoration: underline;
        }


        /* =========================
           SIDEBAR
           ========================= */

        .sidebar {
            position: fixed;

            top: 50px;
            left: 0;
            bottom: 0;

            width: 220px;

            background: #fff;

            border-right: 1px solid #ddd;

            overflow-y: auto;
        }


        .sidebar-title {
            padding: 13px 18px;

            color: #999;

            font-size: 11px;
            font-weight: bold;

            text-transform: uppercase;

            border-bottom: 1px solid #eee;
        }


        .sidebar-menu {
            margin: 0;
            padding: 0;

            list-style: none;
        }


        .sidebar-menu li {
            border-bottom: 1px solid #eee;
        }


        .sidebar-menu li a {
            display: block;

            padding: 13px 18px;

            color: #555;

            text-decoration: none;
        }


        .sidebar-menu li a:hover {
            background: #f2faf6;

            color: #28b77b;
        }


        .sidebar-menu li.active a {
            padding-left: 15px;

            background: #e9f8f1;

            border-left: 3px solid #28b77b;

            color: #1d9d68;
        }


        .sidebar-menu .glyphicon {
            width: 25px;
        }


        /* =========================
           CONTENT
           ========================= */

        .main-content {
            min-height: calc(100vh - 50px);

            margin-left: 220px;

            padding: 70px 20px 30px;
        }


        .page-bar {
            margin-bottom: 20px;

            padding: 13px 17px;

            background: #fff;

            border: 1px solid #ddd;
        }


        .page-title {
            font-size: 18px;
            font-weight: bold;
        }


        .breadcrumb-custom {
            float: right;

            color: #999;

            font-size: 12px;
        }


        /* =========================
           DASHBOARD
           ========================= */

        .dashboard-box {
            position: relative;

            min-height: 120px;

            margin-bottom: 20px;

            padding: 20px;

            background: #fff;

            border: 1px solid #ddd;
        }


        .dashboard-box .number {
            color: #28b77b;

            font-size: 32px;
            font-weight: bold;
        }


        .dashboard-box .title {
            margin-top: 5px;

            color: #777;

            font-size: 13px;
        }


        .dashboard-box .icon {
            position: absolute;

            top: 25px;
            right: 20px;

            color: #ddd;

            font-size: 45px;
        }


        .quick-link {
            display: block;

            margin-bottom: 10px;

            padding: 15px;

            background: #fafafa;

            border: 1px solid #eee;

            color: #555;

            text-decoration: none;
        }


        .quick-link:hover {
            background: #f0f9f5;

            color: #1d9d68;

            text-decoration: none;
        }


        .quick-link .glyphicon {
            margin-right: 8px;

            color: #28b77b;
        }


        /* =========================
           USER
           ========================= */

        .search-panel {
            margin-bottom: 20px;

            padding: 15px;

            background: #fff;

            border: 1px solid #ddd;
        }


        .user-panel,
        .edit-panel {
            background: #fff;

            border: 1px solid #ddd;
        }


        .user-panel-header,
        .edit-panel-header {
            padding: 13px 15px;

            background: #fafafa;

            border-bottom: 1px solid #ddd;

            font-weight: bold;
        }


        .user-panel-body {
            padding: 15px;
        }


        .edit-panel-body {
            padding: 25px;
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
        }


        .role-label {
            display: inline-block;

            margin-right: 5px;
            margin-bottom: 3px;
        }


        .empty-data {
            padding: 30px !important;

            text-align: center;

            color: #999;
        }


        /* =========================
           FORM
           ========================= */

        .required {
            color: #d9534f;
        }


        .help-text {
            margin-top: 7px;

            color: #999;

            font-size: 12px;
        }


        .form-footer {
            margin-top: 25px;

            padding-top: 20px;

            border-top: 1px solid #eee;
        }


        .btn-green {
            background: #28b77b;

            border-color: #21a36c;

            color: #fff;
        }


        .btn-green:hover,
        .btn-green:focus {
            background: #209b68;

            color: #fff;
        }


        /* =========================
           FOOTER
           ========================= */

        .admin-footer {
            margin-left: 220px;

            padding: 15px 20px;

            background: #fff;

            border-top: 1px solid #ddd;

            color: #999;

            font-size: 12px;

            text-align: center;
        }


        /* =========================
           RESPONSIVE
           ========================= */

        @media (max-width: 768px) {

            .sidebar {
                width: 60px;
            }


            .sidebar-title {
                display: none;
            }


            .sidebar-menu li a {
                padding-left: 0;
                padding-right: 0;

                text-align: center;
            }


            .sidebar-menu .menu-text {
                display: none;
            }


            .sidebar-menu .glyphicon {
                width: auto;

                font-size: 18px;
            }


            .admin-brand {
                width: 60px;

                padding-left: 18px;

                overflow: hidden;
            }


            .admin-brand-text {
                display: none;
            }


            .main-content,
            .admin-footer {
                margin-left: 60px;
            }


            .breadcrumb-custom {
                display: none;
            }
        }

    </style>

</head>


<body>


<!-- =========================
     HEADER COMMON
     ========================= -->

<%@ include file="/common/admin/header.jsp" %>


<!-- =========================
     MENU COMMON
     ========================= -->

<%@ include file="/common/admin/menu.jsp" %>


<!-- =========================
     NỘI DUNG PAGE
     ========================= -->

<main class="main-content">

    <decorator:body/>

</main>


<!-- =========================
     FOOTER COMMON
     ========================= -->

<%@ include file="/common/admin/footer.jsp" %>


<!-- Bootstrap 3 -->

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</body>

</html>