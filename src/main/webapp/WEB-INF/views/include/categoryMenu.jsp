<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="row text-center">
  <div class="col-md-12">
    <div class="box">
    <div class="box-header with-border">
      <form id="searchForm" action="/product/pro_search" method="get">
        <div class="form-group row">
          <div class="col-md-12">
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
            <input style="width: 12.5%;" type="number" name="px_min" placeholder="최소 금액(원)">
            <input style="width: 12.5%;" type="number" name="px_max" placeholder="최대 금액(원)">
            <select name="type">
              <option value="" <c:out value="${pageMaker.cri.type == null? 'selected':'' }" />>-----</option>
              <option value="N" <c:out value="${pageMaker.cri.type eq 'N'? 'selected':'' }" />>상품명</option>
              <option value="P" <c:out value="${pageMaker.cri.type eq 'P'? 'selected':'' }" />>제조사</option>    
            </select>
            <input type="text" name="keyword" placeholder="검색어를 입력하세요." value='<c:out value="${pageMaker.cri.keyword }" />'>
            <input type="hidden" name="pageNum" value="1">
            <input type="hidden" name="amount" value="10">
            <button type="submit" class="btn btn-success">검색</button>
          </div>
        </div>
      </form>
    </div>
    </div>
  </div>
</div>

<div class="row justify-content-center">
  <div class="col-md-12">
    <div id="categoryMenu" class="justify-content-between">
      <ul class="nav justify-content-center" id="mainCategory">
        <c:forEach items="${cateList }" var="categoryVO">
          <li class="nav-item">
          <a class="nav-link" href="${categoryVO.categ_cd }"><c:out value="${categoryVO.categ_name }" /></a>
          </li>
        </c:forEach>
      </ul>
    </div>
  </div>
</div>
<script>

  // 1차 카테고리 마우스오버
  $("ul.nav li.nav-item a").on("mouseover", function(e) {
    e.preventDefault();
    // console.log("1차카테고리 선택");
    let selectedCategory = $(this);
    let categ_cd = $(this).attr("href");
    // let categ_name = "<b>" + $(this).html() + "</b>";
    let url = "/product/subCategory/" + categ_cd;

    $.getJSON(url, function(subCategory) {

      selectedCategory.parent();

      // console.log(subCategory);

      let subCategoryStr = '<ul class="nav justify-content-center" id="subCategory">';
      for(let i=0; i<subCategory.length; i++) {
        subCategoryStr += '<li class="nav-item">';
        subCategoryStr += '<a class="nav-link" href="' + subCategory[i].categ_cd + '">' + subCategory[i].categ_name + '</a>';
        subCategoryStr += '</li>';
      }
      subCategoryStr += '</ul>';

      // console.log(subCategoryStr);
      selectedCategory.parent().parent().next().remove();
      selectedCategory.parent().parent().after(subCategoryStr);
    });

    // 2차 카테고리 선택
    $("div#categoryMenu").on("click", "ul#subCategory li.nav-item a", function(e) {
      e.preventDefault();

      // console.log("2차 카테고리 선택");

      let url = "/product/pro_list/" + $(this).attr("href") + "/" + $(this).html();
      location.href = url;
    });

  });

$("#firstCategory").change(function() {

  console.log("카테고리 변경");

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
</script>