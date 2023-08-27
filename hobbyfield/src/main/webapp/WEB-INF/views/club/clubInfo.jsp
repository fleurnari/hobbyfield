<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임 세부조회</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .info-section {
            width: 80%;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            border-bottom: 2px solid #e0e0e0;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        ul li {
            margin-bottom: 10px;
            font-size: 16px;
        }

        ul li img {
            max-width: 100%;
            border-radius: 10px;
        }

        ul li strong {
            font-weight: bold;
        }

    </style>
</head>
<body>
    <div class="info-section">
        <h2>${clubInfo.clubName}</h2>
        <ul>
            <li><strong>카테고리:</strong> ${clubInfo.clubCategory}</li>
            <li><strong>프로필 닉네임:</strong> ${clubInfo.profileNickname}</li>
            <li><strong>모임 유형:</strong> ${clubInfo.clubType}</li>
            <li><strong>모임 정보:</strong> ${clubInfo.clubInfo}</li>
            <li><strong>대표 지역:</strong> ${clubInfo.majorLocation}</li>
            <li><strong>하위 지역:</strong> ${clubInfo.subLocation}</li>
            <li><img src="${clubInfo.clubImgPath}/${clubInfo.clubImg}" alt="모임 이미지"></li>
        </ul>
    </div>
</body>
</html>
