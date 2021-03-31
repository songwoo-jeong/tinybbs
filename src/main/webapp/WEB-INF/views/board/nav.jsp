<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
<style>
    type="text/css"
    table,
    th,
    td {
        vertical-align: middle;
    }
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <div>
    <span style="float:left;">
        <c:if test="${member.userId != null}">
            ${member.userId}님이 로그인 중입니다. 	&nbsp; <button style="padding : 3px" class="btn btn-default" ><a href="/member/logout">&nbsp;로그아웃&nbsp;</a></button>
        </c:if>
        <c:if test="${member.userId == null}">
            guest님 안녕하세요. &nbsp; <button style="padding : 3px" class="btn btn-default" ><a href="/">로그인</a></button>
        </c:if>
    </span>
    </div>
<br>
<hr/>