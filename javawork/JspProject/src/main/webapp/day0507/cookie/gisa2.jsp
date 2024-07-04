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
(워싱턴=연합뉴스) 조준형 송상호 특파원 = 한국에 배치돼 복무했던 한 미군 부사관이 최근 러시아를 방문했다가 현지 당국에 구금된 것으로 6일(현지시간) 확인됐다.
신시아 스미스 미 육군 대변인은 이날 성명을 통해 "지난 2일 러시아 블라디보스토크에서 러시아 당국이 미국 군인 한 명을 범죄 혐의로 구금했다"며 "러시아 정부는 미국 국무부에 형사 구금 사실을 영사관계에 관한 빈협약에 따라 통보했다"고 전했다.
스미스 대변인은 "육군은 가족에게 이를 통보했으며, 미 국무부가 러시아에 있는 해당 군인에게 적절한 영사 지원을 제공하고 있다"고 말했다.
스미스 대변인은 이어 "이 문제의 민감성 때문에 우리는 현단계에서 더 구체적인 정보를 제공할 수 없다"고 밝혔다.
존 커비 미국 백악관 국가안보소통보좌관은 이날 브리핑에서 이 같은 사실을 파악하고 있다고 말했다.
AP통신 등 미국 언론들은 러시아에 구금된 미군이 고든 블랙 하사(34세)라고 전했다.
그는 주한미군에 배속돼 있다가 텍사스의 미군 주둔지 '포트 카바조스'로 복귀하는 과정에 있었으나 곧바로 복귀하지 않고 러시아를 여행했다고 AP는 전했다.
미국 정부 당국자는 연합뉴스와의 통화에서 해당 군인이 한국에서의 근무를 마친 뒤 휴가를 낸 상태에서 러시아에 체류중이었다고 설명했다.
미국 국무부는 러시아를 여행 경보 4단계 중 가장 높은 '적색 경보' 국가로 지정해 '여행하지 말 것'을 권고하고 있다.
러시아 매체 이즈베스티야는 익명 소식통을 인용, 한국에서 근무하던 해당 부사관이 인터넷을 통해 블라디보스토크 출신 여성을 만나 한동안 동거했으나 그 여성을 폭행하고, 그녀의 돈 20만 루블(약 300만 원)을 훔쳤다고 보도했다.
이 사안은 평시 같으면 러시아 사법 체계하에서의 처벌 또는 추방 등 형식으로 매듭지어질 수도 있으나 우크라이나 전쟁 와중에 미국과 러시아 관계가 극도로 악화한 상황이라는 점에서 추이가 주목된다.
마이클 매콜 미 하원 외교위원장(공화·텍사스)은 자신의 엑스(X·옛 트위터) 계정에 미국 군인의 이번 구금을 "깊이 우려한다"며 "푸틴은 미국 시민을 인질로 잡은 오랜 역사가 있다"고 지적했다.
매콜 위원장은 이어 "국무부가 밝힌 바와 같이 러시아를 여행하는 것은 안전하지 않다는 것을 보여주는, 모든 미국인에 주는 경고"라고 부연했다.
현재 러시아에는 미국 국적의 월스트리트저널(WSJ) 기자 에반 게르시코비치(32)가 간첩 혐의로 1년 이상 구금돼 있다.
게르시코비치 기자는 지난해 3월 30일 취재를 위해 러시아 중부 예카테린부르크를 방문했다가 간첩 혐의로 연방보안국(FSB)에 체포됐다.
한편 작년 7월에는 주한미군 트래비스 킹(당시 이병)이 판문점 공동경비구역(JSA)을 견학하다가 무단으로 군사분계선(MDL)을 넘어 북한으로 갔다가 2개월여 만에 추방 형식으로 풀려난 일이 있었다.
        </pre>
<% } else { %>
<script type="text/javascript">alert("먼저 암호를 입력해주세요");
history.back();</script>
<%
    }
%>
</body>
</html>
