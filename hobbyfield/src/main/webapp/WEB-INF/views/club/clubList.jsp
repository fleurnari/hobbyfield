<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<head>
    <meta charset="UTF-8">
    <title>클럽목록</title>
    <style>
        #clubContainer {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        .clubItem {
            width: 23%; /* 4개씩 나열될 수 있도록 너비 설정 */
            margin: 10px;
            border: 1px solid #ccc;
            border-radius: 10px; /* 굴곡진 모서리 */
            overflow: hidden; /* 이미지가 박스를 벗어나지 않도록 함 */
            transition: transform 0.2s; /* 부드러운 hover 효과 */
            position: relative; /* 하위 요소의 위치 지정을 위해 */
        }

        .clubItem:hover {
            transform: scale(1.05); /* 이미지를 클릭할 때 크기를 약간 확대 */
        }

        .clubItem img {
            width: 100%;
            height: 350px;
            object-fit: cover; /* 이미지가 박스 내에 꽉 차도록 */
        }

        .clubInfo {
            display: none; /* 기본적으로 정보는 숨김 */
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7); /* 반투명 배경 */
            color: white;
            padding: 10px;
            box-sizing: border-box;
        }

        .clubItem:hover .clubInfo {
            display: block; /* 마우스를 올리면 정보 표시 */
        }
    </style>
</head>

<body>
<section>
    <div align="center" style="margin-top: 100px;">
        <input type="text" id="memberEmail" value="${member.memberEmail}">
        <div id="clubContainer">
            <c:forEach items="${clubList}" var="club">
                <div class="clubItem" onclick="location.href='clubInfo?clubNumber=${club.clubNumber}&profileNickname=${club.profileNickname}'">
                    <img src="${club.clubImgPath}${club.clubImg}">
                    <div class="clubInfo">
                        <p>모임리더: ${club.profileNickname}</p>
                        <p>모임이름: ${club.clubName}</p>
                        <p>카테고리: ${club.clubCategory}</p>
                        <p>분류: ${club.clubType}</p>
                        <p>소개글: ${club.clubInfo}</p>
                        <p>광역시: ${club.majorLocation}</p>
                        <p>구: ${club.subLocation}</p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
</body>


</html>