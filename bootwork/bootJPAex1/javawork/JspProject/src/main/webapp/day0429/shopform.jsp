<%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/04/29
  Time: 11:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+Han+Sans&family=Bungee+Spice&family=Diphylleia&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Nanum+Pen+Script&family=Song+Myung&display=swap"
          rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <style>
        body * {
            font-family: "Song Myung";
        }

        img.photo {
            position: absolute;
            left: 350px;
            top: 100px;
            width: 150px;
            border: 3px solid gray;
        }
    </style>
</head>
<body>
<div style="margin: 10px; width: 300px">
    <form action="./shopaction.jsp" method="post">
        <table class="table table-bordered">
            <caption align="top"><b>상품 등록</b></caption>
            <tr>
                <th width="100" class="table-danger">상품명</th>
                <td>
                    <input type="text" name="sname" class="form-control" required="required">
                </td>
            </tr>
            <tr>
                <th width="100" class="table-danger">상품가격</th>
                <td>
                    <input type="text" name="sprice" class="form-control" required="required">
                </td>
            </tr>
            <tr>
                <th width="100" class="table-danger">상품갯수</th>
                <td>
                    <input type="number" name="scount" class="form-control" min="1" max="5" step="1" value="1">
                </td>
            </tr>
            <tr>
                <th width="100" class="table-danger">상품색상</th>
                <td>
                    <input type="color" name="scolor" class="form-control" value="#ccffff">
                </td>
            </tr>
            <tr>
                <th width="100" class="table-danger">상품사진</th>
                <td>
                    <select name="sphoto" id="sphoto" class="form-select">
                        <%
                            for (int i = 1; i <= 34; i++) {%>
                        <option value='../shop/<%=i%>.<%=i==24?"gif":"jpg"%>'>
                            상품번호 <%=i%>
                        </option>
                        <%
                            }
                        %>
                    </select>
                    <img src="../shop/1.jpg" class="photo">
                    <script type="text/javascript">
                        $("#sphoto").change(function () {
                            $(".photo").attr("src", $(this).val());
                        })
                    </script>
                </td>
            </tr>
            <tr>
               <td colspan="2" align="center">
                   <button type="submit" class="btn btn-secondary">DB에 저장</button>
               </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
