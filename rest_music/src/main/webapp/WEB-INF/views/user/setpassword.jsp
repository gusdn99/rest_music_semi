<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"><!--initial-scale=1는 브라우저 기본 비율 이용 -->
    <title>Rest</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous" />
    <link href="<c:url value='/css/common.css' />" rel="stylesheet"> <!-- 공통 CSS 파일 포함 -->
    <style>
        .change-password-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .change-password-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .change-password-header h2 {
            font-weight: bold;
        }
        .btn-primary {
            background-color: #6c757d;
            border-color: #6c757d;
        }
        .btn-outline-primary {
            color: #6c757d;
            border-color: #6c757d;
        }
        .btn-outline-primary:hover {
            background-color: #6c757d;
            color: #fff;
        }
        .form-text {
            color: #6c757d;
            font-size: 0.9em;
        }
    </style>
</head>

<body>
<header>
    <div class="container-fluid">
        <%@ include file="../fragments/header.jspf"%>
    </div>
</header>

<div class="container">
    <div class="change-password-container">
        <div class="change-password-header">
            <h2>비밀번호 변경</h2>
        </div>
        <form method="post" id="setPasswordForm" action="<%=request.getContextPath()%>/user/setpassword">
            <% if ("f".equals(request.getParameter("result"))) { %>
                <div class="text-danger">일치하는 정보가 없습니다.</div>
            <% } %>
            
            <div class="mb-3">
                <input type="password" id="password" name="password" class="form-control" 
                placeholder="새 비밀번호" required pattern="^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,}$" 
                title="8자 이상의 영문 대/소문자와 숫자를 포함해야 합니다.">
            </div>
            
            <div class="mb-3">
                <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="비밀번호 확인" required>
            </div>
            <div id="checkPasswordResult" class="text-danger"></div>
            <input type="hidden" name="userId" value="<%=request.getParameter("userId")%>" />

            <div class="d-grid mb-3">
                <input class="form-control btn btn-primary disabled"
                       type="submit" value="저장" id="btnSave" disabled/>
            </div>
        </form>
    </div>
</div>

<script>
    let refresh = '${refresh}';
    // 리다이렉트 시 재생페이지를 새로고침하기 위한 코드
</script>

<footer>
    <!-- 모달 요소들을 footer로 사용. 모든 페이지에 사용되기 때문 -->
    <%@ include file="../fragments/footer.jspf" %>
</footer>

<script src="<%=request.getContextPath()%>/js/setpassword.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous">

<c:url var="addCurrentPlayList" value="/js/addCurrentPlayList.js" />
<script src="${addCurrentPlayList}"></script>
</script>
</body>
</html>
