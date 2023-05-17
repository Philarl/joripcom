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
<!-- link -->
<%@include file="/WEB-INF/views/admin/include/link.jsp" %>
<script>
  
  let msg = "${msg}";
  if(msg == 'modify') {
    alert("상품이 수정되었읍니다.");
  }else if(msg == 'delete') {
    alert("상품이 삭제되었읍니다.");
  }

</script>    
  </head>
  <body>
<!-- navbar -->
<%@include file="/WEB-INF/views/admin/include/navbar.jsp" %>    

<div class="container-fluid">
  <div class="row">
		<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
		  <div class="sidebar-sticky pt-3">
		    <ul class="nav flex-column">
		      <li class="nav-item">
		        <a class="nav-link active" href="#">
		          <span data-feather="home"></span>
		          Dashboard <span class="sr-only">(current)</span>
		        </a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#">
		          <span data-feather="file"></span>
		          Orders
		        </a>
		      </li>
		    <li class="nav-item dropdown">
		      <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
					<span data-feather="shopping-cart"></span>&nbsp;상품
		      </a>
		      <ul class="dropdown-menu">
		        <li><a class="dropdown-item" href="/admin/product/pro_insert">상품등록</a></li>
		        <li><a class="dropdown-item" href="/admin/product/pro_list">상품목록</a></li>
		      </ul>
		    </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#">
		          <span data-feather="users"></span>
		          Customers
		        </a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#">
		          <span data-feather="bar-chart-2"></span>
		          Reports
		        </a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#">
		          <span data-feather="layers"></span>
		          Integrations
		        </a>
		      </li>
		    </ul>
		
		    <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
		      <span>Saved reports</span>
		      <a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report">
		        <span data-feather="plus-circle"></span>
		      </a>
		    </h6>
		    <ul class="nav flex-column mb-2">
		      <li class="nav-item">
		        <a class="nav-link" href="#">
		          <span data-feather="file-text"></span>
		          Current month
		        </a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#">
		          <span data-feather="file-text"></span>
		          Last quarter
		        </a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#">
		          <span data-feather="file-text"></span>
		          Social engagement
		        </a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#">
		          <span data-feather="file-text"></span>
		          Year-end sale
		        </a>
		      </li>
		    </ul>
		  </div>
		</nav>

    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
      <section class="content container-fluid">

        <!--------------------------
          | Your Page Content Here |
          -------------------------->
         
          <div class="row">
            <div class="col-md-12">
            
              <div class="box">
              <div class="box-header with-border">
                <form id="searchForm" action="/admin/product/pro_list" method="get">
                  <div class="form-group row">
                    <div class="col-md-6">
                      <select name="type">
                        <option value="" <c:out value="${pageMaker.cri.type == null? 'selected':'' }" />>-----</option>
                        <option value="N" <c:out value="${pageMaker.cri.type eq 'N'? 'selected':'' }" />>상품명</option>
                        <option value="P" <c:out value="${pageMaker.cri.type eq 'P'? 'selected':'' }" />>제조사</option>    
                      </select>
                      <input type="text" name="keyword" placeholder="검색어를 입력하세요." value='<c:out value="${pageMaker.cri.keyword }" />'>
                      <input type="hidden" name="pageNum" value="1">
                      <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                      <button type="submit"  class="btn btn-success">Search</button>
                    </div>
                    <div class="col-md-6">
                      <button type="button" class="btn btn-primary">선택상품수정</button>
                      <button type="button" class="btn btn-primary">선택상품삭제</button>
                    </div>
                  </div>
                </form>
              </div>
              <!-- /.box-header -->
              <div class="box-body">
                <table class="table table-bordered">
                  <tbody><tr>
                    <th style="width: 2%"><input type="checkbox" id="checkAll"></th>
                    <th style="width: 8%">코드</th>
                    <th style="width: 25%">상품명</th>
                    <th style="width: 10%">가격</th>
                    <th style="width: 20%">등록일</th>
                    <th style="width: 15%">판매여부</th>
                    <th style="width: 10%">수정</th>
                    <th style="width: 10%">삭제</th>
                  </tr>
                  <c:forEach items="${pro_list }" var="productVO">
                  <tr>
                    <td><input type="checkbox" name="check" value="${productVO.p_no }"></td>
                    <td>
                      <input type="hidden" name="categ_cd" value="${productVO.categ_cd }">
                      <c:out value="${productVO.p_no }"></c:out>
                    </td>
                    <td>
                      <!-- 역슬래시 \ 가 클라이언트 요청데이타로 사용 불가능.-->
                      <a class="move" href="${productVO.p_no }"><img src="/admin/product/displayImage?folderName=${productVO.p_up_folder }&fileName=s_${productVO.p_img}" /></a>
                      <a class="move" href="${productVO.p_no }"><c:out value="${productVO.p_name }" ></c:out></a>
                    </td>
                    <td>
                      <input type="text" name="p_px" style="width:100px" value="${productVO.p_px }">
                    </td>
                    <td><fmt:formatDate value="${productVO.modify_date }" pattern="yyyy-MM-dd HH:mm"/></td>
                    <td>
                      <select id="p_purchasable" name="p_purchasable">
                    <option value="Y" ${productVO.p_purchasable == 'Y' ? 'selected':''}>판매가능</option>
                    <option value="N" ${productVO.p_purchasable == 'N' ? 'selected':''}>판매불가능</option>
            </select>
                   </td>
                    <td><button type="button" name="btn_productEdit" data-p_no="${productVO.p_no }" class="btn btn-link">수정</button></td>
                    <td><button type="button" name="btn_productDel" data-p_no="${productVO.p_no }" class="btn btn-link">삭제</button></td>
                  </tr>
                  </c:forEach>
                  
                </tbody></table>
              </div>
              <!-- /.box-body -->
              <!-- [이전] 1 2 3 4 5 [다음] 출력작업 -->
              <div class="box-footer clearfix">
                <ul class="pagination pagination-sm no-margin pull-right">
                  <c:if test="${pageMaker.prev }">
                    <li><a href="${pageMaker.startPage - 1}">[prev]</a></li>
                  </c:if>
                  
                  <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
                    <li ${pageMaker.cri.pageNum == pageNum ? "class='active'": ""}><a href="${pageNum }">${pageNum }</a></li>
                  </c:forEach>
                  
                  
                  <c:if test="${pageMaker.next }">
                    <li><a href="${pageMaker.endPage + 1}">[next]</a></li>
                  </c:if>
                </ul>
                <!-- 페이징정보. Criteria 클래스 필드정보작업 -->
                <form id="actionForm" action="/admin/product/pro_list" method="get">
                  <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                  <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                  <input type="hidden" name="type" value="${pageMaker.cri.type}">
                  <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                </form>
              </div>
            </div>
            
            </div>
          
          </div>
  
      </section>
    </main>
  </div>
</div>

<!-- script -->
<%@include file="/WEB-INF/views/admin/include/script.jsp" %>

<script>
  $(document).ready(function() {
   
   let actionForm = $("#actionForm");

 
     $("a.move").on("click", function(e) {
       e.preventDefault();

       let p_no = $(this).attr("href");
       
       console.log("글번호: " + p_no);


       actionForm.find("input[name='p_no']").remove();

       actionForm.append("<input type='hidden' name='p_no' value='" + p_no + "'>");
       actionForm.attr("action", "/admin/product/get");

       actionForm.submit();

   });

     $("ul.pagination a").on("click", function(e) {
       e.preventDefault();

       actionForm.attr("action", "/admin/product/pro_list");
       actionForm.find("input[name='pageNum']").val($(this).attr("href"));

       actionForm.submit();
     });

 
     $("button[name='btn_productEdit']").on("click", function() {

       actionForm.append("<input type='hidden' name='p_no' value='" + $(this).data("p_no") + "'>");

       let categ_cd = $(this).parent().parent().find("input[name='categ_cd']").val();
       actionForm.append("<input type='hidden' name='categ_cd' value='" + categ_cd + "'>");
       
       actionForm.attr("method", "get");
       actionForm.attr("action", "/admin/product/pro_modify");
       actionForm.submit();
       
     });

     $("button[name='btn_productDel']").on("click", function() {

       if(!confirm("상품을 삭제하겠읍니까?")) return;

       actionForm.append("<input type='hidden' name='p_no' value='" + $(this).data("p_no") + "'>");

       actionForm.attr("method", "post");
       actionForm.attr("action", "/admin/product/pro_delete");
       actionForm.submit();
     });

     let isCheck = true;
     $("#checkAll").on("click", function() {

       $("input[name='check']").prop("checked", this.checked);
       isCheck = this.checked;
     });

     $("input[name='check']").on("click", function() {

       $("#checkAll").prop("checked", this.checked);

       $("input[name='check']").each(function() {
         if(!$(this).is(":checked")) {
           $("#checkAll").prop("checked", false);
         }
       });
     });

 });
</script>
  </body>
</html>

