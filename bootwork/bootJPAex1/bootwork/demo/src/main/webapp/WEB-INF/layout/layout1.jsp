<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+Han+Sans&family=Bungee+Spice&family=Diphylleia&family=Do+Hyeon&family=Nanum+Pen+Script&family=Song+Myung&display=swap"
          rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <style>
        body * {
            font-family: "Do Hyeon";
        }
        div.mainlayout>div{
            border: 0px solid gray;/*레이아웃 확인후 나중에 0으로 변경*/
            position: absolute;
        }
        div.mainlayout>div a{
            text-decoration: none;
            color: black;
        }

        div.mainlayout>div.header{
            width: 100%;
            height: 100px;
            line-height:100px;
            font-size: 35px;
            text-align: center;
        }

        div.mainlayout>div.menu{
            top:100px;
            width: 100%;
            height: 6px;
            line-height: 60px;
        }

        div.mainlayout>div.info{
            top:250px;
            left:30px;
            width: 190px;
            height: 200px;
        }

        div.mainlayout>div.main{
            top:210px;
            left:300px;
            width: 70%;
            height:auto;
        }
    </style>
</head>
<body>
<div class="mainlayout">
    <div class="header">
        <tiles:insertAttribute name="header"/>
    </div>
    <div class="menu">
        <tiles:insertAttribute name="menu"/>
    </div>
    <div  class="info">
        <tiles:insertAttribute name="info"/>
    </div>
    <div  class="main">
        <tiles:insertAttribute name="main"/>
    </div>
</div>
</body>
</html>
