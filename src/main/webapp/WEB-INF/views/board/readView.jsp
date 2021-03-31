<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
    <head>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
       
        <title>상세보기</title>
       
    </head>
    <style>
        table,
        th,
        td {
            border: 1px solid #bcbcbc;
            vertical-align: middle;
           }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            var btnEvent = $("form[name='readForm']");
            // 수정
            $(".update_btn")
                .on("click", function () {
                	btnEvent.attr("action", "/board/updateView");
                	btnEvent.attr("method", "get");
                	btnEvent.submit();
                })
                // 삭제
                $(".delete_btn")
                .on("click", function () {
                    var delChk = confirm("삭제하시겠습니까?");
                    if (delChk == true) {
                    	btnEvent.attr("action", "/board/delete");
                    	btnEvent.attr("method", "post");
                    	btnEvent.submit();
                    }
                })
                // 취소
                $(".list_btn")
                .on("click", function () {
                    location.href = "/board/list";
                })
        })
    </script>
    <body>
        <div class="container" id="root">
        	<center>
            <header>
                <h1>&nbsp상세 보기</h1>
            </header>
            </center>
            <hr/>
            <div>
                <%@include file="nav.jsp" %>
            </div>
            <div>
            <section id="container">
                <form name="readForm" role="form" method="post">
                    <input type="hidden" id="boardNum" name="boardNum" value="${read.boardNum}"/>
                </form>
                <table>
                    <tbody>
                        <tr>
                            <td>
                                <label for="title">&nbsp제목&nbsp</label>
                            </td>
                            <td>
                                <input type="text" id="title" name="title" style="border:none;" value="${read.boardTitle}" readonly="readonly"/>
                            </td>
                        </tr>
                        <tr>
                            <td valign="middle">
                                <label for="content">&nbsp내용&nbsp</label>
                            </td>
                            <td>
                                <textarea id="boardText" name="boardText" style="border:none; text-align:left; width:900px; height:400px; letter-spacing: 1px" readonly="readonly"><c:out value="${read.boardText}"/></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="writer">&nbsp작성자&nbsp</label>
                            </td>
                            <td>
                                <input type="text" id="boardWriter" name="boardWriter" style="border:none;" value="${read.boardWriter}" readonly="readonly"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="boardRegDate">&nbsp작성날짜&nbsp</label>
                            </td>
                            <td>
                                <fmt:formatDate value="${read.boardRegDate}" pattern="yyyy-MM-dd"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <p>
                    <div>
                        &nbsp;&nbsp;<button type="submit" class="list_btn" style="padding:3px">&nbsp;&nbsp;목록&nbsp;&nbsp;</button>
                        <c:if test="${member.userId == read.boardWriter}">
                            <button type="submit" class="update_btn" style="padding:3px">&nbsp;&nbsp;수정&nbsp;&nbsp;</button>
                            <button type="submit" class="delete_btn" style="padding:3px">&nbsp;&nbsp;삭제&nbsp;&nbsp;</button>
                        </c:if>
                    </div>
                </p>
            </section>
            </div>
        </p>
        <p>
            <hr/>
        </p>
    </body>
</html>