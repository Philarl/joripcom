<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="categoryMenu" class="justify-content-between">
  <ul class="nav justify-content-center" id="mainCategory">
    <c:forEach items="${cateList }" var="categoryVO">
      <li class="nav-item">
      <a class="nav-link" href="${categoryVO.categ_cd }"><c:out value="${categoryVO.categ_name }" /></a>
      </li>
    </c:forEach>
  </ul>
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

</script>