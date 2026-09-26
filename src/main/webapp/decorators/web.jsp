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
        <decorator:title default="SkyLand"/>
    </title>


    <decorator:head/>


    <style>

        * {
            box-sizing: border-box;
        }


        body {
            margin: 0;

            font-family: Arial, Helvetica, sans-serif;

            color: #333;

            background: #fff;
        }


        /* =========================
           HEADER
           ========================= */

        .header {
            min-height: 65px;

            display: flex;
            align-items: center;

            padding: 0 28px;

            background: #fff;

            border-bottom: 1px solid #eee;
        }


        .logo {
            width: 200px;

            color: #20ad76;

            font-size: 24px;
            font-weight: bold;
        }


        .logo small {
            display: block;

            margin-top: 2px;

            color: #777;

            font-size: 8px;

            letter-spacing: 2px;
        }


        .menu {
            flex: 1;

            text-align: center;
        }


        .menu a {
            display: inline-block;

            padding: 24px 22px;

            color: #169967;

            font-size: 12px;
            font-weight: bold;

            text-decoration: none;
        }


        .menu a:hover {
            background: #f4f4f4;
        }


        .account {
            min-width: 230px;

            text-align: right;

            font-size: 12px;
        }


        .account a {
            display: inline-block;

            margin-left: 5px;

            padding: 7px 11px;

            background: #28b77b;

            border-radius: 15px;

            color: #fff;

            text-decoration: none;
        }


        .account a:hover {
            background: #178f5e;
        }


        /* =========================
           HERO
           ========================= */

        .hero {
            height: 410px;

            display: flex;

            justify-content: center;
            align-items: center;

            background:
                    linear-gradient(
                            rgba(10, 51, 89, 0.65),
                            rgba(10, 51, 89, 0.65)
                    ),
                    linear-gradient(
                            135deg,
                            #164b75,
                            #367a8f
                    );

            color: #fff;

            text-align: center;
        }


        .hero-content {
            max-width: 850px;

            padding: 20px;
        }


        .hero-company {
            font-size: 13px;
            font-weight: bold;

            letter-spacing: 6px;
        }


        .hero h1 {
            margin: 15px 0;

            color: #21dfba;

            font-size: 55px;
        }


        .hero p {
            max-width: 700px;

            margin: auto;

            font-size: 14px;

            line-height: 1.8;
        }


        /* =========================
           SEARCH
           ========================= */

        .search-section {
            padding: 25px 20px;

            background: #28b77b;
        }


        .search-container {
            width: 950px;
            max-width: 100%;

            margin: auto;

            display: flex;
            align-items: flex-end;

            gap: 20px;
        }


        .search-group {
            flex: 1;
        }


        .search-group label {
            display: block;

            margin-bottom: 7px;

            color: #fff;

            font-size: 11px;
        }


        .search-group select {
            width: 100%;

            height: 38px;

            padding: 0 10px;

            background: #fff;

            border: 0;

            border-radius: 4px;
        }


        .btn-search {
            width: 170px;

            height: 38px;

            background: #148d5e;

            border: 0;

            border-radius: 4px;

            color: #fff;

            cursor: pointer;

            font-weight: bold;
        }


        .btn-search:hover {
            background: #0d754d;
        }


        /* =========================
           CONTENT
           ========================= */

        .content {
            padding: 55px 20px;

            text-align: center;
        }


        .content-line {
            width: 40px;

            height: 4px;

            margin: auto;

            background: #28b77b;
        }


        .content h2 {
            margin-top: 15px;

            font-size: 26px;
        }


        .content p {
            color: #777;
        }


        /* =========================
           FOOTER
           ========================= */

        .web-footer {
            padding: 30px 20px;

            background: #263238;

            color: #ccc;

            text-align: center;
        }


        .web-footer strong {
            color: #fff;

            font-size: 18px;
        }


        .web-footer p {
            margin: 7px 0;

            font-size: 12px;
        }


        /* =========================
           RESPONSIVE
           ========================= */

        @media (max-width: 900px) {

            .header {
                padding: 0 15px;
            }


            .logo {
                width: auto;
            }


            .menu {
                display: none;
            }


            .account {
                margin-left: auto;
            }


            .search-container {
                flex-direction: column;

                align-items: stretch;
            }


            .btn-search {
                width: 100%;
            }


            .hero h1 {
                font-size: 38px;
            }
        }

    </style>

</head>


<body>


<!-- HEADER COMMON -->

<%@ include file="/common/web/header.jsp" %>


<!-- NỘI DUNG WEB -->

<decorator:body/>


<!-- FOOTER COMMON -->

<%@ include file="/common/web/footer.jsp" %>


</body>

</html>