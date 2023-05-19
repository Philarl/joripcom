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
<script>
  
  let msg = "${msg}";
  if(msg == 'pro_modify') {
    alert("상품이 수정되었습니다.");
  }else if(msg == 'pro_delete') {
    alert("상품이 삭제되었습니다.");
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
        <ul class="nav nav-tabs flex-column">
          <li class="nav-item">
            <a class="nav-link" href="#">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home" data-darkreader-inline-stroke="" style="--darkreader-inline-stroke: currentColor;"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
              Dashboard <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file" data-darkreader-inline-stroke="" style="--darkreader-inline-stroke: currentColor;"><path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path><polyline points="13 2 13 9 20 9"></polyline></svg>
              Orders
            </a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-shopping-cart" data-darkreader-inline-stroke="" style="--darkreader-inline-stroke: currentColor;"><circle cx="9" cy="21" r="1"></circle><circle cx="20" cy="21" r="1"></circle><path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path></svg>
              Products
            </a>
				    <div class="nav-item dropdown-menu">
				      <a class="nav-link dropdown-item" href="/admin/product/pro_insert">상품등록</a>
				      <a class="nav-link dropdown-item" href="/admin/product/pro_list">상품목록</a>
				    </div>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users" data-darkreader-inline-stroke="" style="--darkreader-inline-stroke: currentColor;"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
              Customers
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bar-chart-2" data-darkreader-inline-stroke="" style="--darkreader-inline-stroke: currentColor;"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>
              Reports
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-layers" data-darkreader-inline-stroke="" style="--darkreader-inline-stroke: currentColor;"><polygon points="12 2 2 7 12 12 22 7 12 2"></polygon><polyline points="2 17 12 22 22 17"></polyline><polyline points="2 12 12 17 22 12"></polyline></svg>
              Integrations
            </a>
          </li>
        </ul>

        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
          <span>Saved reports</span>
          <a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus-circle" data-darkreader-inline-stroke="" style="--darkreader-inline-stroke: currentColor;"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="8" x2="12" y2="16"></line><line x1="8" y1="12" x2="16" y2="12"></line></svg>
          </a>
        </h6>
        <ul class="nav flex-column mb-2">
          <li class="nav-item">
            <a class="nav-link" href="#">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text" data-darkreader-inline-stroke="" style="--darkreader-inline-stroke: currentColor;"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
              Current month
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text" data-darkreader-inline-stroke="" style="--darkreader-inline-stroke: currentColor;"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
              Last quarter
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text" data-darkreader-inline-stroke="" style="--darkreader-inline-stroke: currentColor;"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
              Social engagement
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text" data-darkreader-inline-stroke="" style="--darkreader-inline-stroke: currentColor;"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
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
                    <div class="col-md-9">
                      <select name="firstCategory" id="firstCategory">
                        <option value="" <c:out value="${category.firstCategory == null? 'selected':'' }" />>1차 카테고리 선택</option>
                        <c:forEach items="${categoryList }" var="categoryList">
                          <option value="${categoryList.categ_cd }" ${categoryList.categ_cd == category.firstCategory ? 'selected' : ''}>${categoryList.categ_name }</option>
                        </c:forEach>
                      </select>			    	
                      <select name="secondCategory" id="secondCategory">
                        <option value="">2차 카테고리 선택</option>
                        <c:forEach items="${subCategoryList }" var="subCategoryList">
                          <option value="${subCategoryList.categ_cd }" ${subCategoryList.categ_cd == category.secondCategory ? 'selected' : ''}>${subCategoryList.categ_name }</option>
                        </c:forEach>
                      </select>
                      <select name="type">
                        <option value="" <c:out value="${pageMaker.cri.type == null? 'selected':'' }" />>-----</option>
                        <option value="N" <c:out value="${pageMaker.cri.type eq 'N'? 'selected':'' }" />>상품명</option>
                        <option value="P" <c:out value="${pageMaker.cri.type eq 'P'? 'selected':'' }" />>제조사</option>    
                      </select>
                      <input type="text" name="keyword" placeholder="검색어를 입력하세요." value='<c:out value="${pageMaker.cri.keyword }" />'>
                      <input type="hidden" name="pageNum" value="1">
                      <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                      <button type="submit" class="btn btn-success">검색</button>
                    </div>
                    <div class="col-md-3">
                      <button type="button" id="btn_checkedModify" class="btn btn-primary">선택상품수정</button>
                      <button type="button" id="btn_checkedDelete" class="btn btn-primary">선택상품삭제</button>
                    </div>
                  </div>
                </form>
              </div>
              <!-- /.box-header -->
              <div class="box-body">
                <table class="table table-bordered" id="productList">
                  <tbody><tr>
                    <th style="width: 2%"><input type="checkbox" id="checkAll"></th>
                    <th style="width: 55%">상품명</th>
                    <th style="width: 7%">가격</th>
                    <th style="width: 8%">판매여부</th>
                    <th style="width: 12%">등록일</th>
                    <th style="width: 8%">수정</th>
                    <th style="width: 8%">삭제</th>
                  </tr>
                  <c:forEach items="${pro_list }" var="productVO">
                  <tr>
                    <td><input type="checkbox" name="check" value="${productVO.p_no }"></td>
                    <td>
                      <input type="hidden" name="categ_cd" value="${productVO.categ_cd }">
                      <input type="hidden" name="p_no" value="${productVO.p_no }">
                      <!-- 역슬래시 \ 가 클라이언트 요청데이타로 사용 불가능.-->
                      <img src="/admin/product/displayImage?folderName=${productVO.p_up_folder }&fileName=s_${productVO.p_img}" />
                      <c:out value="${productVO.p_name }" ></c:out>
                    </td>
                    <td>
                      <input type="text" name="p_px" style="width:100px" value="${productVO.p_px }">
                    </td>
                    <td>
                      <select id="p_purchasable" name="p_purchasable">
                        <option value="Y" ${productVO.p_purchasable == 'Y' ? 'selected':''}>판매가능</option>
                        <option value="N" ${productVO.p_purchasable == 'N' ? 'selected':''}>판매불가능</option>
                      </select>
                    </td>
                    <td><fmt:formatDate value="${productVO.modify_date }" pattern="yyyy-MM-dd HH:mm"/></td>
                    <td><button type="button" name="btn_productEdit" data-p_no="${productVO.p_no }" class="btn btn-link">수정</button></td>
                    <td><button type="button" name="btn_productDel" data-p_no="${productVO.p_no }" class="btn btn-link">삭제</button></td>
                  </tr>
                  </c:forEach>
                  
                </tbody></table>
              </div>
              <!-- /.box-body -->
              <!-- [이전] 1 2 3 4 5 [다음] 출력작업 -->
              <div class="box-footer clearfix row">
                <div class="col-md-11">
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
                <div class="col-md-1">
                  <button type="button" class="btn btn-primary" id="btn_productInsert">상품 등록</button>
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
   
   let actionForm = $("#actionForm");

 
  //    $("a.move").on("click", function(e) {
  //      e.preventDefault();

  //      let p_no = $(this).attr("href");
       
  //      console.log("글번호: " + p_no);


  //      actionForm.find("input[name='p_no']").remove();

  //      actionForm.append("<input type='hidden' name='p_no' value='" + p_no + "'>");
  //      actionForm.attr("action", "/admin/product/get");

  //      actionForm.submit();

  //  });

     $("ul.pagination a").on("click", function(e) {
       e.preventDefault();

       actionForm.attr("action", "/admin/product/pro_list");
       actionForm.find("input[name='pageNum']").val($(this).attr("href"));

       actionForm.submit();
     });

     $("#btn_productInsert").click(function() {
      location.href = "/admin/product/pro_insert";
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

       if(!confirm("상품을 삭제하겠습니까?")) return;

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

     $("#btn_checkedModify").on("click", function() {
      if($("input[name='check']:checked").length == 0) {
        alert("수정할 상품을 체크하세요.");
        return;
      }
      
      let p_no_arr = [];
      let p_px_arr = [];
      let p_purchasable_arr = [];

      $("input[name='check']:checked").each(function() {
        p_no_arr.push($(this).val());
        p_px_arr.push($(this).parent().parent().find("input[name='p_px']").val());
        p_purchasable_arr.push($(this).parent().parent().find("select[id='p_purchasable']").val());
      });

      $.ajax({
        url: '/admin/product/pro_checked_modify',
        type: 'post',
        data: {p_no_arr: p_no_arr, p_px_arr: p_px_arr, p_purchasable_arr: p_purchasable_arr},
        dataType: 'text',
        success: function(result) {
          if(result == "success") {
            alert("선택상품이 수정되었습니다.");

          actionForm.attr("method", "get");
          actionForm.attr("action", "/admin/product/pro_list");
          actionForm.submit();

        }
      }
    });
  });

  $("#btn_checkedDelete").on("click", function() {
    if($("input[name='check']:checked").length == 0) {
      alert("삭제할 상품을 체크하세요.");
      return;
    }
    
    let p_no_arr = [];

    $("input[name='check']:checked").each(function() {
      p_no_arr.push($(this).val());
    });

    $.ajax({
      url: '/admin/product/pro_checked_delete',
      type: 'post',
      data: {p_no_arr: p_no_arr},
      dataType: 'text',
      success: function(result) {
        if(result == "success") {
          alert("선택상품이 삭제되었습니다.");

        actionForm.attr("method", "get");
        actionForm.attr("action", "/admin/product/pro_list");
        actionForm.submit();

      }
    }
    });
  });

  $("#firstCategory").change(function() {

    let categ_cd = $(this).val();
    let url = "/admin/product/subCategory/" + categ_cd;

    $.getJSON(url, function(subCategoryData){

      let optionStr = "";
      let secondCategory = $("#secondCategory");

      secondCategory.find("option").remove();
      secondCategory.append("<option value=''>2차 카테고리 선택</option");

      for(let i=0; i<subCategoryData.length; i++) {
        optionStr += "<option value='" + subCategoryData[i].categ_cd + "'>" + subCategoryData[i].categ_name + "</option>";
                                                                                                                                                                    
      }

      secondCategory.append(optionStr);
    });
  });

 });
</script>
  </body>
</html>


