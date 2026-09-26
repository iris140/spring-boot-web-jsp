<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fprm" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"
         language="java" %>

<%@ include file="/common/taglib.jsp" %>


<c:url var="buildingListURL" value="/admin/building-list"/>
<!DOCTYPE html>
<html lang="vi">

<head>

    <meta charset="UTF-8">

    <title>Quản lý tòa nhà</title>

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
           SEARCH PANEL
           ============================= */

        .search-panel {
            margin-bottom: 20px;

            background: #ffffff;

            border: 1px solid #dddddd;
        }

        .search-panel-header {
            padding: 13px 15px;

            background: #fafafa;

            border-bottom: 1px solid #dddddd;

            font-weight: bold;
        }

        .search-panel-body {
            padding: 20px;
        }

        .search-panel .form-group {
            margin-bottom: 15px;
        }

        .search-panel label {
            font-size: 12px;
            font-weight: bold;
        }

        .search-option {
            margin-top: 5px;
        }

        .search-option label {
            margin-right: 15px;

            font-weight: normal;
        }


        /* =============================
           BUTTON BAR
           ============================= */

        .building-toolbar {
            margin-bottom: 15px;

            text-align: right;
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
           TABLE PANEL
           ============================= */

        .building-panel {
            width: 100%;

            background: #ffffff;

            border: 1px solid #dddddd;
        }

        .building-panel-header {
            padding: 13px 15px;

            background: #fafafa;

            border-bottom: 1px solid #dddddd;

            font-weight: bold;
        }

        .building-panel-body {
            padding: 15px;
        }

        .table {
            margin-bottom: 0;
        }

        .table > thead > tr > th {
            background: #f7f7f7;

            vertical-align: middle;
            text-align: center;
        }

        .table > tbody > tr > td {
            vertical-align: middle;
        }

        .column-checkbox {
            width: 45px;

            text-align: center;
        }

        .column-action {
            width: 130px;

            text-align: center;
            white-space: nowrap;
        }

        .pagebanner {
            display: none;
        }

        .pagelinks {
            margin-top: 15px;
            text-align: center;
            font-size: 14px;
        }

        .pagelinks {
            display: flex;
            align-items: center;
            gap: 6px;
            margin-top: 15px;
        }

        .pagelinks .page-btn {
            display: inline-block;
            min-width: 34px;
            padding: 7px 11px;

            text-align: center;
            text-decoration: none;

            color: #337ab7;
            background: #ffffff;

            border: 1px solid #dddddd;
            border-radius: 4px;
        }

        .pagelinks a.page-btn:hover {
            color: #23527c;
            background: #eeeeee;
        }

        .pagelinks .page-btn.active {
            color: #ffffff;
            background: #337ab7;
            border-color: #337ab7;
        }

        .pagelinks .page-btn.disabled {
            color: #999999;
            background: #ffffff;
            cursor: default;
        }

        /* =============================
           MODAL
           ============================= */

        .staff-table th,
        .staff-table td {
            vertical-align: middle !important;
        }

        .staff-checkbox {
            width: 70px;

            text-align: center;
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

            .search-panel-body {
                padding: 15px;
            }

            .building-toolbar {
                text-align: left;
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

        Quản lý tòa nhà

    </span>


    <span class="breadcrumb-custom">

        Trang quản trị /
        Tòa nhà

    </span>


    <div style="clear: both;"></div>

</div>

<!-- =============================
     SEARCH
     ============================= -->

<div class="search-panel">

    <!-- HEADER -->
    <div class="search-panel-header">

        <span>
            <span class="glyphicon glyphicon-search"></span>
            Tìm kiếm
        </span>

        <a href="#buildingSearchBody"
           class="search-collapse-button"
           data-toggle="collapse"
           aria-expanded="true"
           aria-controls="buildingSearchBody"
           title="Thu gọn / mở rộng">

            <span id="searchCollapseIcon"
                  class="glyphicon glyphicon-chevron-up"></span>

        </a>

    </div>


    <!-- COLLAPSIBLE BODY -->
    <form:form action="${buildingListURL}" modelAttribute="modelSearch" id="listForm" method="GET">
        <div id="buildingSearchBody"
             class="collapse in">

            <div class="search-panel-body">

                <div id="listForm">


                    <!-- =============================
                         ROW 1
                         ============================= -->

                    <div class="row">

                        <div class="col-md-6">

                            <div class="form-group">

                                <label for="buildingName">
                                    Tên tòa nhà
                                </label>

                                    <%--                                <input type="text"--%>
                                    <%--                                       id="buildingName"--%>
                                    <%--                                       name="name"--%>
                                    <%--                                       class="form-control"--%>
                                    <%--                                       placeholder="Tên tòa nhà"--%>
                                    <%--                                       value="${modelSearch.name}">--%>
                                <form:input class="form-control" path="name"/>

                            </div>

                        </div>


                        <div class="col-md-6">

                            <div class="form-group">

                                <label for="floorArea">
                                    Diện tích sàn
                                </label>
                                <form:input class="form-control" path="floorArea"/>
                                    <%--                                <input type="number"--%>
                                    <%--                                       id="floorArea"--%>
                                    <%--                                       name="floorArea"--%>
                                    <%--                                       class="form-control"--%>
                                    <%--                                       placeholder="Diện tích sàn"--%>
                                    <%--                                       value="${modelSearch.floorArea}">--%>

                            </div>

                        </div>

                    </div>


                    <!-- =============================
                         ROW 2
                         ============================= -->

                    <div class="row">

                        <div class="col-md-2">

                            <div class="form-group">

                                <label for="district">
                                    Quận
                                </label>

                                <form:select id="district" path="district"
                                             class="form-control">

                                    <form:option value="">
                                        Chọn quận
                                    </form:option>

                                    <form:options items="${districts}"/>

                                </form:select>

                            </div>

                        </div>


                        <div class="col-md-5">

                            <div class="form-group">

                                <label for="ward">
                                    Phường
                                </label>
                                <form:input class="form-control" path="ward"/>

                            </div>

                        </div>


                        <div class="col-md-5">

                            <div class="form-group">

                                <label for="street">
                                    Đường
                                </label>
                                <form:input class="form-control" path="street"/>
                            </div>

                        </div>

                    </div>


                    <!-- =============================
                         ROW 3
                         ============================= -->

                    <div class="row">

                        <div class="col-md-4">

                            <div class="form-group">

                                <label for="numberOfBasement">
                                    Số tầng hầm
                                </label>
                                <form:input class="form-control" path="numberOfBasement"/>
                            </div>

                        </div>


                        <div class="col-md-4">

                            <div class="form-group">

                                <label for="direction">
                                    Hướng
                                </label>
                                <form:input class="form-control" path="direction"/>

                            </div>

                        </div>


                        <div class="col-md-4">

                            <div class="form-group">

                                <label for="buildingRank">
                                    Hạng
                                </label>
                                <form:input class="form-control" path="buildingRank"/>

                            </div>

                        </div>

                    </div>


                    <!-- =============================
                         ROW 4
                         ============================= -->

                    <div class="row">

                        <div class="col-md-3">

                            <div class="form-group">

                                <label for="numberOfFloor">
                                    Số tầng
                                </label>
                                <form:input class="form-control" path="numberOfBasement"/>

                            </div>

                        </div>


                        <div class="col-md-3">

                            <div class="form-group">

                                <label for="areaFrom">
                                    Diện tích từ
                                </label>
                                <form:input class="form-control" path="areaFrom"/>

                            </div>

                        </div>


                        <div class="col-md-3">

                            <div class="form-group">

                                <label for="rentPriceFrom">
                                    Giá thuê từ
                                </label>
                                <form:input class="form-control" path="rentPriceFrom"/>

                            </div>

                        </div>


                        <div class="col-md-3">

                            <div class="form-group">

                                <label for="rentPriceTo">
                                    Giá thuê đến
                                </label>
                                <form:input class="form-control" path="rentPriceTo"/>

                            </div>

                        </div>

                    </div>


                    <!-- =============================
                         ROW 5
                         ============================= -->

                    <div class="row">

                        <div class="col-md-5">

                            <div class="form-group">

                                <label for="managerName">
                                    Tên quản lý
                                </label>
                                <form:input class="form-control" path="managerName"/>

                            </div>

                        </div>


                        <div class="col-md-5">

                            <div class="form-group">

                                <label for="managerPhone">
                                    SĐT quản lý
                                </label>
                                <form:input class="form-control" path="managerPhone"/>

                            </div>

                        </div>


                        <div class="col-md-2">

                            <div class="form-group">

                                <label for="staff">
                                    Nhân viên
                                </label>

                                    <%--<select id="staff"
                                            name="staffId"
                                            class="form-control">

                                        <option value="">
                                            Chọn nhân viên
                                        </option>

                                        <option value="1">
                                            Iris
                                        </option>

                                        <option value="2">
                                            Murad
                                        </option>

                                    </select>--%>
                                <form:select path="staffId" class="form-control">

                                    <form:option value="">
                                        Chọn Nhân Viên
                                    </form:option>

                                    <form:options items="${listStaffs}"/>

                                </form:select>
                            </div>

                        </div>

                    </div>


                    <!-- OPTIONS -->
                    <div class="row">

                        <div class="col-md-12">

                            <div class="search-option">

                                    <%-- <label class="search-checkbox">
                                         <input type="checkbox"
                                                id="furniture"
                                                name="furniture">

                                         <span>Nội thất</span>
                                     </label>


                                     <label class="search-checkbox">
                                         <input type="checkbox"
                                                id="wholeBuilding"
                                                name="wholeBuilding">

                                         <span>Nguyên căn</span>
                                     </label>


                                     <label class="search-checkbox">
                                         <input type="checkbox"
                                                id="groundFloor"
                                                name="groundFloor">

                                         <span>Tầng trệt</span>
                                     </label>--%>
                                <form:checkboxes class="search-checkbox" items="${typeCodes}" path="typeCode"/>

                            </div>

                        </div>

                    </div>


                    <!-- BUTTON -->
                    <div class="row search-button-row">

                        <div class="col-md-12">

                            <button type="submit"
                                    class="btn btn-green"
                                    id="btnSearchBuilding">

                                <span class="glyphicon glyphicon-search"></span>

                                Tìm kiếm

                            </button>


                            <button type="button"
                                    class="btn btn-default"
                                    id="btnClearSearch">

                                <span class="glyphicon glyphicon-refresh"></span>

                                Làm mới

                            </button>

                        </div>

                    </div>
                </div>

            </div>

        </div>
    </form:form>
</div>


<!-- =============================
     TOOLBAR
     ============================= -->

<div class="building-toolbar">

    <a href="${pageContext.request.contextPath}/admin/building-edit">

        <button type="button"
                class="btn btn-info"
                title="Thêm tòa nhà">

            <span class="glyphicon glyphicon-plus"></span>

            Thêm tòa nhà

        </button>
    </a>

    <button type="button"
            id="btnDeleteBuildings"
            class="btn btn-danger"
            title="Xóa tòa nhà đã chọn">

        <span class="glyphicon glyphicon-trash"></span>

        Xóa đã chọn

    </button>


</div>


<!-- =============================
     BUILDING TABLE
     ============================= -->

<div class="building-panel">


    <div class="building-panel-header">

        <span class="glyphicon glyphicon-list"></span>

        Danh sách tòa nhà

    </div>


    <div class="building-panel-body">


        <div class="table-responsive">

            <form:form modelAttribute="buildingList">
                <display:table
                        name="buildingList.listResult" cellspacing="0" cellpadding="0"
                        requestURI="${buildingListURL}" partialList="true" sort="external"
                        size="${buildingList.totalItem}" defaultsort="2" defaultorder="descending"
                        id="tableList" pagesize="${modelSearch.maxPageItem}"
                        export="false"
                        class="table table-fcv-ace table-striped table-bordered table-hover"
                        style="margin: 3em 0 1.5em;">
                    <display:column title="<fieldset style='margin:0;padding:0;border:0;text-align:center;'>
                   <input type='checkbox' id='checkAll'/>
               </fieldset>"
                                    class="center select-cell"
                                    headerClass="center select-cell">

                        <fieldset style="margin:0; padding:0; border:0; text-align:center;">
                            <input type="checkbox"
                                   name="checkList"
                                   value="${tableList.id}"
                                   id="checkbox_${tableList.id}"
                                   class="building-checkbox"/>
                        </fieldset>
                    </display:column>
                    <%--                    <display:column--%>
                    <%--                            title="<input type='checkbox' id='checkAll' />"--%>
                    <%--                            headerClass="column-checkbox"--%>
                    <%--                            class="column-checkbox">--%>

                    <%--                        <input type="checkbox"--%>
                    <%--                               class="building-checkbox"--%>
                    <%--                               name="checkList"--%>
                    <%--                               value="${item.id}"/>--%>

                    <%--                    </display:column>--%>


                    <display:column
                            headerClass="text-left"
                            property="name"
                            title="Tên tòa nhà"/>

                    <display:column
                            headerClass="text-left"
                            property="address"
                            title="Địa chỉ"/>

                    <display:column
                            headerClass="text-left"
                            property="numberOfBasement"
                            title="Số tầng hầm"/>

                    <display:column
                            headerClass="text-left"
                            property="managerName"
                            title="Tên quản lý"/>

                    <display:column
                            headerClass="text-left"
                            property="managerPhone"
                            title="SĐT quản lý"/>

                    <display:column
                            headerClass="text-left"
                            property="floorArea"
                            title="Diện tích sàn"/>

                    <display:column
                            headerClass="text-left"
                            property="emptyArea"
                            title="D.tích trống"/>

                    <display:column
                            headerClass="text-left"
                            property="rentArea"
                            title="D.tích thuê"/>

                    <display:column
                            headerClass="text-left"
                            property="brokerageFee"
                            title="Phí môi giới"/>


                    <display:column
                            title="Thao tác"
                            headerClass="column-action"
                            class="column-action">

                        <button type="button"
                                class="btn btn-success btn-xs"
                                title="Giao tòa nhà"
                                onclick="assignmentBuilding(${tableList.id})">

                            <span class="glyphicon glyphicon-user"></span>

                        </button>


                        <a href="${pageContext.request.contextPath}/admin/building-edit-${tableList.id}">

                            <button type="button"
                                    class="btn btn-info btn-xs"
                                    title="Chỉnh sửa">

                                <span class="glyphicon glyphicon-pencil"></span>

                            </button>

                        </a>


                        <button type="button"
                                class="btn btn-danger btn-xs"
                                title="Xóa"
                                onclick="deleteBuilding(${buildingList.id})">

                            <span class="glyphicon glyphicon-trash"></span>

                        </button>

                    </display:column>
                    <display:setProperty
                            name="paging.banner.placement"
                            value="bottom"/>
                    <display:setProperty name="paging.banner.page.separator" value=""/>

                    <display:setProperty name="paging.banner.page.link">
                        <a class="page-btn" href="{1}">{0}</a>
                    </display:setProperty>

                    <display:setProperty name="paging.banner.page.selected">
                        <span class="page-btn active">{0}</span>
                    </display:setProperty>

                    <display:setProperty
                            name="paging.banner.page.separator"
                            value=""/>

                    <display:setProperty
                            name="paging.banner.page.link"
                            value='<a class="page-btn" href="{1}">{0}</a>'/>

                    <display:setProperty
                            name="paging.banner.page.selected"
                            value='<span class="page-btn active">{0}</span>'/>

                    <!-- Đang ở trang giữa -->
                    <display:setProperty
                            name="paging.banner.full"
                            value='<span class="pagelinks"><a class="page-btn" href="{1}">First</a><a class="page-btn" href="{2}">Prev</a>{0}<a class="page-btn" href="{3}">Next</a><a class="page-btn" href="{4}">Last</a></span>'/>

                    <!-- Đang ở trang đầu -->
                    <display:setProperty
                            name="paging.banner.first"
                            value='<span class="pagelinks"><span class="page-btn disabled">First</span><span class="page-btn disabled">Prev</span>{0}<a class="page-btn" href="{3}">Next</a><a class="page-btn" href="{4}">Last</a></span>'/>

                    <!-- Đang ở trang cuối -->
                    <display:setProperty
                            name="paging.banner.last"
                            value='<span class="pagelinks"><a class="page-btn" href="{1}">First</a><a class="page-btn" href="{2}">Prev</a>{0}<span class="page-btn disabled">Next</span><span class="page-btn disabled">Last</span></span>'/>
                </display:table>
            </form:form>

        </div>


    </div>

</div>


<!-- =============================
     ASSIGNMENT BUILDING MODAL
     ============================= -->

<div class="modal fade"
     id="assignmentBuildingModal"
     tabindex="-1"
     role="dialog"
     aria-labelledby="assignmentBuildingModalLabel">


    <div class="modal-dialog"
         role="document">


        <div class="modal-content">


            <div class="modal-header">

                <button type="button"
                        class="close"
                        data-dismiss="modal"
                        aria-label="Đóng">

                    <span aria-hidden="true">
                        &times;
                    </span>

                </button>


                <h4 class="modal-title"
                    id="assignmentBuildingModalLabel">

                    <span class="glyphicon glyphicon-user"></span>

                    Danh sách nhân viên

                </h4>

            </div>


            <div class="modal-body">


                <div class="table-responsive">


                    <table id="staffList"
                           class="table table-bordered table-hover staff-table">


                        <thead>

                        <tr>

                            <th class="staff-checkbox">
                                Chọn
                            </th>

                            <th>
                                Tên nhân viên
                            </th>

                        </tr>

                        </thead>


                        <tbody>


                        <%--                        <tr>--%>

                        <%--                            <td class="staff-checkbox">--%>

                        <%--                                <input type="checkbox"--%>
                        <%--                                       id="ckb1"--%>
                        <%--                                       value="1">--%>

                        <%--                            </td>--%>

                        <%--                            <td>--%>
                        <%--                                Nguyễn Văn A--%>
                        <%--                            </td>--%>

                        <%--                        </tr>--%>


                        <%--                        <tr>--%>

                        <%--                            <td class="staff-checkbox">--%>

                        <%--                                <input type="checkbox"--%>
                        <%--                                       id="ckb2"--%>
                        <%--                                       value="2">--%>

                        <%--                            </td>--%>

                        <%--                            <td>--%>
                        <%--                                Trần Thị B--%>
                        <%--                            </td>--%>

                        <%--                        </tr>--%>


                        </tbody>


                    </table>


                </div>


                <input type="hidden"
                       id="buildingId"
                       name="buildingId"
                >


            </div>


            <div class="modal-footer">


                <button type="button"
                        class="btn btn-green"
                        id="btnAssignmentBuilding">

                    <span class="glyphicon glyphicon-ok"></span>

                    Giao tòa nhà

                </button>


                <button type="button"
                        class="btn btn-default"
                        data-dismiss="modal">

                    <span class="glyphicon glyphicon-remove"></span>

                    Đóng

                </button>


            </div>


        </div>


    </div>

</div>


<script src="${pageContext.request.contextPath}/assets/js/jquery-2.1.4.min.js"></script>
<!-- =============================
     SCRIPT
     ============================= -->

<script>

    $(document).ready(function () {

            console.log('BUILDING JS LOADED');

            // ==============================
            // CHECK ALL
            // ==============================
            $('#checkAll').click(function () {

                var checked = $(this).prop('checked');

                $('.building-checkbox').prop('checked', checked);

            });


            // ==============================
            // CLEAR SEARCH
            // ==============================
            $('#btnClearSearch').click(function (e) {

                e.preventDefault();

                $('#listForm')
                    .find('input[type="text"], input[type="number"]')
                    .val('');

                $('#listForm')
                    .find('select')
                    .prop('selectedIndex', 0);

                $('#listForm')
                    .find('input[type="checkbox"]')
                    .prop('checked', false);

            });


            // ==============================
            // DELETE SELECTED BUILDINGS
            // ==============================
            $('#btnDeleteBuildings').click(function (e) {

                e.preventDefault();

                console.log('DELETE CLICK');

                var buildingIds = $('#buildingTable')
                    .find('input[type="checkbox"]:checked')
                    .map(function () {
                        return $(this).val();
                    })
                    .get();

                console.log('buildingIds:', buildingIds);

                if (buildingIds.length === 0) {
                    alert('Vui lòng chọn tòa nhà cần xóa');
                    return;
                }

                deleteBuildings(buildingIds);

            });

            $('#btnAssignmentBuilding').click(function (e) {
                e.preventDefault();
                var data = {};
                data['buildingId'] = $('#buildingId').val();
                /*var staffs = $('#staffList').find('tbody input[type="checkbox"]:checked').map(function () {
                  return
                  $(this).val();
                }).get();*/
                var staffs = $('#staffList').find('input[type="checkbox"]:checked').map(function () {
                    return $(this).val();
                }).get();
                data['staffs'] = staffs;
                if (staffs != '') {
                    updateAssignment(data);
                }
            });

            function updateAssignment(data) {
                // call api
                $.ajax({

                    type: "POST",

                    url: "${pageContext.request.contextPath}/api/building/assignment",
                    data: JSON.stringify(data),
                    contentType: "application/json",
                    dataType: "json",

                    success: function (response) {
                        console.log("success");
                    },

                    error: function (xhr) {

                        console.info("Giao không thành công");
                        window.location.href = "<c:url value="/admin/building-list?message=error"/> "
                        console.log("Status:", xhr.status);
                        console.log("Response:", xhr.responseText);

                    }
                });
            }

            $('#btnSearchBuilding').click(function (e) {
                e.preventDefault();
                $('#listForm').submit();
            });

        }
    )
    ;


    // ==============================
    // ASSIGNMENT BUILDING
    // ==============================
    function assignmentBuilding(buildingId) {

        $('#assignmentBuildingModal').modal('show');
        $('#buildingId').val(buildingId);
        loadStaff(buildingId);

    }

    function loadStaff(buildingId) {
        $.ajax({

            type: "GET",

            url: "${pageContext.request.contextPath}/api/building/" + buildingId + '/staffs',

            // data: JSON.stringify(data),

            // contentType: "application/json",

            dataType: "json",

            success: function (response) {
                var row = '';
                $.each(response.data, function (index, item) {
                    row += '<tr>';
                    row += '<td class="staff-checkbox"> <input type="checkbox" value =' + item.staffId + ' id = "ckb1" ' + item.staffId + '" class = "check-box-element"' + item.checked + '></td>'
                    row += '<td class="staff-checkbox">' + item.fullName + '</td>'
                    row += '</tr>';
                });
                $('#staffList tbody').html(row);
                console.log("success");

            },

            error: function (xhr) {

                console.log("fail");
                window.location.href = "<c:url value="/admin/building-list?message=error"/> "
                console.log("Status:", xhr.status);

                console.log("Response:", xhr.responseText);

            }

        });
    }

    // ==============================
    // DELETE ONE BUILDING
    // ==============================
    function deleteBuilding(id) {

        var buildingIds = [id];

        deleteBuildings(buildingIds);

    }


    // ==============================
    // DELETE BUILDINGS
    // ==============================
    function deleteBuildings(data) {

        console.log('DELETE DATA:', data);

        $.ajax({

            type: "DELETE",

            url: "${pageContext.request.contextPath}/api/building/" + data,

            data: JSON.stringify(data),

            contentType: "application/json",

            dataType: "json",

            success: function (response) {

                console.log("Xóa tòa nhà thành công");

            },

            error: function (xhr) {

                console.log("Xóa tòa nhà thất bại");

                console.log("Status:", xhr.status);

                console.log("Response:", xhr.responseText);

            }

        });

    }

</script>

</body>

</html>