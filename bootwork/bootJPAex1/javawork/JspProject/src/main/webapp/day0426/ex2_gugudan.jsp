<%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/04/29
  Time: 10:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html>
<head>
    <title>Title</title>

</head>
<body>
<table class="table table-bordered" style="width: 100%">
    <caption align="top"><h3><b>[구구단]</b></h3></caption>
    <tr class="table-light">
        <%
            for (int dan = 2; dan <= 9; dan++) {%>
        <td align="center"><b><%=dan%>단</b></td>
        <%
            }
        %>
    </tr>
    <%
        for (int i = 1; i <= 9; i++) {%>
    <tr>
        <%for (int dan = 2; dan <= 9; dan++) {%>
        <td align="center">
            <%=dan %>X<%=i %>=<%=dan * i %>
        </td>
        <%}%>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
