<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<!--
    날짜 : 2024-03-05
    이름 : 이승윤
    내용 : Spring MVC 실습

    Spring MVC 라이브러리
    - spring-context 6.1.4
    - spring-webmvc 6.1.4
    - jakarta-servlet-api 6.0.0
    - jakarta-servlet.jsp.jstl-api 3.0.0
    - jakarta-servlet.jsp.jstl 3.0.1


    WebApplicationInitializer
    - 스프링 웹 애플리케이션 초기화를 위한 인터페이스
    - DispatcherServlet을 생성하고 컨텍스트 등록
    - 웹 애플리케이션 컨텍스트(컨테이너)를 결정하고 필요한 서블릿, ??, 리스너 등 설정

    WebMvcConfigurer
    - 스프링 웹 MVC 구성 컴포넌트 설정을 위한 인터페이스
    - 뷰리졸버(ViewResolver) 설정 및 ResourceHandler 설정 등 애플리케이션 전반에 걸친 자원 설정

    @EnableWebMvc
    - 스프링 MVC를 구성하고 MVC 관련 기능을 활성화 하는 어노테이션

    Tomcat 관련 설정
     - apache-tomcat 10.1.19로 해야 함.



<head>
    <meta charset="UTF-8">
</head>

-->

<body>
    <h2>ch04.Spring MVC</h2>
    <a href="/ch04/hello">hello</a>
    <a href="/ch04/welcome">welcome</a>
    <a href="/ch04/greeting">greeting</a>

    <h2>user1 실습</h2>
    <a href="/ch04/user1/list">목록</a>
    <a href="/ch04/user1/register">등록</a>

    <h2>user2 실습</h2>
    <a href="/ch04/user2/list">목록</a>
    <a href="/ch04/user2/register">등록</a>

    <h2>user3 실습</h2>
    <a href="/ch04/user3/list">목록</a>
    <a href="/ch04/user3/register">등록</a>

    <h2>user4 실습</h2>
    <a href="/ch04/user4/list">목록</a>
    <a href="/ch04/user4/register">등록</a>

    <h2>user5 실습</h2>
    <a href="/ch04/user1/list">목록</a>
    <a href="/ch04/user1/register">등록</a>

</body>
</html>
