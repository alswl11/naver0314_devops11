<%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/05/07
  Time: 9:55 AM
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
    </style>
</head>
<%
    // amho라는 쿠키가 있으면 true, or fals
    boolean findAmho = false;
    Cookie [] cookies = request.getCookies();
    if(cookies!=null) {
        for(Cookie ck:cookies) {
            String name = ck.getName();
            if(name.equals("amho")) {
                findAmho = true;
                break;
            }
        }
    }
%>
<body>
<%
    if(findAmho) { %>
        <pre>
            (서울=연합뉴스) 김병규 기자 = 정부가 의사 집단행동 장기화에 대비해 비상진료에 대한 건강보험 지원을 한 달 더 연장하기로 했다.
            또 의대 교수들이 의대증원이 확정되면 1주일 휴진을 하겠다고 밝힌 것에 대해서는 집단행동을 멈추라고 촉구했다.
            조규홍 보건복지부 장관은 7일 정부서울청사에서 의사 집단행동 중앙재난안전대책본부(중대본) 회의를 주재하고 "향후 비상진료 상황이 장기화할 가능성에 대비해 건강보험 지원을 11일부터 한 달간 연장할 계획"이라고 밝혔다.정부는 지난 2월부터 응급·중증환자 가산 확대, 응급실 전문의 진찰료 인상 등에 매달 1천900억 원을 투입하고 있다.
            조 장관은 전공의 이탈로 발생한 공백을 메우기 위해 군의관 36명을 추가로 파견해 수요는 많지만, 인력이 부족한 병원에 집중적으로 배치하겠다고도 밝혔다.
            정부는 이미 공보의·군의관 427명을 파견했는데, 피로도를 고려해 이들 중 146명을 단계적으로 교체할 계획이다.
            정부는 아울러 비상진료 상황에서 상급종합병원 못지않게 중요한 역할을 하는 종합병원과 전문병원에 대한 지원을 강화해 전문의와 진료 지원(PA) 간호사에 대한 지원을 상급종합병원과 동등한 수준으로 확대할 계획이다.
        </pre>
   <% } else { %>
        <script type="text/javascript">alert("먼저 암호를 입력해주세요");history.back();</script>
   <%}
%>
</body>
</html>
