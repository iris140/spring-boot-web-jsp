<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"
         language="java" %>

<%@ include file="/common/taglib.jsp" %>

<c:set var="editMode"
       value="${not empty building && not empty building.id}"/>

<!DOCTYPE html>
<html lang="vi">

<head>

    <meta charset="UTF-8">

    <title>
        <c:choose>
            <c:when test="${editMode}">
                Chỉnh sửa tòa nhà
            </c:when>
            <c:otherwise>
                Thêm tòa nhà
            </c:otherwise>
        </c:choose>
    </title>

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
           FORM PANEL
           ============================= */

        .building-form-panel {
            width: 100%;

            background: #ffffff;

            border: 1px solid #dddddd;
        }

        .building-form-header {
            padding: 13px 15px;

            background: #fafafa;

            border-bottom: 1px solid #dddddd;

            font-weight: bold;
        }

        .building-form-body {
            padding: 25px;
        }


        /* =============================
           SECTION
           ============================= */

        .form-section {
            margin-bottom: 25px;
        }

        .form-section:last-child {
            margin-bottom: 0;
        }

        .form-section-title {
            margin-bottom: 15px;
            padding-bottom: 8px;

            border-bottom: 1px solid #eeeeee;

            color: #555555;

            font-size: 14px;
            font-weight: bold;
        }

        .building-form-body label {
            font-size: 12px;
            font-weight: bold;
        }

        .building-form-body .form-group {
            margin-bottom: 15px;
        }


        /* =============================
           BUILDING TYPE
           ============================= */

        .building-types {
            display: flex;
            align-items: center;
            gap: 20px;

            min-height: 34px;
            padding-top: 7px;
        }

        .building-types .checkbox-inline {
            display: inline-flex;
            align-items: center;

            margin: 0 20px 0 0;
            padding: 0;

            font-weight: normal;
            white-space: nowrap;
        }

        .building-types .checkbox-inline input[type="checkbox"] {
            position: static;
            margin: 0 5px 0 0;
        }


        /* =============================
           FOOTER
           ============================= */

        .form-footer {
            margin-top: 10px;
            padding-top: 20px;

            border-top: 1px solid #eeeeee;
        }

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

            .building-form-body {
                padding: 15px;
            }

            .building-types {
                flex-wrap: wrap;

                gap: 10px 20px;
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

        <span class="glyphicon glyphicon-home"></span>

        <c:choose>

            <c:when test="${editMode}">
                Chỉnh sửa tòa nhà
            </c:when>

            <c:otherwise>
                Thêm tòa nhà
            </c:otherwise>

        </c:choose>

    </span>


    <span class="breadcrumb-custom">

        Trang quản trị /
        Tòa nhà /

        <c:choose>

            <c:when test="${editMode}">
                Chỉnh sửa
            </c:when>

            <c:otherwise>
                Thêm mới
            </c:otherwise>

        </c:choose>

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
     FORM
     ============================= -->

<div class="building-form-panel">


    <div class="building-form-header">

        <span class="glyphicon glyphicon-info-sign"></span>

        Thông tin tòa nhà

    </div>


    <div class="building-form-body">

        <form:form modelAttribute="building" id="form-edit" method="GET">

            <c:if test="${editMode}">

                <input type="hidden"
                       id="id"
                       name="id"
                       value="<c:out value='${building.id}'/>">

            </c:if>


            <!-- =================================
            THÔNG TIN CƠ BẢN
            ================================= -->

            <div class="form-section">

                <div class="form-section-title">

                    <span class="glyphicon glyphicon-home"></span>

                    Thông tin cơ bản

                </div>


                <div class="row">

                        <%--                    <form:form modelAttribute="building" id="listForm" method="POST">--%>
                    <div class="col-md-6">

                        <div class="form-group">

                            <label for="name">
                                Tên tòa nhà
                            </label>

                            <form:input class="form-control"
                                        path="name"/>

                        </div>

                    </div>


                    <div class="col-md-3">

                        <div class="form-group">

                            <label for="districtId">
                                Quận
                            </label>

                                <%--                                <select id="districtId"--%>
                                <%--                                        name="districtId"--%>
                                <%--                                        class="form-control">--%>

                                <%--                                    <option value="">--%>
                                <%--                                        Chọn quận--%>
                                <%--                                    </option>--%>

                                <%--                                    <option value="1">--%>
                                <%--                                        Quận 1--%>
                                <%--                                    </option>--%>

                                <%--                                    <option value="2">--%>
                                <%--                                        Quận 2--%>
                                <%--                                    </option>--%>
                            <form:select id="district" path="district"
                                         name="district"
                                         class="form-control">

                                <form:option value="">
                                    Chọn quận
                                </form:option>

                                <form:options items="${districts}"/>

                            </form:select>

                            </select>

                        </div>

                    </div>


                    <div class="col-md-3">

                        <div class="form-group">

                            <label for="ward">
                                Phường
                            </label>

                            <form:input class="form-control"
                                        path="ward"/>

                        </div>

                    </div>

                        <%--                    </form:form>--%>
                </div>


                <div class="row">


                    <div class="col-md-6">

                        <div class="form-group">

                            <label for="street">
                                Đường
                            </label>

                            <input type="text"
                                   id="street"
                                   name="street"
                                   class="form-control"
                                   value="">

                        </div>

                    </div>


                    <div class="col-md-6">

                        <div class="form-group">

                            <label for="structure">
                                Kết cấu
                            </label>

                            <input type="text"
                                   id="structure"
                                   name="structure"
                                   class="form-control"
                                   value="">

                        </div>

                    </div>


                </div>


                <div class="row">


                    <div class="col-md-3">

                        <div class="form-group">

                            <label for="numberOfBasements">
                                Số tầng hầm
                            </label>

                            <input type="number"
                                   id="numberOfBasements"
                                   name="numberOfBasements"
                                   class="form-control"
                                   value="">

                        </div>

                    </div>


                    <div class="col-md-3">

                        <div class="form-group">

                            <label for="floorArea">
                                Diện tích sàn
                            </label>

                            <input type="number"
                                   id="floorArea"
                                   name="floorArea"
                                   class="form-control"
                                   value="">

                        </div>

                    </div>


                    <div class="col-md-3">

                        <div class="form-group">

                            <label for="direction">
                                Hướng
                            </label>

                            <input type="text"
                                   id="direction"
                                   name="direction"
                                   class="form-control"
                                   value="">

                        </div>

                    </div>


                    <div class="col-md-3">

                        <div class="form-group">

                            <label for="rank">
                                Hạng
                            </label>

                            <input type="text"
                                   id="rank"
                                   name="rank"
                                   class="form-control"
                                   value="">

                        </div>

                    </div>


                </div>


                <div class="row">


                    <div class="col-md-6">

                        <div class="form-group">

                            <label for="rentArea">
                                Diện tích thuê
                            </label>

                            <input type="text"
                                   id="rentArea"
                                   name="rentArea"
                                   class="form-control"
                                   value="">

                        </div>

                    </div>


                    <div class="col-md-6">

                        <div class="form-group">

                            <label for="rentPrice">
                                Giá thuê
                            </label>

                            <input type="number"
                                   id="rentPrice"
                                   name="rentPrice"
                                   class="form-control"
                                   value="">

                        </div>

                    </div>


                </div>


                <div class="form-group">

                    <label for="priceDescription">
                        Mô tả giá
                    </label>

                    <input type="text"
                           id="priceDescription"
                           name="priceDescription"
                           class="form-control"
                           value="">

                </div>

            </div>


            <!-- =================================
            CHI PHÍ
            ================================= -->

            <div class="form-section">

                <div class="form-section-title">

                    <span class="glyphicon glyphicon-usd"></span>

                    Chi phí và thanh toán

                </div>


                <div class="row">


                    <div class="col-md-3">

                        <div class="form-group">

                            <label for="serviceFee">
                                Phí dịch vụ
                            </label>

                            <input type="number"
                                   id="serviceFee"
                                   name="serviceFee"
                                   class="form-control"
                                   value="">

                        </div>

                    </div>


                    <div class="col-md-3">

                        <div class="form-group">

                            <label for="parkingFee">
                                Phí ô tô
                            </label>

                            <input type="number"
                                   id="parkingFee"
                                   name="parkingFee"
                                   class="form-control"
                                   value="">

                        </div>

                    </div>


                    <div class="col-md-3">

                        <div class="form-group">

                            <label for="motorcycleFee">
                                Phí mô tô
                            </label>

                            <input type="number"
                                   id="motorcycleFee"
                                   name="motorcycleFee"
                                   class="form-control"
                                   value="">

                        </div>

                    </div>


                    <div class="col-md-3">

                        <div class="form-group">

                            <label for="overtimeFee">
                                Phí ngoài giờ
                            </label>

                            <input type="number"
                                   id="overtimeFee"
                                   name="overtimeFee"
                                   class="form-control"
                                   value="">

                        </div>

                    </div>


                </div>


                <div class="row">


                    <div class="col-md-3">

                        <div class="form-group">

                            <label for="electricityFee">
                                Tiền điện
                            </label>

                            <input type="number"
                                   id="electricityFee"
                                   name="electricityFee"
                                   class="form-control"
                                   value="">

                        </div>

                    </div>


                    <div class="col-md-3">

                        <div class="form-group">

                            <label for="depositFee">
                                Đặt cọc
                            </label>

                            <input type="text"
                                   id="depositFee"
                                   name="depositFee"
                                   class="form-control"
                                   value="">

                        </div>

                    </div>


                    <div class="col-md-3">

                        <div class="form-group">

                            <label for="paymentFee">
                                Thanh toán
                            </label>

                            <input type="text"
                                   id="paymentFee"
                                   name="paymentFee"
                                   class="form-control"
                                   value="">

                        </div>

                    </div>


                    <div class="col-md-3">

                        <div class="form-group">

                            <label for="commissionFee">
                                Phí môi giới
                            </label>

                            <input type="number"
                                   id="commissionFee"
                                   name="commissionFee"
                                   class="form-control"
                                   value="">

                        </div>

                    </div>


                </div>

            </div>


            <!-- =================================
            THỜI HẠN
            ================================= -->

            <div class="form-section">

                <div class="form-section-title">

                    <span class="glyphicon glyphicon-time"></span>

                    Thời hạn thuê

                </div>


                <div class="row">


                    <div class="col-md-6">

                        <div class="form-group">

                            <label for="leaseTerm">
                                Thời hạn thuê
                            </label>

                            <input type="text"
                                   id="leaseTerm"
                                   name="leaseTerm"
                                   class="form-control"
                                   value="">

                        </div>

                    </div>


                    <div class="col-md-6">

                        <div class="form-group">

                            <label for="decorationTime">
                                Thời gian trang trí
                            </label>

                            <input type="text"
                                   id="decorationTime"
                                   name="decorationTime"
                                   class="form-control"
                                   value="">

                        </div>

                    </div>


                </div>

            </div>


            <!-- =================================
            QUẢN LÝ
            ================================= -->

            <div class="form-section">

                <div class="form-section-title">

                    <span class="glyphicon glyphicon-user"></span>

                    Quản lý và phân loại

                </div>


                <div class="row">


                    <div class="col-md-6">

                        <div class="form-group">

                            <label for="managerName">
                                Tên quản lý
                            </label>

                            <input type="text"
                                   id="managerName"
                                   name="managerName"
                                   class="form-control"
                                   value="">

                        </div>

                    </div>


                    <div class="col-md-6">

                        <div class="form-group">

                            <label for="managerPhone">
                                SĐT quản lý
                            </label>

                            <input type="text"
                                   id="managerPhone"
                                   name="managerPhone"
                                   class="form-control"
                                   value="">

                        </div>

                    </div>


                </div>


                <div class="form-group">

                    <label>
                        Loại tòa nhà
                    </label>


                    <div class="building-types">

                        <label class="checkbox-inline">

                            <input type="checkbox"
                                   name="typeCode"
                                   value="noi-that">

                            Nội thất

                        </label>


                        <label class="checkbox-inline">

                            <input type="checkbox"
                                   name="typeCode"
                                   value="nguyen-can">

                            Nguyên căn

                        </label>


                        <label class="checkbox-inline">

                            <input type="checkbox"
                                   name="typeCode"
                                   value="tang-tret">

                            Tầng trệt

                        </label>

                    </div>

                </div>

            </div>


            <!-- =================================
            KHÁC
            ================================= -->

            <div class="form-section">

                <div class="form-section-title">

                    <span class="glyphicon glyphicon-file"></span>

                    Thông tin khác

                </div>


                <div class="form-group">

                    <label for="notes">
                        Ghi chú
                    </label>

                    <textarea id="notes"
                              name="notes"
                              class="form-control"
                              rows="4"></textarea>

                </div>


                <div class="form-group">

                    <label for="featuredImage">
                        Hình đại diện
                    </label>

                    <input type="text"
                           id="featuredImage"
                           name="featuredImage"
                           class="form-control"
                           value="">

                </div>

            </div>


            <!-- =================================
            BUTTONS
            ================================= -->

            <div class="form-footer">

                    <%--<c:if test="${not empty buildingEdit.id}">
                        <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">Cập Nhật Tòa Nhà</button>
                        <button type="button" class="btn btn-primary">Hủy thao tác</button>
                    </c:if>
                    <c:if test="${empty buildingEdit.id}">
                        <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">Thêm Mới</button>
                        <button type="button" class="btn btn-primary">Hủy thao tác</button>
                    </c:if>--%>

                <button type="button"
                        class="btn btn-green"
                        id="btnSaveBuilding">

                    <span class="glyphicon glyphicon-floppy-disk"></span>

                    <c:choose>

                        <c:when test="${editMode}">
                            Lưu thay đổi
                        </c:when>

                        <c:otherwise>
                            Thêm tòa nhà
                        </c:otherwise>

                    </c:choose>

                </button>


                <a href="${pageContext.request.contextPath}/admin/building-list"
                   class="btn btn-default">

                    <span class="glyphicon glyphicon-arrow-left"></span>

                    Quay lại

                </a>


            </div>

            <form:hidden path="id" id="buildingId"/>
        </form:form>


    </div>

</div>

<script src="${pageContext.request.contextPath}/assets/js/jquery-2.1.4.min.js"></script>

<script>
    $('#btnSaveBuilding').click(function () {
        var data = {};
        var typeCodes = [];
        var formData = $('#form-edit').serializeArray();
        $.each(formData, function (i, field) {
            if (field.name === 'typeCode') {
                typeCodes.push(field.value);
            } else {
                data["" + field.name + ""] = field.value;
            }
        });
        data['typeCodes'] = typeCodes;
        console.log("OK")
        if (typeCodes != '') {
            saveBuilding(data);
        } else {
            window.location.href= "<c:url value="/admin/building-edit?typeCodes=require"/>";
        }

    });

    function saveBuilding(data) {
        // call api
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/api/building",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "json",
            success: function (response) {
                console.log("Thêm tòa nhà thành công");
                // $("#h11").html("Thêm tòa nhà thành công");
            },
            error: function (response) {
                console.log("Thêm tòa nhà thất bại");
                // $("#h11").html("Thêm tòa nhà thất bại");
            }
        });
    }
</script>
</body>

</html>