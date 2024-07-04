<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+Han+Sans&family=Bungee+Spice&family=Diphylleia&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Nanum+Pen+Script&family=Song+Myung&display=swap"rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <style>
        body * {
            font-family: "Song Myung";
        }
    </style>
</head>
<body>
<h3 class="alert alert-danger">Get 방식으로 데이터 읽기 - map</h3>
	<form action="./read4" method="post">
		<table class="table" style="width: 300px">
			<tr>
				<th width="100">메뉴명</th>
				<td>
					<input type="text" name="foodname" class="form-control">
				</td>
			</tr>
			<tr>
				<th width="100">사진</th>
				<td class="input-group">
					<select name="foodphoto" id = "fphoto">
						<c:forEach var="s" begin="1" end="12" >
							<option>${s}.jpg</option>
						</c:forEach>
					</select>
					<img src="./food/1.jpg" width="40" border="1" id="foodphoto">
					<script type="text/javascript">
						$("#fphoto").change(
								function() {
									$("#foodphoto").attr("src","./food/"+$(this).val());
								});
					</script>
				</td>
			</tr>
			<tr>
				<th width="100">가격</th>
				<td>
					<input type="text" name="price" class="form-control">
				</td>
			</tr>
			<tr>
				<th width="100">갯수</th>
				<td>
					<input type="text" name="cnt" class="form-control">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">폼 전 체 전송</button>
				</td>
		</table>
	</form>
</body>
</html>