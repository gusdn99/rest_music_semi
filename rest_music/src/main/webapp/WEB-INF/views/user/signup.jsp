<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <link href="<c:url value='/css/common.css' />" rel="stylesheet"> <!-- 공통 CSS 파일 포함 -->
    <style>
        .form-signup {
            max-width: 400px;
            padding: 20px;
            margin: 50px auto;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .form-signup .form-signup-heading {
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .form-signup .form-control {
            position: relative;
            box-sizing: border-box;
            height: auto;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc; 
        }
        .form-signup .form-control h3 {
            z-index: 2;
            border-color: #6c757d; 
        }
        .form-signup .input-group-append .btn {
            background-color: #6c757d; 
            border-color: #6c757d;
            color: #fff;
            height: 100%; 
        }
        .form-signup .input-group-append .btn:hover {
            background-color: #5a6268; 
            border-color: #5a6268;
            color: #fff;
        }
        .form-signup .text-danger {
            margin-top: 5px;
            font-size: 12px;
        }
        .btn-primary {
            background-color: #6c757d; 
            border-color: #6c757d;
        }
        .btn-primary:hover {
            background-color: #5a6268; 
            border-color: #5a6268;
        }
        .btn-outline-secondary {
            color: #6c757d;
            border-color: #6c757d;
        }
        .btn-outline-secondary:hover {
            background-color: #6c757d;
            color: #fff;
        }
        .btn.disabled, .btn:disabled {
            background-color: #b3b3b3;
            border-color: #b3b3b3;
        }
        
        .form-signup h3 {
            text-align: center;
            margin-bottom: 20px;
        }
        
       .font-weight: bold;
            margin-top: 20px;
    </style>
</head>
<body>
    <header>
        <div class="container-fluid">
            <%@ include file="../fragments/header.jspf" %>
        </div>
    </header>

    <div class="container">
        <form class="form-signup" id="signupForm">
            <img src="<c:url value='/data/logo.png'/>" alt="Rest Logo" style="height: 40px;">
            <h3 style="margin-top: 20px;">회원가입</h3>

            <div class="input-group mb-3">
                <input type="text" id="userid" name="userId" class="form-control" 
                placeholder="아이디를 입력해주세요" required autofocus pattern="^[a-z0-9]{5,20}$" 
                title="5~20자의 영문 소문자와 숫자만 사용 가능합니다.">
            </div>
            <div id="checkUseridResult" class="text-danger"></div>

            <div class="mb-3">
                <input type="password" id="password" name="password" class="form-control" 
                placeholder="비밀번호를 입력해주세요" required pattern="^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,30}$" 
                title="8자~30자의 영문 대/소문자와 숫자를 포함해야 합니다.">
            </div>

            <div class="mb-3">
                <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" 
                placeholder="비밀번호를 한번 더 입력해주세요" required>
                <div id="checkPasswordResult" class="text-danger"></div>
            </div>

            <div class="mb-3">
                <input type="text" id="username" name="userName" class="form-control" 
                placeholder="이름을 입력해 주세요" required>
            </div>

            <div class="input-group mb-3">
                <input type="email" id="email" name="email" class="form-control" 
                placeholder="예: rest@rest.com" required>
                <div class="input-group-append">
                    <button type="button" class="btn btn-primary" id="mailCheckBtn">인증번호 받기</button>
                </div>
            </div>
            <div id="checkEmailResult" class="text-danger"></div>

            <div class="input-group mb-3">
                <input type="text" id="emailVerificationCode" name="emailAuthNumber" class="form-control"
                    placeholder="인증번호를 입력해주세요" maxlength="6">
                <div class="input-group-append">
                    <button type="button" class="btn btn-primary" id="verifyCodeBtn">인증번호 확인</button>
                </div>
            </div>
            <span id="emailVerificationResult" class="text-danger"></span>

            <div class="input-group mb-3">
                <input type="text" id="nickname" name="nickname" class="form-control" 
                placeholder="닉네임을 입력해주세요" required pattern="^[a-zA-Z0-9가-힣]{2,20}$"
                title="2~20자의 영문, 숫자, 한글만 사용 가능합니다.">
            </div>
            <div id="checkNicknameResult" class="text-danger"></div>

            <div class="mb-3">
                <select class="form-control" id="hintQuestionSelect" name="hintQuestionSelect">
                    <option value="" selected>힌트 질문</option>
                    <option value="1">좋아하는 색깔은?</option>
                    <option value="2">핸드폰번호 뒷자리는?</option>
                    <option value="3">내 성별은?</option>
                </select>
                <input type="text" class="form-control mt-2 d-none" id="hintQuestion" name="hintQuestion" value="">
            </div>

            <div class="mb-3">
                <input type="text" id="hintAnswer" name="hintAnswer" class="form-control" placeholder="힌트 답변을 입력해주세요">
                <div id="checkHintAnswerResult" class="form-text"></div>
            </div>

            <div class="d-grid mb-3">
                <button class="btn btn-primary" type="submit" id="btnSignUp" disabled>가입</button>
            </div>
            <div class="d-grid mb-3">
                <button id="loginBtn" class="btn btn-outline-secondary" type="button" 
                onClick="location.href='/Rest/user/signin'">로그인</button>
            </div>
        </form>
    </div>
    <footer>
        <!-- 모달 요소들을 footer로 사용. 모든 페이지에 사용되기 때문 -->
        <%@ include file="../fragments/footer.jspf" %>
    </footer>
    <script>
        let refresh = '${refresh}';
        // 리다이렉트 시 재생페이지를 새로고침하기 위한 코드
    </script>
    <script src="<%= request.getContextPath() %>/js/signup.js"></script>
    <c:url var="addCurrentPlayList" value="/js/addCurrentPlayList.js" />
    <script src="${addCurrentPlayList}"></script>
</body>
</html>
