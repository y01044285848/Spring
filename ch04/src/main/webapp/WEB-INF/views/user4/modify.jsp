<%--
  Created by IntelliJ IDEA.
  User: java
  Date: 2024-03-05
  Time: 오전 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html>
<head>
    <title>user4::register</title>
</head>
<body>
<h3>user1 수정</h3>
<a href="/ch04">메인</a>
<a href="/ch04/user4/list">목록</a>
<form action="/ch04/user4/modify" method="post">
    <table border="1">
        <tr>
            <td>아이디</td>
            <td><input type="text" name="uid" readonly value="${user1DTO.uid}"></td>
        </tr>
        <tr>
            <td>이름</td>
            <td><input type="text" name="name" value="${user1DTO.name}"></td>
        </tr>
        <tr>
            <td>생년월일</td>
            <td><input type="text" name="gender" value="${user1DTO.gender}"></td>
        </tr>
        <tr>
            <td>나이</td>
            <td><input type="number" name="age" value="${user1DTO.age}"></td>
        </tr>
        <tr>
            <td>휴대폰</td>
            <td><input type="text" name="hp" value="${user1DTO.hp}"></td>
        </tr>
        <tr>
            <td>주소</td>
            <td><input type="text" name="addr" value="${user1DTO.addr}"></td>
        </tr>
        <tr>
            <td colspan="2" align="right"><input type="submit" value="수정"></td>
        </tr>
    </table>

</form>
</body>
</html>
