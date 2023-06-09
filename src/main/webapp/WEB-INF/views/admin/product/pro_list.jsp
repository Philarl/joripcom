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
                    <th style="width: 110px;">이미지</th>
                    <th style="width: auto">상품명</th>
                    <th style="width: 7%">가격</th>
                    <th style="width: 8%">판매여부</th>
                    <th style="width: 12%">등록일</th>
                    <th style="width: 8%">수정</th>
                    <th style="width: 8%">삭제</th>
                  </tr>
                  <c:forEach items="${pro_list }" var="productVO">
                  <tr>
                    <td class="align-middle"><input type="checkbox" name="check" value="${productVO.p_no }"></td>
                    <td class="align-middle">
                      <!-- 역슬래시 \ 가 클라이언트 요청데이타로 사용 불가능.-->
                      <img src="/admin/product/displayImage?folderName=${productVO.p_up_folder }&fileName=s_${productVO.p_img}" />
                    </td>
                    <td class="align-middle">
                      <input type="hidden" name="categ_cd" value="${productVO.categ_cd }">
                      <input type="hidden" name="p_no" value="${productVO.p_no }">
                      <c:out value="${productVO.p_name }" ></c:out>
                    </td>
                    <td class="align-middle">
                      <input type="text" name="p_px" style="width:100px" value="${productVO.p_px }">
                    </td>
                    <td class="align-middle">
                      <select id="p_purchasable" name="p_purchasable">
                        <option value="Y" ${productVO.p_purchasable == 'Y' ? 'selected':''}>판매가능</option>
                        <option value="N" ${productVO.p_purchasable == 'N' ? 'selected':''}>판매불가능</option>
                      </select>
                    </td>
                    <td class="align-middle"><fmt:formatDate value="${productVO.modify_date }" pattern="yyyy-MM-dd HH:mm"/></td>
                    <td class="align-middle"><button type="button" name="btn_productEdit" data-p_no="${productVO.p_no }" class="btn btn-link">수정</button></td>
                    <td class="align-middle"><button type="button" name="btn_productDel" data-p_no="${productVO.p_no }" class="btn btn-link">삭제</button></td>
                  </tr>
                  </c:forEach>
                  
                </tbody></table>
              </div>
              <!-- /.box-body -->
              <!-- [이전] 1 2 3 4 5 [다음] 출력작업 -->
              <div class="box-footer clearfix row">
                <div class="col-md-1">
                  <button type="button" class="btn btn-primary" id="btn_productInsert">상품 등록</button>
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

       actionForm.find("input[name='p_no']").remove();
       actionForm.find("input[name='categ_cd']").remove();

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


