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
    <title>Album example · Bootstrap v4.6</title>

<link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/album/">

    <!-- Bootstrap core CSS -->
<link href="https://getbootstrap.com/docs/4.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">


    <!-- Favicons -->
<link rel="apple-touch-icon" href="https://getbootstrap.com/docs/4.6/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="https://getbootstrap.com/docs/4.6/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="https://getbootstrap.com/docs/4.6/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="https://getbootstrap.com/docs/4.6/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="https://getbootstrap.com/docs/4.6/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c">
<link rel="icon" href="https://getbootstrap.com/docs/4.6/assets/img/favicons/favicon.ico">
<meta name="msapplication-config" content="https://getbootstrap.com/docs/4.6/assets/img/favicons/browserconfig.xml">
<meta name="theme-color" content="#563d7c">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="https://getbootstrap.com/docs/4.6/examples/album/album.css" rel="stylesheet">
  </head>
  <body>
    
<header>
	<!-- navbarHeader -->
	<%@include file="/WEB-INF/views/include/navbarHeader.jsp" %>
	<!-- navbar -->
	<%@include file="/WEB-INF/views/include/navbar.jsp" %>
</header>

<main role="main">

    <div class="container">
	    <div class="row justify-content-center">
	    <!-- categoryMenu -->
<%@include file="/WEB-INF/views/include/categoryMenu.jsp" %>
			</div>
    </div>

<div class="album py-5 bg-light">
  <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
	  <h4 class="display-4"><c:out value="${categ_name }" /></h4>
	</div>
<div class="container">
	<div class="row">
  	<div class="col-md-6">
  		<img style="width:400px; height:400px" src="/product/displayImage?folderName=${productVO.p_up_folder }&fileName=${productVO.p_img }">
  	</div>
  	<div class="col-md-6">
  		<p class="my-0 font-weight-normal">상품명 : ${productVO.p_name }</p>
  		<p>가격: <fmt:formatNumber type="currency" pattern="￦#,###" value="${productVO.p_px }"/></p>
  		<p>제조사: ${productVO.p_mfr }</p>
  		<p>수량 : <input type="text" id="cart_amt" value="1" style="width: 50px;"></p>
		<button type="button" name="btn_fav" class="btn btn-link" data-p_no="${productVO.p_no }">찜하기</button>
		<button type="button" name="btn_cart" class="btn btn-link" data-p_no="${productVO.p_no }">장바구니</button>
		<button type="button" name="btn_direct_order" class="btn btn-link">바로구매</button>
  	</div>
	</div>
		<ul class="nav nav-tabs text-center" id="productDetailTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="detail-tab" data-toggle="tab" data-target="#detail" type="button" role="tab" aria-controls="detail" aria-selected="true">상세정보</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="rev-tab" data-toggle="tab" data-target="#rev" type="button" role="tab" aria-controls="rev" aria-selected="false">상품후기</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="qna-tab" data-toggle="tab" data-target="#qna" type="button" role="tab" aria-controls="qna" aria-selected="false">Q&A</button>
			</li>
		</ul>
		<div class="tab-content" id="productDetailTabContent">
		  <div class="tab-pane fade show active" id="detail" role="tabpanel" aria-labelledby="detail-tab">
		  	${productVO.p_dtl }
		  </div>
		  <div class="tab-pane fade" id="rev" role="tabpanel" aria-labelledby="rev-tab">
		  	<div id="pro_review">
					<!--상품후기목록 및 페이징작업-->
					<!--상품후기쓰기 폼-->
					<div class="row">
						<div class="col-md-12">
							<!-- <form role="form"> -->
								<div class="box-body">
									<label for="exampleInputEmail1">댓글</label>
									<div class="form-group row">
										<div class="col-md-8">
											<input type="text" class="form-control" id="reply" placeholder="상품후기를 작성하세요...">
											<p id="star_rv_score">
												<a class="rv_score" href="#">☆</a>
												<a class="rv_score" href="#">☆</a>
												<a class="rv_score" href="#">☆</a>
												<a class="rv_score" href="#">☆</a>
												<a class="rv_score" href="#">☆</a>
											</p>
											<input type="hidden" class="form-control" id="replyer" value="${u_id}">
										</div>
										<div class="col-md-4">
											<button type="button" id="btn_replyWrite" class="btn btn-primary">등록</button>
										</div>
									</div>
								</div>
							<!-- </form> -->
						</div>
					</div>
		
					<!-- 댓글 목록 및 페이징 작업 -->
					<div id="replyList"></div>
					<div id="replyPaging"></div>
				</div>
		  </div>
		  <div class="tab-pane fade" id="qna" role="tabpanel" aria-labelledby="qna-tab">
				Q&A<br>
				${productVO.p_dtl }
		  </div>
		</div>
  <%@include file="/WEB-INF/views/include/footer.jsp" %>
  
</div>
  </div>

</main>

<!-- footer -->
<%@include file="/WEB-INF/views/include/footer.jsp" %>

<!-- config -->
<%@include file="/WEB-INF/views/include/config.jsp" %>

<!-- 1)Include Handlebars from a CDN -->
<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
<!-- 2)handlebars template. 댓글UI -->
<script id="replyViewTemplate" type="text/x-handlebars-template">
  <table class="table">
    {{#each .}}
    <tr>
      <td>{{rev_no}}</td>
      <td>{{displayStar rev_star}}</td>
      <td>{{rev_content}}</td>
      <td>{{u_id}}</td>
      <td>{{convertDate rev_regdate}}</td>
      <td>
        <button type="button" data-rev_no="{{rev_no}}" name="btn_re_edit" class="btn btn-link">Edit</button>
        <button type="button" data-rev_no="{{rev_no}}" name="btn_re_delete" class="btn btn-link">Delete</button>
      </td>
    </tr>
    {{/each}}
  </table>
</script>

<!-- Handlebar의 사용자 정의 Helper. milisecond를 자바스크립트의 Date 객체작업. -->
<script>
  // 날짜데이터가 json으로 변환되어 milisecond 단위를 다시 날짜로 변환작업
  Handlebars.registerHelper("convertDate", function(timeValue) {
    const date = new Date(timeValue);

    return date.getFullYear() + "/" + (date.getMonth() + 1) + "/" + date.getDate();
  })

  // 평점을 별로 표시하는 함수
  Handlebars.registerHelper("displayStar", function(rating) {
    let starStr = "";
    switch(rating) {
      case 1:
        starStr = "★☆☆☆☆";
        break;
      case 2:
        starStr = "★★☆☆☆";
        break;
      case 3:
        starStr = "★★★☆☆";
        break;
      case 4:
        starStr = "★★★★☆";
        break;
      case 5:
        starStr = "★★★★★";
        break;
    }

    return starStr;
  })
</script>
  
  </body>
<script>
$(document).ready(function() {


	$("button[name='btn_cart']").on("click", function() {

		let p_no = $(this).data("p_no");
		let cart_amt = $("#cart_amt").val();

		$.ajax({
			url: '/cart/cart_add',
			type: 'post',
			data: {p_no : p_no, cart_amt : cart_amt},
			success : function(result) {

				// console.log("상품 번호 : " + p_no);

				alert("장바구니에 추가되었습니다.")
				if(confirm("장바구니로 이동하겠습니까?")) {
					location.href="/cart/cart_list";
				}
			}

		});
	});

	$("button[name='btn_fav']").on("click", function() {

		let p_no = $(this).data("p_no");

		$.ajax({
			url: '/fav/fav_add',
			type: 'post',
			data: {p_no : p_no},
			success : function(result) {

				// console.log("상품 번호 : " + p_no);

				alert("찜 목록에 추가되었습니다.")
				
			}

		});

		$('#productDetailTab button').on('click', function (event) {
		event.preventDefault()
		$(this).tab('show')
		});
	});
});
</script>

<script>

  $(document).ready(function() {

    let actionForm = $("#actionForm"); // 페이징 정보가 있는 form태그
    
    //장바구니 클릭
    $("button[name=btn_cart]").on("click", function() {
		
      $.ajax({
        url:'/cart/cart_add',
        type: 'post',
        data: {p_no : $(this).data("p_no"), cart_amount : $("#pro_amount").val()},
        success : function(result) {
          alert("장바구니에 추가되었습니다.");
          if(confirm("장바구니로 이동하겠습니까?")) {
            location.href = "/cart/cart_list";
          }
        }

      });
		});
  });

</script>

<script>

  $(document).ready(function() {

    //댓글페이지 번호 클릭시
    /*
    동적으로 추가된 태그로 인하여 click 이벤트 설정 안됨
    $("#replyPaging li a").on("click", function(e) {
      e.preventDefault(); // 링크기능 취소
      console.log("댓글 페이지번호 클릭");
    });
    */

    // 동적으로 추가된 태그를 click 이벤트 설정시 하는 방법
    $("#replyPaging").on("click", "li a", function(e) {
      e.preventDefault(); // 링크기능 취소
      // console.log("댓글 페이지번호 클릭");

      reviewPage = $(this).attr("href");
      url = "/review/list/" + p_no + "/" + reviewPage + ".json";
      getPage(url);
    });

    // 댓글쓰기
    $("#btn_replyWrite").on("click", function() {
    let reply = $("#reply").val(); // 댓글내용
    let replyer = $("#replyer").val(); // 댓글작성자

    // {"p_no" : 255, "replyer" : "나그네", "reply" : "255번 댓글 내용"}
    let replyData = JSON.stringify({p_no : ${productVO.p_no}, replyer : replyer, reply : reply});

    // console.log(replyData);

      $.ajax({
        type: 'post',
        url: '/replies/new', // 매핑주소의 컨트롤러 클래스가 @RestController이므로, 전송데이터를 JSON 형식으로 사용함.
        headers: {
          "Content-Type" : "application/json", "X-HTTP-Method-Override" : "POST"
        },
        dataType: 'text', // 스프링 메소드의 리턴타입
        data: replyData, // 서버로 보내는 JSON 데이터.
        success: function(result) {
          if(result == "success") {
            $("#reply").val("");
            $("#replyer").val("");

            reviewPage = 1;
            url = "/review/list/" + p_no + "/" + reviewPage + ".json";

            getPage(url);
          }
          
        }
      });
    });

    // name="btn_re_edit"
    // 댓글 수정폼
    $("div#replyList").on("click", "button[name='btn_re_edit']", function() {
      console.log("댓글수정");
      let cur_tr = $(this).parent().parent();
      let rno = cur_tr.children().eq(0).text();
      let reply = cur_tr.children().eq(1).text();
      let replyer = cur_tr.children().eq(2).text();
      let regdate = cur_tr.children().eq(3).text();

      console.log("rno:" + rno);
      console.log("reply:" + reply);
      console.log("replyer:" + replyer);

      // Edit버튼이 선택된 tr의 td를 모두 삭제한다.
      cur_tr.empty();

      let rno_str = "<td><input type='text' id='edit_rno' value='" + rno + "' readonly></td>";
      let reply_str = "<td><input type='text' id='edit_reply' value='" + reply + "'></td>";
      let replyer_str = "<td><input type='text' id='edit_replyer' value='" + replyer + "' readonly></td>";
      let regdate_str = "<td><input type='text' id='edit_regdate' value='" + regdate + "' readonly></td>";

      let btn_str = "<td><button type='button' id='btn_re_cancel' class='btn btn-link'>취소</button>";
      btn_str += "<button type='button' id='btn_re_register' class='btn btn-link'>등록</button></td>";

      cur_tr.append(rno_str, reply_str, replyer_str, regdate_str, btn_str);

    });

    //댓글 수정하기
    $("div#replyList").on("click", "#btn_re_register", function() {
      let edit_rno = $("#edit_rno").val();
      let edit_reply = $("#edit_reply").val();
      let edit_replyer = $("#edit_replyer").val();
      let edit_regdate = $("#edit_regdate").val();

      let replyData = JSON.stringify({rno : edit_rno, replyer : edit_replyer, reply : edit_reply});
      console.log("JSON데이터: " + replyData)

      $.ajax({
        type: 'put',
        url: '/replies/modify/',
        headers: {
          "Content-Type" : "application/json", "X-HTTP-Method-Override" : "PUT"
        },
        dataType: 'text',
        data: replyData,
        success: function(result) {
          if(result == "success") {
            alert("댓글 수정 성공");

            url = "/review/list/" + p_no + "/" + reviewPage + ".json";

            getPage(url);
          }
        }

      });
    });

    // 댓글수정 취소하기
    $("div#replyList").on("click", "#btn_re_cancel", function() {
      let cur_tr = $(this).parent().parent();
      let rno = cur_tr.find("#edit_rno").val();
      let reply = cur_tr.find("#edit_reply").val();
      let replyer = cur_tr.find("#edit_replyer").val();
      let regdate = cur_tr.find("#edit_regdate").val();

      let rno_str = "<td>" + rno + "</td>";
      let reply_str = "<td>" + reply + "</td>";
      let replyer_str = "<td>" + replyer + "</td>";
      let regdate_str = "<td>" + regdate + "</td>";
      /*
      <td>
        <button type="button" data-rno="{{rno}}" name="btn_re_edit" class="btn btn-link">Edit</button>
        <button type="button" data-rno="{{rno}}" name="btn_re_delete" class="btn btn-link">Delete</button>
      </td>
      */
      let btn_str = "<td><button type='button' data-rno=" + rno + " name='btn_re_edit' class='btn btn-link'>Edit</button>"
      btn_str += "<button type='button' data-rno=" + rno + " name='btn_re_delete' class='btn btn-link'>Delete</button></td>"
      
      cur_tr.empty();
      cur_tr.append(rno_str, reply_str, replyer_str, regdate_str, btn_str);

      /*
      url = "/replies/pages/" + p_no + "/" + reviewPage + ".json";

      getPage(url);
      */

    })

    // 댓글 삭제하기
    $("div#replyList").on("click", "button[name='btn_re_delete']", function() {
      console.log("댓글삭제");

      if(!confirm("댓글 삭제를 하시겠습니까?")) return;

      $.ajax({
        type: 'delete',
        url: '/replies/delete/' + $(this).data("rno"),
        headers: {
          "Content-Type" : "application/json", "X-HTTP-Method-Override" : "DELETE"
        },
        dataType: 'text',
        success: function(result) {
          if(result == "success") {
            alert("댓글 삭제 성공");

            url = "/review/list/" + p_no + "/" + reviewPage + ".json";

            getPage(url);
          }
        }

      });
    });

  }); // JQuery Ready

  // 댓글 목록과 페이징 작업. ajax 관련 내용. https://www.w3schools.com/jquery/jquery_ref_ajax.asp
  
  let p_no = ${productVO.p_no}; // 게시물 번호 255
  let reviewPage = 1;
  let url = "/review/list/" + p_no + "/" + reviewPage + ".json";

  getPage(url);

  function getPage(url) {
    $.getJSON(url, function(data) {
      
      /*
      //data.list, data.pageMaker
      let replyListInfo = "";

      for(let i=0; i<data.list.length; i++) {

        replyListInfo += "댓글 번호" + data.list[i].rno;
        replyListInfo += "댓글 내용: " + data.list[i].reply;
        replyListInfo += "댓글 작성자: " + data.list[i].replyer;
        replyListInfo += "댓글 등록일: " + data.list[i].replydate;
        replyListInfo += "<hr>";

        $("#replyList").append(replyListInfo);
      }
        */

      printReplyData(data.list, $("#replyList"), $("#replyViewTemplate"));
      printReplyPaging(data.pageMaker, $("#replyPaging"));
    });
  }

  // 댓글목록 출력기능. replyArr : 댓글목록데이터(json), target : 댓글삽입위치, template : 댓글디자인
  function printReplyData(replayArr, target, template) {
    let templateObj = Handlebars.compile(template.html());
    let replyHtml = templateObj(replayArr); // 테이블과 댓글데이터가 바인딩된 결과
    target.empty();
    target.append(replyHtml);
    
    // console.log(replyHtml);
  }

    // 페이징 출력기능
  function printReplyPaging(pageMaker, target) {
    let pageInfoStr = "<nav aria-label='Page navigation example'>";
      pageInfoStr += '<ul class="pagination">';
    
        if(pageMaker.prev) {
          pageInfoStr += '<li class="page-item">';
          pageInfoStr += '<a class="page-link" href="' + (pageMaker.startPage - 1) + '" aria-label="Previous">';
          pageInfoStr += '<span aria-hidden="true">&laquo;</span>';
          pageInfoStr += '</a></li>';
        }

        for(let i=pageMaker.startPage; i<= pageMaker.endPage; i++) {
          let currPageClass = (pageMaker.cri.pageNum == i) ? 'active' : '';
          pageInfoStr += '<li class="page-item ' + currPageClass + '"><a class="page-link" href="' + i + '">' + i + '</a></li>'
        }

        if(pageMaker.next) {
          pageInfoStr += '<li class="page-item">';
          pageInfoStr += '<a class="page-link" href="' + (pageMaker.endPage + 1) + '" aria-label="Next">';
          pageInfoStr += '<span aria-hidden="true">&raquo;</span>';
          pageInfoStr += '</a></li>';
        }

        target.empty();
        target.append(pageInfoStr);
    }



</script>
</html>