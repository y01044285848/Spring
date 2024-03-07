<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html>
<head>
    <title>member::modify</title>
</head>
<body>
<h3>member 수정</h3>
<a href="/ch05">메인</a>
<a href="/ch05/member/list">목록</a>
<form action="/ch05/member/modify" method="post">
    <table border="1">
        <tr>
            <td>아이디</td>
            <td><input type="text" name="uid"></td>
        </tr>
        <tr>
            <td>이름</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>휴대폰</td>
            <td><input type="text" name="hp"></td>
        </tr>
        <tr>
            <td>직급</td>
            <td>
                <select name="pos">
                    <option>사원</option>
                    <option>대리</option>
                    <option>과장</option>
                    <option>차장</option>
                    <option>부장</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>부서</td>
            <td>
                <select name="dep">
                    <option value="101">영업1부</option>
                    <option value="102">영업2부</option>
                    <option value="103">영업3부</option>
                    <option value="104">인사부</option>
                    <option value="105">경영지원부</option>
                </select>
            </td>
        </tr>

        <tr>
            <td colspan="2" align="right"><input type="submit" value="등록"></td>
        </tr>
    </table>

</form>
</body>
</html>