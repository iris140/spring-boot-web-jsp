<header class="header">

    <!-- LOGO -->

    <div class="logo">

        SkyLand

        <small>
            NHÀ BÁN NHÀ ĐẤT
        </small>

    </div>


    <!-- MENU -->

    <nav class="menu">

        <a href="${pageContext.request.contextPath}/trang-chu">
            TRANG CHỦ
        </a>

        <a href="#">
            GIỚI THIỆU
        </a>

        <a href="#">
            SẢN PHẨM
        </a>

        <a href="#">
            TIN TỨC
        </a>

        <a href="#">
            LIÊN HỆ
        </a>

    </nav>


    <!-- USER -->

    <div class="account">


        <!-- ĐÃ ĐĂNG NHẬP -->

        <sec:authorize access="isAuthenticated()">

            Xin chào,

            <strong>
                <sec:authentication property="principal.username"/>
            </strong>


            <!-- CHỈ ADMIN -->

            <sec:authorize access="hasRole('ADMIN')">

                <a href="${pageContext.request.contextPath}/admin">
                    Quản trị
                </a>

            </sec:authorize>


            <a href="${pageContext.request.contextPath}/logout">
                Thoát
            </a>

        </sec:authorize>


        <!-- CHƯA ĐĂNG NHẬP -->

        <sec:authorize access="!isAuthenticated()">

            <a href="${pageContext.request.contextPath}/login">
                Đăng nhập
            </a>

        </sec:authorize>


    </div>

</header>