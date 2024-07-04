<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
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
</style>
</head>
<body>
	<h3 class="alert alert-danger">Get 방식으로 데이터 읽기 - 각각</h3>
	<form action="./read1" method="get">
		<div class="input-group" style="width: 300px">
			<h4>이름</h4>
			<input type="text" name="name" class="form-control">
		</div>

		<div class="input-group" style="width: 300px">
			<h4>주소</h4>
			<input type="text" name="addr" class="form-control">
		</div>

		<div class="input-group" style="width: 300px">
			<h4>나이</h4>
			<input type="text" name="age" class="form-control">
		</div>

		<button type="submit" class="btn btn-success">서버 전송</button>
	</form>
</body>
</html>