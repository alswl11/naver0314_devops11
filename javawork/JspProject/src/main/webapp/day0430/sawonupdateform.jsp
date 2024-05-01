<%@ page import="data.dao.SawonDao" %>
<%@ page import="data.dto.SawonDto" %><%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/04/30
  Time: 11:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+Han+Sans&family=Bungee+Spice&family=Diphylleia&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Nanum+Pen+Script&family=Song+Myung&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <style>
        body * {
            font-family: "Song Myung";
        }
        img.photo {
            position: absolute;
            left: 340px;
            top: 250px;
            width: 150px;
            border: 2px solid gray;
        }
    </style>
</head>

<%
    int num = Integer.parseInt(request.getParameter("num"));
    SawonDao dao = new SawonDao();
    SawonDto dto = dao.getData(num);
%>
<script>
    $(function (){
        $("select[name='buseo'] option[value ='<%=dto.getBuseo()%>']").prop("selected", true);
        $("input[name='gender'] option[value ='<%=dto.getGender()%>']").prop("checked", true);
        $("select[name='photo'] option[value ='<%=dto.getPhoto()%>']").prop("selected", true)
    })
</script>
<body>
<div style="margin: 20px; width: 300px">
    <form action="./sawonupdate.jsp" method="post">
        <input type="hidden" name="num" value="<%=num%>">
        <table class="table table-bordered">
            <caption align="top">
                <h5 class="alert alert-warning">사원 정보 수정</h5>
            </caption>
            <tr>
                <th width="100" class="table-danger">사원명</th>
                <td>
                    <input type="text" name="name" class="form=control" required = "required" autofocus="autofocus" value="<%=dto.getName()%>">
                </td>
            </tr>
            <tr>
                <th width="100" class="table-danger">나이</th>
                <td>
                    <input type="number" name="age" class="form=control" min="1" max="100" step ="1" value="<%=dto.getAge()%>">
                </td>
            </tr>
            <tr>
                <th width="100" class="table-danger">주소</th>
                <td>
                    <input type="text" name="addr" class="form=control" value="<%=dto.getAddr()%>">
                </td>
            </tr>
            <tr>
                <th width="100" class="table-danger">부서</th>
                <td>
                    <select class="form-select" name="buseo" >
                        <option value="교육부">교육부</option>
                        <option value="인사부">인사부</option>
                        <option value="홍보부">홍보부</option>
                        <option value="해외파견부">해외파견부</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th width="100" class="table-danger">성별</th>
                <td>
                    <label>
                        <input type="radio" name="gender" value="남자" checked = "checked">남자
                        <input type="radio" name="gender" value="여자">여자
                    </label>
                </td>
            </tr>
            <tr>
                <th width="100" class="table-danger">프로필 사진</th>
                <td>
                    <img src="<%=dto.getPhoto()%>" class="photo" onerror="this.src = '../image/noimage2.png'">
                    <select class="form-select" name="photo" id="photo">
                        <option value="no">프로필사진 없음</option>
                        <%
                            for (int i = 1; i<=20; i++) { %>
                        <option value="../talent/<%=i%>.jpg">프로필사진 #<%=i%></option>
                        <%
                            }
                        %>
                    </select>
                    <script type="text/javascript">
                        $("#photo").change(function () {
                            let src = $(this).val();
                            $(".photo").attr("src", src);
                        });
                    </script>
                </td>
            </tr>
            <tr>
                <th width="100" class="table-danger">입사일</th>
                <td>
                    <input type="date" name="birthday" class="form=control" value="<%=dto.getBirthday()%>">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit" class="btn btn-outline-secondary btn-sm" style="width: 80px">사원 수정하기</button>
                    <button type="button" class="btn btn-outline-secondary btn-sm" style="width: 80px" onclick="location.href = './sawonlist.jsp'">사원 목록</button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
