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
    if (findAmho) { %>
<pre>
(서울=연합뉴스) 송은경 기자 = 지난달 개인투자자들의 채권 순매수 규모가 4조7천억원을 기록하며 월별 순매수 기준 1년 만에 최고치를 경신했다.
7일 금융정보업체 연합인포맥스에 따르면 지난 4월 한 달간 개인의 채권 순매수액은 4조7천33억원으로 집계됐다.
기존 개인 월별 최대 순매수는 지난해 4월 기록한 4조5천527억원으로, 꼭 1년 만에 순매수 기록을 경신한 것이다.
관련 통계 작성 이래 개인 투자자의 월 단위 채권 순매수 규모가 4조원대에 이른 건 지난해 4월과 올해 2월에 이어 이번이 세 번째다.
올해 들어 개인의 채권 매수세는 작년보다 강한 편이다. 지난 1∼4월 개인의 채권 순매수액은 16조5천426억원으로 작년 동기(13조9천437억원) 대비 18.6% 증가했다.
월별 순매수 추이를 보면 1월은 3조8천908억원, 2월 4조2천464억원, 3월 3조7천19억원 등으로 1∼3월에는 4조원 안팎을 오가다가 지난달 4조원대 후반을 기록하며 매수세가 두드러졌다.
지난달 개인의 채권 순매수 규모는 은행(22조4천902억원)과 자산운용(21조3천405억원)을 제외하고 연기금·공제회(7조778억원), 외국인(5조4천972억원), 보험(4조9천569억원)과 견줄 정도다. 종금·상호금융(4조3천73억원)과 기타법인(4조1천987억원)은 개인이 뛰어넘었다.
4월 개인의 순매수가 역대 최대치를 경신한 것은 채권 금리가 오르며 매수세가 유입된 영향으로 풀이된다.
연초 연 3.24%였던 국고채 3년물 최종호가수익률은 지난달 29일 연 3.552%로 오르며 기준금리(연 3.50%)를 뛰어넘었고, 5년물과 10년물 금리도 지난달 25일 각각 연 3.625%, 3.707%로 연고점을 경신했다.
지난달 개인이 가장 많이 순매수한 종목은 지난 2019년 발행돼 오는 9월 만기가 도래하는 5년물 국고01375-2409(19-5) 채권으로 순매수 규모는 4천135억원으로 집계됐다.
만기가 약 30년 남은 장기채 국고03250-5403(24-2)와 국고01500-5003(20-2)는 각각 2천295억원, 1천773억원을 순매수했으며, 올해 6월 만기를 맞는 국고01125-2406(21-4)는 1천328억원어치를 사들였다.
김지만 삼성증권 연구원은 "작년 4월은 기준금리 대비 금리 역전 폭이 연중 가장 컸던 때였던 반면 이번 4월은 1∼3월 대비 금리가 상승한 상황이었다"며 "금리 여건이 작년과 달랐음에도 작년에 이어 올해 4월 개인들의 채권 투자가 역대 최고치를 경신한 것은 주식시장의 배당이 4월에 집중되고 그중 일부는 채권시장으로 유입되고 있는 것이 아닌가 한다"고 분석했다.
        </pre>
<% } else { %>
<script type="text/javascript">alert("먼저 암호를 입력해주세요");
history.back();</script>
<%
    }
%>
</body>
</html>
