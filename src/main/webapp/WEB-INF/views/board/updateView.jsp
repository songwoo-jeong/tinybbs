<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>
<html>
    <head>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
        <center>
        <title>게시글 수정</title>
        </center>
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
            var btnEvent = $("form[name='updateForm']");
            $(".update_btn").on("click", function () {
                if (vailChk()) {
                    return false;
                }
                btnEvent.attr("action", "/board/update");
                btnEvent.attr("method", "post");
                btnEvent.submit();
            })
            $(".cancel_btn").on("click", function () {
                location.href = "/board/list";
            })
        })
        function vailChk() {
            var regForm = $("form[name='updateForm'] .chk").length;
            for (var i = 0; i < regForm; i++) {
                if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
                    alert($(".chk").eq(i).attr("title"));
                    return true;
                }
            }
        }
    </script>
    <body>
        <div class="container" id="root">
        	<center>
            <header>
                <h1>&nbsp;게시글 수정</h1>
            </header>
            </center>
            <hr/>
            <div>
                <%@include file="nav.jsp" %>
            </div>
            <section id="container">
                <form name="updateForm" method="post" action="/board/update">
                    <input type="hidden" name="boardNum" value="${update.boardNum}" readonly="readonly"/>
                    <table>
                        <tbody>
                            <c:if test="${member.userId != null}">
                                <tr>
                                    <td>
                                        <label for="boardTitle">제목</label>
                                    </td>
                                    <td>
                                        <input type="text" id="BoardTitle" name="BoardTitle" class="chk" title="제목을 입력하세요." value="${update.boardTitle}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="boardText">내용</label>
                                    </td>
                                    <td>
                                        <textarea id="BoardText" name="BoardText" class="chk" style="border:none; text-align:left; width:900px; height:400px; letter-spacing: 1px" title="내용을 입력하세요."><c:out value="${update.boardText}"/></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="boardWriter">작성자</label>
                                    </td>
                                    <td>
                                        <input type="text" id="BoardWriter" name="BoardWriter" readonly="readonly" class="chk" title="작성자를 입력하세요." value="${update.boardWriter}"/>
                                    </td>
                                    <td>
                                        <fmt:formatDate value="${update.boardRegDate}" pattern="yyyy-MM-dd"/>
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </form>
                <div>
                    <c:if test="${member.userId != null}">
                        <button class="update_btn" type="submit" style="padding:4px">&nbsp;&nbsp;완료&nbsp;&nbsp;</button>
                        <button class="cancel_btn" type="submit" style="padding:4px">&nbsp;&nbsp;취소&nbsp;&nbsp;</button>
                    </c:if>
                </div>
                <c:if test="${member.userId == null}">
                    <p>로그인 후에 수정하실 수 있습니다.</p>
                </c:if>
            </section>
            <hr/>
        </div>
    </body>
</html>