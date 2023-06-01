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
<%@include file="/WEB-INF/views/admin/include/navbar.jsp" %>

    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
      <section class="content container-fluid">
        <!--------------------------
          | Your Page Content Here |
          -------------------------->
         
          <div class="row">
            <div class="col-md-12">
              <div class="box">
              <div class="box-header with-border">
                <form id="searchForm" action="/admin/product/order_list" method="get">
                  <div class="form-group row">
                    <div class="col-md-9">
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
                    <th style="width: 2%;"><input type="checkbox" id="checkAll"></th>
                    <th style="width: 8%;">주문번호</th>
                    <th style="width: 25%;">주문일시</th>
                    <th style="width: 15%;">주문자/수령인</th>
                    <th style="width: 25%;">주문금액/배송비</th>
                    <th style="width: 15%;">결제방식</th>
                    <th style="width: 10%;">주문관리</th>
                  </tr>
                  <c:forEach items="${orderList }" var="orderVO">
                  <tr>
                    <td><input type="checkbox" name="check" value="${orderVO.ord_no }"></td>
                    <td>${orderVO.ord_no }</td>
                    <td><fmt:formatDate value="${orderVO.order_date }" pattern="yyyy-MM-dd HH:mm"/></td>
                    <td>${orderVO.u_id } / ${orderVO.ord_name }</td>
                    <td>${orderVO.ord_sum }</td>
                    <td>${orderVO.pay_method }</td>
                    <td><button type="button" name="btn_orderDetail" data-ord_no="${orderVO.ord_no }" class="btn btn-link" data-toggle="modal" data-target="#orderDetailModal">상세</button></td>
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
                  <form id="actionForm" action="/admin/product/order_list" method="get">
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

<!-- 1)Include Handlebars from a CDN -->
<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
<!-- 2)handlebars template. 댓글UI -->
<script id="orderDetailView" type="text/x-handlebars-template">
  <table class="table table-bordered"><tbody>
    <tr>
      <th style="width: 2%"><input type="checkbox" id="checkAll"></th>
      <th style="width: 8%">주문상품</th>
      <th style="width: 25%">판매가</th>
      <th style="width: 10%">수량</th>
      <th style="width: 20%">주문금액</th>
      <th style="width: 15%">상태</th>
      <th style="width: 10%">배송료</th>
      <th style="width: 10%">비고</th>
    </tr>
    {{#each .}}
    <tr>
      <td style="width: 2%"><input type="checkbox"></td>
      <td style="width: 8%"><img src="{{imageview p_up_folder p_img}}">{{p_name}}</td>
      <td style="width: 25%">{{od_sum}}</td>
      <td style="width: 10%">{{od_amt}}</td>
      <td style="width: 20%">주문금액</td>
      <td style="width: 15%">상태</td>
      <td style="width: 10%">배송료</td>
      <td style="width: 10%">비고</td>
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

 });
</script>

<!-- Modal -->
<div class="modal fade" id="orderDetailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
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


