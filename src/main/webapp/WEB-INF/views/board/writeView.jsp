<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>
<html>
    <head>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
        <title>게시글 작성</title>
    </head>
    <meta http-equiv="Expires" content="0"/>
	<meta http-equiv="Pragma" content="no-cache"/>
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
            var btnEvent = $("form[name='writeForm']");
            $(".write_btn").on("click", function () {
                if (vailChk()) {
                    return false;
                }
                btnEvent.attr("action", "/board/write");
                btnEvent.attr("method", "post");
                btnEvent.submit();
            })
            $(".cancel_btn").on("click", function () {
                location.href = "/board/list";
            })
        })
        function vailChk() {
            var regForm = $("form[name='writeForm'] .chk").length;
            for (var i = 0; i < regForm; i++) {
                if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
                    alert($(".chk").eq(i).attr("title"));
                    return true;
                }
            }
        }
    </script>
    <body>
        <div id="root" class="container" role="main">
        	<center>
            <header>
                <h1>&nbsp;게시글 작성</h1>
            </header>
            </center>
            <hr>
            <div>
                <%@include file="nav.jsp" %>
            </div>
            <section id="container">
                <form name="writeForm" method="post" action="/board/write">
                    <table>
                        <tbody>
                            <c:if test="${member.userId != null}">
                                <tr>
                                    <td>
                                        <label for="title">제목</label>
                                    </td>
                                    <td>
                                        <input type="text" id="BoardTitle" name="BoardTitle" class="chk" title="제목을 입력하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="content">내용</label>
                                    </td>
                                    <td>
                                        <textarea id="BoardText" name="BoardText" class="chk" style="border:none; text-align:left; width:900px; height:400px; letter-spacing: 1px" title="내용을 입력하세요."></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="writer">작성자</label>
                                    </td>
                                    <td>
                                        <input type="text" id="BoardWriter" name="BoardWriter" value="${member.userId}" readonly="readonly" class="chk" title="작성자를 입력하세요."/>
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </form>
                <div>
                    <c:if test="${member.userId != null}">
                        <button class="write_btn" type="submit" style="padding:4px">&nbsp;&nbsp;작성&nbsp;&nbsp;</button>
                        <button class="cancel_btn" type="submit" style="padding:4px">&nbsp;&nbsp;취소&nbsp;&nbsp;</button>
                    </c:if>
                </div>
            </section>
            <div>
            <c:if test="${member.userId == null}">
                   <p>&nbsp;&nbsp;&nbsp;&nbsp;로그인 후에 작성하실 수 있습니다.</p>
            </c:if>
            </div>
        </div>
    </body>
</html>