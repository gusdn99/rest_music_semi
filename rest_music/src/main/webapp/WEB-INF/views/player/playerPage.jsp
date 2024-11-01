<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
	<%@ taglib prefix="c" uri="jakarta.tags.core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<title>Insert title here</title>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
			<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
            <link href="../css/common.css" rel="stylesheet" /> <!-- 공통 CSS 파일 포함 -->
			<style>
				a {
					text-decoration-line: none;
					color: black;
				}

				a:hover {
					text-decoration: underline;
					font-weight: bold;
				}

				.volume-control {
					display: flex;
					align-items: center;
					justify-content: center;

				}

				/* 추가적인 스타일링은 여기에 추가할 수 있습니다. */
				.volume-slider {
					width: 80%;
					margin-left: 10px;
					margin-right: 10px;
				}

				.album-cover,
				#albumImage {
					width: 60px;
					/* 앨범 커버의 너비 */
					height: 60px;
					/* 앨범 커버의 높이 */
					/* justify-content: left; */
				}

				.info {
					display: flex;
					justify-content: left;
					flex-direction: column;
					/* 세로 방향으로 요소들을 배치 */
				}


				#music-title {
					font-size: 1em;
					/* 음악 제목의 글자 크기 */
				}

				#artist {
					font-size: 0.8em;
					margin-top: 1px;
					/* 가수 정보와 음악 제목 사이의 여백 */
				}

				#showModalButton {
					width: 200px;
					height: 70px;
					margin-left: 20px;
					margin-right: 20px;
				}
			</style>


		</head>

		<body>
			<div class="d-flex justify-content-between">
				<span>
					<span style="float:left;" class="m-2">
						<img id="albumImage" src="../images/icon/rest_logo.png">
					</span>
					<span class="info ms-2">
						<a id="music-title" class="my-1 fw-bold" target="mainFrame"></a>
						<a id="artist" class="my-1" target="mainFrame"></a>
					</span>
				</span>
				<span>
					<div class="my-0" style="text-align: center;">
						<span id="current">0:00</span> / <span id="total">0:00</span>
					</div>
					<div class="d-flex align-items-center">

						<div id="prevBtn" class="btn">
							<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" viewBox="0 0 24 24" fill="none"
								stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
								<polygon points="19 20 9 12 19 4 19 20"></polygon>
								<line x1="5" y1="19" x2="5" y2="5"></line>
							</svg>
						</div>
						<div id="pauseButton" style="display: block;" class="btn">
							<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" viewBox="0 0 24 24" fill="none"
								stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
								<rect x="6" y="4" width="4" height="16"></rect>
								<rect x="14" y="4" width="4" height="16"></rect>
							</svg>
						</div>
						<div id="playButton" style="display: none;" class="btn">
							<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" viewBox="0 0 24 24" fill="none"
								stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
								<polygon points="5 3 19 12 5 21 5 3"></polygon>
							</svg>
						</div>
						<div id="stopBtn" class="btn"">
							<svg xmlns=" http://www.w3.org/2000/svg" width="50" height="50" viewBox="0 0 24 24" fill="none"
							stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
							<rect x="6" y="6" width="12" height="12"></rect>
							</svg>
						</div>

						<div id="nextBtn" class="btn"">
							<svg xmlns=" http://www.w3.org/2000/svg" width="50" height="50" viewBox="0 0 24 24" fill="none"
							stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
							<polygon points="5 4 15 12 5 20 5 4"></polygon>
							<line x1="19" y1="5" x2="19" y2="19"></line>
							</svg>
						</div>

					</div>
				</span>
				<!-- <div class="volume-control d-flex align-items-center justify-content-center">
					<div>
						<div class="mr-3">
							<button class="btn btn-secondary" id="muteButton">
								<i id="muteIcon" class="bi bi-volume-up-fill"></i>
							</button>
							<div class="volume-slider mx-4">
								<input type="range" min="0" max="1" step="0.1" value="1" class="form-range" id="volumeSlider">
							</div>
						</div>
					</div>
					<div>
						<button id="showModalButton">
							현재재생목록
						</button>
					</div> -->
				<div class="volume-control d-flex align-items-center justify-content-center">
					<button class="btn btn-secondary" id="muteButton">
						<i id="muteIcon" class="bi bi-volume-up-fill"></i>
					</button>
					<div class="volume-slider">
						<input type="range" min="0" max="1" step="0.1" value="0.5" class="form-range" id="volumeSlider">
					</div>
						<img style="cursor: pointer; width: 70px; height: 70px;"  id="showModalButton" alt="현재재생목록" src="/Rest/images/icon/CPList.png" >
				</div>
			</div>
			</div>
			<div class="progress" style="cursor: pointer;">
				<div id="progress" class="progress-bar bg-success " role="progressbar" style="width: 1%" aria-valuemin="0"
					aria-valuemax="100">
				</div>
				<div id="minute1" class="progress-bar bg-success" role="progressbar" style="width: 0%; opacity : 0;"
					aria-valuemin="0" aria-valuemax="100"></div>
			</div>
			<div>
				<c:url var="refresh" value="/player/playerPage" />
				<a id="refresh" href="${refresh}" target="songFrame" style="display: none;">새로고침</a>
			</div>



			<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
				integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
				crossorigin="anonymous"></script>
			<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
			<script>
				// 로그인한 아이디 정보 전달
				const id = '${loginUserId}'; //id
				// 모델에서 전달받은 JSON 데이터
				var cPListJson = `${cPList}`;

				// cPList를 JavaScript 객체로 파싱 (JSON 문자열을 객체로 변환)
				var cPList = JSON.parse(cPListJson);

				// 예시: cPListObj를 사용한 자바스크립트 동작
				console.log(cPList); // 데이터 확인용

				// 여기에 추가적인 자바스크립트 코드 작성
				// 예를 들어, cPListObj를 이용하여 원하는 동적 처리를 할 수 있음

				let refresh = '${refresh}';
			</script>
			<script src="../js/playerPage.js"></script>

		</body>

		</html>