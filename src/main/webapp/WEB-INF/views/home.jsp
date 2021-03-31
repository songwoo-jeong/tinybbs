<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
    <head>
        <title>Home</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
        <meta charset="utf-8">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#logoutBtn").on("click", function () {
                location.href = "member/logout";
            })
        })
    </script>
    <body>
        <form name='homeForm' method="post" action="/member/login">
            <c:if test="${member == null}">
                <div class="login=form">
                    <center>
                        <form>
                            <p>
                                <h2>로그인</h2>
                            </p>
                            <p>
                                <label for="userId"></label>
                                <input type="text" id="userId" name="userId" class="text-field" placeholder="아이디">
                            </p>
                            <p>
                                <label for="userPass"></label>
                                <input type="password" id="userPass" name="userPass" class="text-fied" placeholder="비밀번호">
                            </p>
                            <p>
                                <input type="submit" value="로그인" class="submit-btn">
                                <input type="button" onclick="location.href='member/register'" value="회원가입">
                            </p>
                        </form>
                    </div>
                </c:if>
            </center>
            <c:if test="${member != null }">
                <center>
                    <div>
                        <p></p>
                        <p>
                            <h2>${member.userId}님 환영 합니다.</h2>
                        </p>
                        <h3>
                            <button id="logoutBtn" type="button" style="padding : 10px" ;>로그아웃</button>
                        </h3>
                        <P>
                            <h2>
                                <a href="/board/list">게시판 입장</a>
                            </h2>
                        </P>
                    </div>
                </c:if>
                <c:if test="${msg == false}">
                    <center>
                        <p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
                    </center>
                </c:if>
            </center>
        </form>
    </body>
</html>