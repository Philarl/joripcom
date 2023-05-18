<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
           <div class="box box-primary">
             <form id="productForm" action="/admin/product/pro_insert" method="post" enctype="multipart/form-data">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
              <h1 class="h2">상품 등록</h1>
            </div>
             <div class="box-body">	
              <div class="form-group row">
                <label for="firstCategory" class="col-sm-2 col-form-label">카테고리</label>
                <div class="col-sm-3">
                  <select name="par_categ_cd" id="firstCategory" class="form-control">
                    <option value="">1차 카테고리 선택</option>
                    <c:forEach items="${categoryList }" var="category">
                      <option value="${category.categ_cd }">${category.categ_name }</option>
                    </c:forEach>
                   </select>
                </div>
              <div class="col-sm-3">					    	
                  <select name="categ_cd" id="secondCategory" class="form-control">
                    <option>2차 카테고리 선택</option>
                  </select>
                </div>
              </div>
              <div class="form-group row">
                <label for="p_name" class="col-sm-2 col-form-label">상품명</label>
                <div class="col-sm-4">
                  <input type="text" class="form-control" id="p_name" name="p_name">
                </div>
                <label for="p_px" class="col-sm-2 col-form-label">상품가격</label>
                <div class="col-sm-4">
                  <input type="text" class="form-control" id="p_px" name="p_px">
                </div>
              </div>
              <div class="form-group row">
                <label for="p_dc" class="col-sm-2 col-form-label">할인율</label>
                <div class="col-sm-4">
                  <input type="text" class="form-control" id="p_dc" name="p_dc">
                </div>
                <label for="p_mfr" class="col-sm-2 col-form-label">제조사</label>
                <div class="col-sm-4">
                  <input type="text" class="form-control" id="p_mfr" name="p_mfr">
                </div>
              </div>
              <div class="form-group row">
                <label for="p_img" class="col-sm-2 col-form-label">상품이미지</label>
                <div class="col-sm-4"> <!-- name="p_img" 존재안함.  스프링에서는 Null 이 됨.-->
                  <input type="file" class="form-control" id="uploadFile" name="uploadFile">
                </div>
                <label for="p_img" class="col-sm-2 col-form-label">미리보기 이미지</label>
                <div class="col-sm-4">
                  <img id="change_img" style="width: 200px;height: 200px;">
                </div>
              </div>
              <div class="form-group row">
                <label for="p_dtl" class="col-sm-2 col-form-label">상품설명</label>
                <div class="col-sm-10">
                  <textarea class="form-control" id="p_dtl" name="p_dtl" rows="3"></textarea>
                </div>
              </div>
              <div class="form-group row">
                <label for="p_amt" class="col-sm-2 col-form-label">수량</label>
                <div class="col-sm-4">
                  <input type="text" class="form-control" id="p_amt" name="p_amt">
                </div>
                <label for="p_purchasable" class="col-sm-2 col-form-label">판매여부</label>
                <div class="col-sm-4">
                  <select id="p_purchasable" name="p_purchasable">
                    <option value="Y">판매가능</option>
                    <option value="N">판매불가능</option>
                  </select>
                </div>
              </div>	  
           
             </div>
             <div class="box-footer">
               <div class="form-group">
                 <ul class="uploadedList"></ul>
               </div>    				
               <div class="form-group row">
                <div class="col-sm-12 text-center">
                  <button type="submit" class="btn btn-dark" id="btn_productInsert">상품등록</button>
                </div>			
            </div>
             </div>
             </form>
           </div>
         </div>
       </div>
  
      </section>
    </main>
  </div>
</div>

<script>
  $(document).ready(function() {
    // ckeditor 버전: 4.12.1 (Standard)환경설정. javascript object구문사용
    let ckeditor_config = {
      resize_enabled : false,
      enterMode : CKEDITOR.ENTER_BR,
      shiftEnterMode : CKEDITOR.ENTER_P,
      toolbarCanCollapse : true,
      removePlugins : "elementspath",
      filebrowserUploadUrl : '/admin/product/imageUpload' // 업로드 탭 표시
    }

    CKEDITOR.replace("p_dtl", ckeditor_config);

    console.log("버전: " + CKEDITOR.version);

    $("#firstCategory").change(function() {

      let categ_cd = $(this).val();

      let url = "/admin/product/subCategory/" + categ_cd + ".json";

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

    $("#uploadFile").on("change", function(e) {
      let file = e.target.files[0];  // 선택한 파일들중 첫번째 파일

      let reader = new FileReader(); // 첨부된 파일을 읽기위한 파일입력객체.

      // reader객체가 파일을 로딩했을 때.
      reader.onload = function(e) {
        $("#change_img").attr("src", e.target.result);
      }

      reader.readAsDataURL(file); // reader객체에 파일객체를 할당
    });

  });
</script>
  </body>
</html>

