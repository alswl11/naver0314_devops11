<%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/05/02
  Time: 10:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+Han+Sans&family=Bungee+Spice&family=Diphylleia&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Nanum+Pen+Script&family=Song+Myung&display=swap"
          rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <style>
        body * {
            font-family: "Song Myung";
        }
        #showing {
            position: absolute;
            top: 100px;
            left: 450px;
            width: 200px;
        }
    </style>
    <script type="text/javascript">
        function preview(tag){
            if(tag.files[0]){
                let reg = /(.*?)\/(jpg|jpeg|png|gif)$/
                let f = tag.files[0]
                if(!f.type.match(reg)){
                    alert("이미지 파일만 가능합니다.")
                    return
                }
                if(!f.type.match("image.*")){
                    alert("이미지 파일만 가능합니다")
                }
                if(f){
                    let reader = new FileReader()
                    reader.onload = function (e){
                        $("#showing").attr("src", e.target.result)
                    }
                    reader.readAsDataURL(tag.files[0])
                }
            }
        }

    </script>
</head>
<body>
<div style="margin: 20px; width: 400px">
    <form action="memoaction.jsp" method="post" enctype="multipart/form-data">
        <table class="table table-bordered">
            <caption align="top"><b>간단한 메모 추가</b>
            <tr>
                <th width="100" class="table-danger">제목</th>
                <td>
                    <input type="text" name="title" class="form-control" required = "required">
                </td>
            </tr>
            </caption>
            <tr>
                <th width="100" class="table-danger">사진 업로드</th>
                <td>
                    <input type="file" name="upload" onchange="preview(this)" style="width: 200px">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <textarea style="width: 100%; height: 100px;" name="content" class="form-control" required = "required" ></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit" class="btn btn-secondary"> 메모 저장</button>
                </td>
            </tr>
        </table>
    </form>
    <img src="" id="showing" onerror="this.src = '../image/noimage1.png'">
</div>
</body>
</html>
