<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
    <title>Dashboard Template · Bootstrap v4.6</title>
<!-- config -->
<%@include file="/WEB-INF/views/admin/include/config.jsp" %>
  </head>
  <body>
<!-- navbar -->
<%@include file="/WEB-INF/views/admin/include/navbar.jsp" %>    

<div class="container-fluid">
  <div class="row">
    <!-- sidebarMenu -->
<%@include file="/WEB-INF/views/admin/include/sidebarMenu.jsp" %>

    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
      <section class="content container-fluid">
        <!--------------------------
          | Your Page Content Here |
          -------------------------->
         
          <div class="row">
            
            
            <div class="col-md-12">
            
              <div class="box">
                <div class="box-header with-border">
                  <form id="searchForm" action="/admin/member/member_list" method="get">
                    <div class="form-group row">
                      <div class="col-md-12">
                        가입일자 : <input type="date" name="sDate" value="${sDate}"> ~ <input type="date" name="eDate" value="${eDate}">
                        <select name="type">
                          <option value="" <c:out value="${pageMaker.cri.type == null? 'selected':'' }" />>-----</option>
                          <option value="I" <c:out value="${pageMaker.cri.type eq 'I'? 'selected':'' }" />>ID</option>
                          <option value="M" <c:out value="${pageMaker.cri.type eq 'M'? 'selected':'' }" />>이메일</option>
                          <option value="N" <c:out value="${pageMaker.cri.type eq 'N'? 'selected':'' }" />>닉네임</option>
                        </select>
                        <input type="text" name="keyword" placeholder="검색어를 입력하세요." value='<c:out value="${pageMaker.cri.keyword }" />'>
                        <input type="hidden" name="pageNum" value="1">
                        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                        <button type="submit" id="btn_memberSearch" class="btn btn-success">검색</button>
                      </div>
                    </div>
                  </form>
                </div>
              <!-- /.box-header -->
              <div class="box-body">
                <table class="table table-bordered" id="memberList">
                  <tbody><tr>
                    <th style="width: 2%"><input type="checkbox" id="checkAll"></th>
                    <th>아이디</th>
                    <th>이메일</th>
                    <th>닉네임</th>
                    <th>가입일</th>
                    <th>최종로그인</th>
                    <th>관리</th>
                  </tr>
                  <c:forEach items="${memberList }" var="memberVO">
                  <tr>
                    <td class="align-middle"><input type="checkbox" name="check" value="${orderVO.ord_no }"></td>
                    <td class="align-middle">${memberVO.u_id}</td>
                    <td class="align-middle">${memberVO.u_email}</td>
                    <td class="align-middle">${memberVO.u_nic}</td>
                    <td class="align-middle"><fmt:formatDate value="${memberVO.join_date}" pattern="yyyy-MM-dd HH:mm"/></td>
                    <td class="align-middle"><fmt:formatDate value="${memberVO.last_login_date}" pattern="yyyy-MM-dd HH:mm"/></td>
                    <td colspan="2" class="align-middle">
                      <button type="button" name="btn_memberEdit" data-u_id="${memberVO.u_id }" class="btn btn-link">수정</button>
                      <button type="button" name="btn_memberDel" data-u_id="${memberVO.u_id }" class="btn btn-link">삭제</button>
                    </td>
                  </tr>
                  </c:forEach>
                  
                </tbody></table>
              </div>
              <!-- /.box-body -->
              <!-- [이전] 1 2 3 4 5 [다음] 출력작업 -->
              <div class="box-footer clearfix row">
                <div class="col-md-1">
                  <button type="button" class="btn btn-primary" id="btn_memberInsert">회원 등록</button>
                </div>
                <div class="col-md-11">
                  <ul class="pagination justify-content-end">
                    <c:if test="${pageMaker.prev }">
                      <li class="page-item"><a class="page-link" href="${pageMaker.startPage - 1}">[prev]</a></li>
                    </c:if>
                    
                    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
                      <li class="page-item" ${pageMaker.cri.pageNum == pageNum ? "class='active'": ""}><a class="page-link" href="${pageNum }">${pageNum }</a></li>
                    </c:forEach>
                    
                    <c:if test="${pageMaker.next }">
                      <li class="page-item"><a class="page-link" href="${pageMaker.endPage + 1}">[next]</a></li>
                    </c:if>
                  </ul>
                  <!-- 페이징정보. Criteria 클래스 필드정보작업 -->
                  <form id="actionForm" action="/admin/member/member_list" method="get">
                    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                    <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                    <input type="hidden" name="type" value="${pageMaker.cri.type}">
                    <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                  </form>
                </div>
              </div>
            </div>
            
            </div>
          
          </div>
  
      </section>
    </main>
  </div>
</div>


<script>
  $(document).ready(function() {

 });
</script>
  </body>
</html>


