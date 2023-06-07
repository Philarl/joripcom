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
                <form id="searchForm" action="/admin/order/order_list" method="get">
                  <div class="form-group row">
                    <div class="col-md-12">
                      주문일자 : <input type="date" name="sDate" value="${sDate}"> ~ <input type="date" name="eDate" value="${eDate}">
                      <select name="type">
                        <option value="" <c:out value="${pageMaker.cri.type == null? 'selected':'' }" />>-----</option>
                        <option value="O" <c:out value="${pageMaker.cri.type eq 'O'? 'selected':'' }" />>주문번호</option>
                        <option value="I" <c:out value="${pageMaker.cri.type eq 'I'? 'selected':'' }" />>주문자ID</option>
                        <option value="N" <c:out value="${pageMaker.cri.type eq 'N'? 'selected':'' }" />>수령인</option>
                      </select>
                      <input type="text" name="keyword" placeholder="검색어를 입력하세요." value='<c:out value="${pageMaker.cri.keyword }" />'>
                      <input type="hidden" name="pageNum" value="1">
                      <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                      <button type="submit" id="btn_order_search" class="btn btn-success">검색</button>
                    </div>
                  </div>
                </form>
              </div>
              <!-- /.box-header -->
              <div class="box-body">
                <table class="table table-bordered" id="productList">
                  <tbody><tr>
                    <th style="width: 2%;"><input type="checkbox" id="checkAll"></th>
                    <th style="width: 8%;">주문번호</th>
                    <th style="width: 20%;">주문일시</th>
                    <th style="width: 20%;">주문자/수령인</th>
                    <th style="width: 20%;">주문금액/배송비</th>
                    <th style="width: 15%;">결제방식</th>
                    <th colspan="2" style="width: 15%;">주문관리</th>
                  </tr>
                  <c:forEach items="${orderList }" var="orderVO">
                  <tr>
                    <td class="align-middle"><input type="checkbox" name="check" value="${orderVO.ord_no }"></td>
                    <td class="align-middle">${orderVO.ord_no }</td>
                    <td class="align-middle"><fmt:formatDate value="${orderVO.order_date }" pattern="yyyy-MM-dd HH:mm"/></td>
                    <td class="align-middle">${orderVO.u_id } / ${orderVO.ord_name }</td>
                    <td class="align-middle">${orderVO.ord_sum }</td>
                    <td class="align-middle">${orderVO.pay_method }</td>
                    <td class="align-middle">
                        <button type="button" name="btn_orderDetail" data-ord_no="${orderVO.ord_no }" class="btn btn-link" data-toggle="modal" data-target="#orderDetailModal">상세</button>
                        <button type="button" name="btn_orderDelete" data-ord_no="${orderVO.ord_no }" class="btn btn-link" data-toggle="modal" data-target="#orderDeleteModal">삭제</button>
                    </td>
                  </tr>
                  </c:forEach>
                  
                </tbody></table>
              </div>
              <!-- /.box-body -->
              <!-- [이전] 1 2 3 4 5 [다음] 출력작업 -->
              <div class="box-footer clearfix row">
                <div class="col-md-12">
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
                  <form id="actionForm" action="/admin/order/order_list" method="get">
                    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                    <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                    <input type="hidden" name="type" value="${pageMaker.cri.type}">
                    <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                    <input type="hidden" name="sDate" value="${sDate}">
                    <input type="hidden" name="eDate" value="${eDate}">
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

<!-- 1)Include Handlebars from a CDN -->
<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
<!-- 2)handlebars template. 댓글UI -->
<script id="orderDetailView" type="text/x-handlebars-template">
  <table class="table table-bordered"><tbody>
    <tr>
      <th style="width: 2%;"><input type="checkbox" id="checkAll"></th>
      <th style="width: 110px;">이미지</th>
      <th style="width: auto;">주문상품</th>
      <th style="width: 10%;">판매가</th>
      <th style="width: 10%;">수량</th>
      <th style="width: 10%;">주문금액</th>
      <th style="width: 10%;">상태</th>
      <th style="width: 10%;">배송료</th>
      <th style="width: 10%;">삭제</th>
    </tr>
    {{#each .}}
    <tr>
      <td class="align-middle" style="width: 2%">
        <input type="checkbox" name="check">
        <input type="hidden" name="ord_no" value="{{ord_no}}">
      </td>
      <td class="align-middle"><img src="{{imageview p_up_folder p_img}}"></td>
      <td class="align-middle">{{p_name}}</td>
      <td class="align-middle">{{od_px}}</td>
      <td class="align-middle">{{od_amt}}</td>
      <td class="align-middle">주문금액</td>
      <td class="align-middle">상태</td>
      <td class="align-middle">배송료</td>
      <td class="align-middle">
        <button type="button" name="btn_order_product_del" data-p_no="{{p_no}}" data-od_px="od_px" data-od_amt="od_amt" class="btn btn-link">Delete</button>
      </td>
    </tr>
    {{/each}}
  </tbody></table>
</script>

<script>
  Handlebars.registerHelper("imageview", function(folder, file) {

    let url = "/admin/order/displayImage?folderName=" + folder.replace(/\\/g, "/") + "&fileName=s_" + file;

    return url;
  });
</script>

<script>
  $(document).ready(function() {
   
    let searchForm = $("#searchForm")
    let actionForm = $("#actionForm");

   $("button[name='btn_orderDetail']").on("click", function() {

    let ord_no = $(this).data("ord_no");

    let url = "/admin/order/order_detail?ord_no=" + ord_no;

    // ajax 요청에서 주문상세정보 json형태로 받는 작업
    $.getJSON(url, function(data) {

      let templateObj = Handlebars.compile($("#orderDetailView").html());
      let orderDetailVwHtml = templateObj(data); // 테이블과 댓글데이터가 바인딩된 결과

      $("#modalDetailView").empty();
      $("#modalDetailView").append(orderDetailVwHtml);

    });
  });

  // 주문 상세 내역에서 삭제 클릭
  // TODO : 주문상세 상품 삭제 작업
  $("div#modalDetailView").on("click", "button[name='btn_order_product_del']", function() {

    if(!confirm("주문상세 상품을 삭제하시겠습니까?")) return;
    let od_px = 0;
    let od_amt = 0;

    let cur_row = $(this).parent().parent();

    let p_no = $(this).data("p_no");
    let ord_no = $(this).parent().parent().find("input[name='ord_no']").val();
    od_px = parseInt((this).data("od_px"));
    od_amt = parseInt($(this).data("od_amt"));

    // console.log("상품번호: " + p_no);
    // console.log("주문번호: " + ord_no);

    $.ajax({
      url: '/admin/order/order_detail_product_delete',
      type: 'post',
      data: {ord_no : ord_no, p_no : p_no, od_px : od_px, od_amt : od_amt},
      dataType: 'text',
      success: function() {
        if(result == 'success') {
          alert("주문상품이 삭제되었습니다.");
          cur_row.remove();
        }
      }
    });
  });

  $("#btn_order_search").on("click", function() {
      searchForm.attr("action", "/admin/order/order_list");
      searchForm.find("input[name='pageNum']").val(1);
      searchForm.submit();
    });
  
  $("ul.pagination a").on("click", function(e) {
    e.preventDefault();

    actionForm.attr("action", "/admin/order/order_list");
    actionForm.find("input[name='pageNum']").val($(this).attr("href"));

    actionForm.find("input[name='sDate']").remove();
    actionForm.find("input[name='eDate']").remove();
    actionForm.append("<input type='hidden' name='sDate' value='${sDate}'>");
    actionForm.append("<input type='hidden' name='eDate' value='${eDate}'>");
    actionForm.submit();
  });

  $("button[name='btn_orderDelete']").on("click", function() {

    if(!confirm("주문내역을 삭제하시겠습니까?")) return;

actionForm.append("<input type='hidden' name='ord_no' value='" + $(this).data("ord_no") + "'>");

    actionForm.attr("method", "post");
    actionForm.attr("action", "/admin/order/order_delete");
    actionForm.submit();
  });

 });
</script>

<!-- Modal -->
<div class="modal fade" id="orderDetailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="modalDetailView">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

  </body>
</html>


