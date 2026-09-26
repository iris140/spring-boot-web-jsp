<div class="admin-header">

    <div class="admin-brand">

        <span class="glyphicon glyphicon-leaf"></span>

        <span class="admin-brand-text">
            Trang quản trị
        </span>

    </div>


    <div class="admin-top">

        Xin chào,

        <strong>
            <sec:authentication property="principal.username"/>
        </strong>


        <a href="${pageContext.request.contextPath}/trang-chu">

            <span class="glyphicon glyphicon-globe"></span>

            Trang chủ

        </a>


        <a href="${pageContext.request.contextPath}/logout">

            <span class="glyphicon glyphicon-log-out"></span>

            Thoát

        </a>

    </div>

</div>