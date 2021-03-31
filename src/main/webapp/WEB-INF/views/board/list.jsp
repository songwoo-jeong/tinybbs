<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
    <head>
        <title>게시판 - 목록 조회</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
        <meta charset="utf-8">
        <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body>
        <div class="container">
            <center>
                <header>
                    <h1>목록 보기</h1>
                </header>
                <hr/>
            </center>
            <div>
                <%@include file="nav.jsp" %>
            </div>
            <section id="container">
                <form role="form" method="get">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>등록일</th>
                            </tr>
                        </thead>
                        <c:forEach items="${list}" var="list">
                            <tr>
                                <td>
                               		<c:out value="${list.boardNum}"/>
                                </td>
                                <td>
                                    <a href="/board/readView?boardNum=${list.boardNum}"><c:out value="${list.boardTitle}"/></a>
                                </td>
                                <td>
                               		<c:out value="${list.boardWriter}"/>
                                </td>
                                <td>
                                	<fmt:formatDate value="${list.boardRegDate}" pattern="yyyy-MM-dd"/>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    </hr>              
					<button type="button" class="btn btn-default">
						<a href="/board/writeView" &nbsp;>글 작성&nbsp;</a>
					 </button>
                    <div class="col-md-offset-3">
                        <ul class="pagination">
                            <c:if test="${pageMaker.prev}">
                                <li>
                                    <a href= "list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a>
                                </li>
                            </c:if>
                            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                                <li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
                                    <a href="list${pageMaker.makeQuery(idx)}">${idx}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                <li>
                                    <a href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </form>
            </section>
        </div>
    </body>
</html>