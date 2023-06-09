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
    <!-- sidebarMenu -->
<%@include file="/WEB-INF/views/admin/include/sidebarMenu.jsp" %>

    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
      <section class="content container-fluid">

        <!--------------------------
          | Your Page Content Here |
          -------------------------->
         
         <div class="row">
         <div class="col-md-12">
           <div class="box box-primary">
             <form id="productForm" action="/admin/product/pro_modify" method="post" enctype="multipart/form-data">
              <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">상품 수정</h1>
              </div>
             <div class="box-body">	
              <div class="form-group row">
                <label for="firstCategory" class="col-sm-2 col-form-label">카테고리</label>
                <div class="col-sm-3">
                  <input type="hidden" name="pageNum" value="${cri.pageNum }">
                  <input type="hidden" name="amount" value="${cri.amount }">
                  <input type="hidden" name="type" value="${cri.type }">
                  <input type="hidden" name="keyword" value="${cri.keyword }">
                  <select name="par_categ_cd" id="firstCategory" class="form-control">
                    <option value="">1차카테고리 선택</option>
                    <c:forEach items="${categoryList }" var="category">
                      <option value="${category.categ_cd }" ${category.categ_cd == categoryVO.categ_cd ? 'selected' : ''}>${category.categ_name }</option>
                    </c:forEach>
                   </select>
                </div>
              <div class="col-sm-3">					    	
                  <select name="categ_cd" id="secondCategory" class="form-control">
                    <option>2차카테고리 선택</option>
                    <c:forEach items="${subCategoryList }" var="subCategory">
                      <option value="${subCategory.categ_cd }" ${subCategory.categ_cd == productVO.categ_cd ? 'selected' : ''}>${subCategory.categ_name }</option>
                    </c:forEach>
                  </select>
                </div>
              </div>
              <div class="form-group row">
                <label for="p_name" class="col-sm-2 col-form-label">상품명</label>
                <div class="col-sm-4">
                  <input type="hidden" id="p_no" name="p_no" value="<c:out value='${productVO.p_no }' />">
                  <input type="text" class="form-control" id="p_name" name="p_name" value="<c:out value='${productVO.p_name }' />">
                </div>
                <label for="p_px" class="col-sm-2 col-form-label">상품가격</label>
                <div class="col-sm-4">
                  <input type="text" class="form-control" id="p_px" name="p_px" value="<c:out value='${productVO.p_px }' />">
                </div>
              </div>
              <div class="form-group row">
                <label for="p_dc" class="col-sm-2 col-form-label">할인율</label>
                <div class="col-sm-4">
                  <input type="text" class="form-control" id="p_dc" name="p_dc" value="<c:out value='${productVO.p_dc }' />">
                </div>
                <label for="p_mfr" class="col-sm-2 col-form-label">제조사</label>
                <div class="col-sm-4">
                  <input type="text" class="form-control" id="p_mfr" name="p_mfr" value="<c:out value='${productVO.p_mfr }' />">
                </div>
              </div>
              <div class="form-group row">
                <label for="p_img" class="col-sm-2 col-form-label">상품이미지</label>
                <div class="col-sm-2"> <!-- name="p_img" 존재안함.  스프링에서는 Null 이 됨.-->
                  <input type="hidden" id="p_up_folder" name="p_up_folder" value="<c:out value='${productVO.p_up_folder }' />">
                  <input type="hidden" id="p_img" name="p_img" value="<c:out value='${productVO.p_img }' />">
                  <input type="file" class="form-control" id="uploadFile" name="uploadFile">
                </div>
                <label for="p_img" class="col-sm-2 col-form-label">현재 / 변경 이미지</label>
                <div class="col-sm-3">
                  <img id="curr_img" style="width: 200px;height: 200px;" src="/admin/product/displayImage?folderName=${productVO.p_up_folder }&fileName=s_${productVO.p_img }">
                </div>
                <div class="col-sm-3">
                  <img id="change_img" style="width: 200px;height: 200px;">
                </div>
              </div>
              <div class="form-group row">
                <label for="p_dtl" class="col-sm-2 col-form-label">상품설명</label>
                <div class="col-sm-10">
                  <textarea class="form-control" id="p_dtl" name="p_dtl" rows="3"> <c:out value='${productVO.p_dtl }' /></textarea>
                </div>
              </div>
              <div class="form-group row">
                <label for="p_amt" class="col-sm-2 col-form-label">수량</label>
                <div class="col-sm-4">
                  <input type="hidden" id="check_amt" value="<c:out value='${productVO.p_amt }' />">
                  <input type="text" class="form-control" id="p_amt" name="p_amt" value="<c:out value='${productVO.p_amt }' />">
                </div>
                <label for="p_purchasable" class="col-sm-2 col-form-label">판매여부</label>
                <div class="col-sm-4">
                  <select id="p_purchasable" name="p_purchasable">

                    <option value="Y" ${productVO.p_purchasable == 'Y' ? 'selected' : ''}>판매중</option>
                    <option value="N" ${productVO.p_purchasable == 'N' ? 'selected' : ''}>품절</option>
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
                  <button type="submit" class="btn btn-dark" id="btn_productInsert">상품수정</button>
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

    $("#btn_productInsert").click(function() {

      if($("#p_amt").val() == 0) {
        $("#p_purchasable").children().remove();
        $("#p_purchasable").append("<option value='N' ${productVO.p_purchasable == 'N' ? 'selected' : ''}>품절</option>");
      }

      if(($("#p_amt").val() > 0) && ($("#check_amt").val() == 0)) {
        $("#p_purchasable").children().remove();
        $("#p_purchasable").append("<option value='Y' ${productVO.p_purchasable == 'Y' ? 'selected' : ''}>판매중</option>");
      }
    });

  });
</script>
  </body>
</html>

