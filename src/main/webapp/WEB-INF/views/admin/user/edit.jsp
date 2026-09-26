<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"
         language="java" %>

<%@ include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="vi">

<head>

    <meta charset="UTF-8">

    <title>Chỉnh sửa người dùng</title>

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
           EDIT PANEL
           ============================= */

        .edit-panel {
            width: 100%;

            background: #ffffff;

            border: 1px solid #dddddd;
        }

        .edit-panel-header {
            padding: 13px 15px;

            background: #fafafa;

            border-bottom: 1px solid #dddddd;

            font-weight: bold;
        }

        .edit-panel-body {
            padding: 25px;
        }


        /* =============================
           FORM
           ============================= */

        .required {
            color: #d9534f;
        }

        .role-label {
            display: inline-block;

            margin-right: 5px;
            margin-bottom: 4px;

            padding: 5px 8px;
        }

        .field-display {
            padding-top: 7px;
        }

        .help-text {
            margin-top: 7px;

            color: #999999;

            font-size: 12px;
        }

        .form-footer {
            margin-top: 25px;
            padding-top: 20px;

            border-top: 1px solid #eeeeee;
        }


        /* =============================
           BUTTON
           ============================= */

        .btn-green {
            color: #ffffff;

            background: #28b77b;

            border-color: #21a36c;
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

            .edit-panel-body {
                padding: 15px;
            }

            .form-footer {
                margin-top: 15px;
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

        <span class="glyphicon glyphicon-pencil"></span>

        Chỉnh sửa người dùng

    </span>


    <span class="breadcrumb-custom">

        Trang quản trị /
        Người dùng /
        Chỉnh sửa

    </span>


    <div style="clear: both;"></div>

</div>


<!-- =============================
     ERROR
     ============================= -->

<c:if test="${not empty error}">

    <div class="alert alert-danger">

        <span class="glyphicon glyphicon-exclamation-sign"></span>

        <c:out value="${error}"/>

    </div>

</c:if>


<!-- =============================
     EDIT FORM
     ============================= -->

<div class="edit-panel">


    <div class="edit-panel-header">

        <span class="glyphicon glyphicon-user"></span>

        Thông tin tài khoản

    </div>


    <div class="edit-panel-body">


        <form method="post"
              action="${pageContext.request.contextPath}/admin/user/edit/${userId}"
              class="form-horizontal">


            <!-- =============================
                 USERNAME
                 ============================= -->

            <div class="form-group">

                <label class="col-sm-3 control-label"
                       for="userName">

                    Tên tài khoản

                    <span class="required">
                        *
                    </span>

                </label>


                <div class="col-sm-6">

                    <input type="text"
                           id="userName"
                           name="userName"
                           class="form-control"
                           value="<c:out value='${user.userName}'/>"
                           maxlength="100"
                           required>

                    <div class="help-text">

                        Tên tài khoản được sử dụng để đăng nhập hệ thống.

                    </div>

                </div>

            </div>


            <!-- =============================
                 ROLE
                 ============================= -->

            <div class="form-group">

                <label class="col-sm-3 control-label">

                    Quyền hiện tại

                </label>


                <div class="col-sm-6">

                    <div class="field-display">

                        <c:forEach items="${user.roles}"
                                   var="role">

                            <span class="label label-success role-label">

                                <c:out value="${role.code}"/>

                            </span>

                        </c:forEach>


                        <c:if test="${empty user.roles}">

                            <span class="text-muted">

                                Chưa có quyền

                            </span>

                        </c:if>

                    </div>


                    <div class="help-text">

                        Chức năng chỉnh sửa quyền sẽ được xử lý riêng.

                    </div>

                </div>

            </div>


            <!-- =============================
                 PASSWORD
                 ============================= -->

            <div class="form-group">

                <label class="col-sm-3 control-label">

                    Mật khẩu

                </label>


                <div class="col-sm-6">

                    <div class="field-display">

                        ********

                    </div>


                    <div class="help-text">

                        Không thay đổi mật khẩu tại màn hình này.

                    </div>

                </div>

            </div>


            <!-- =============================
                 BUTTONS
                 ============================= -->

            <div class="form-group">

                <div class="col-sm-offset-3 col-sm-6">

                    <div class="form-footer">


                        <button type="submit"
                                class="btn btn-green">

                            <span class="glyphicon glyphicon-floppy-disk"></span>

                            Lưu thay đổi

                        </button>


                        <a href="${pageContext.request.contextPath}/admin/user"
                           class="btn btn-default">

                            <span class="glyphicon glyphicon-arrow-left"></span>

                            Quay lại

                        </a>


                    </div>

                </div>

            </div>


        </form>


    </div>


</div>


</body>

</html>