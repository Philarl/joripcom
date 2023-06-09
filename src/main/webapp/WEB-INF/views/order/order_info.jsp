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
	  <h4 class="display-4">주문하기</h4>
	</div>
<div class="container">
	<div class="row">



		<div class="col-md-12">
			<div>
				<div>
					<table class="table table-hover">
					<tbody><tr>
						<th style="width: 50%">상품명</th>
						<th style="width: 10%">수량</th>
						<th style="width: 10%">포인트</th>
						<th style="width: 10%">배송비</th>
						<th style="width: 10%">가격</th>
					</tr>
					<c:forEach items="${cart_list }" var="cartListDTO">      
					<tr>
						<td>
						<input type="hidden" name="cart_no" value="${cartListDTO.cart_no }">
						<a class="move" href="${cartListDTO.p_no}"><img src="/cart/displayImage?folderName=${cartListDTO.p_up_folder }&fileName=s_${cartListDTO.p_img }"></a>
						<a class="move" id="p_name" href="${cartListDTO.p_no}"><c:out value="${cartListDTO.p_name }" /></a>
						</td>
						<td>
							<input type="text" name="cart_amt" value="${cartListDTO.cart_amt }">
						</td>
						<td>포인트 : 0</td>
						<td>[기본배송조건]</td>
						<td><input type="text" name="p_px" value="${cartListDTO.p_px }" readonly></td>
					</tr>
					</c:forEach>
					</tbody>
					<tfoot>
						<tr>
						<input type="hidden" id="ord_sum" name="ord_sum" value="${cart_total_price }">
						<td colspan="6" class="text-right">총 구매금액 : <fmt:formatNumber type="currency" pattern="￦#,###" value="${cart_total_price }"/></td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
		<hr class="mb-4">

		<div class="row">
			<div class="col-md-12">
				<div class="card card-primary">
						<div class="card-header">
							<h3 class="card-title">주문자 정보</h3>
						</div>
						<!-- /.card-header -->
						<!-- form start -->
						<form>
							<div class="card-body">
								<div class="form-group row">
									<div class="col-md-4 mb-3">
										<label for="ord_name">이름</label>
										<input type="text" class="form-control" name="ord_name" id="ord_name" value="<c:out value='${memberVO.u_name }' />">
									</div>
									<div class="col-md-4 mb-3">
										<label for="ord_email">이메일</label>
										<input type="email" class="form-control" name="ord_email" id="ord_email" value="<c:out value='${memberVO.u_email }' />">
									</div>
									<div class="col-md-4 mb-3">
										<label for="ord_phone">전화번호</label>
										<input type="text" class="form-control" name="ord_phone" id="ord_phone" value="<c:out value='${memberVO.u_phone }' />">
									</div>
								</div>
							</div>
					</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="card card-primary">
						<div class="card-header">
							<h3 class="card-title">배송 정보</h3>
						</div>
						<!-- /.card-header -->
						<!-- form start -->
						<form>
							<div class="card-body">
								<div class="form-group row">
									<input type="hidden" id="order_productName" value="order_productName">
									<div class="col-md-4 mb-3">
										<label for="sample2_postcode">우편번호</label>
										<input type="text" class="form-control" name="ord_zipcode" id="sample2_postcode" value="<c:out value='${memberVO.u_zipcode }' />">
									</div>
									<div class="col-md-4 mb-3">
										<label for="btn_u_zipcode"> </label><br>
										<button type="button" class="btn btn-primary" id="btn_u_zipcode" onclick="sample2_execDaumPostcode()">우편번호 찾기</button>
									</div>
									<div class="col-md-4 mb-3">
										<label for="sample2_address">주소</label>
										<input type="text" class="form-control" name="ord_addr" id="sample2_address" value="<c:out value='${memberVO.u_addr }' />">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-md-12 mb-3">
										<label for="sample2_detailAddress">상세주소</label>
										<input type="text" class="form-control" name="ord_addr_dtl" id="sample2_detailAddress" value="<c:out value='${memberVO.u_addr_dtl }' />">
										<input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
									</div>
								</div>
							</div>
					</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="card card-primary">
						<div class="card-header">
							<h3 class="card-title">결제 정보</h3>
						</div>
						<!-- /.card-header -->
						<!-- form start -->
						<form>
							<div class="card-body">
								<div class="form-group row">
									<div class="col-md-2">
										<label for="">결제방법</label>
									</div>
									<div class="col-md-10">
										<select name="pay_method" id="pay_method" class="custom-select w-40">
											<option value="">결제방법을 선택하세요.</option>
											<option value="bank">무통장입금</option>
											<option value="kakaopay">카카오페이</option>
										</select>
										<select name="pay_bank" id="pay_bank" style="display: none;" class="custom-select w-40">
											<option value="">입금은행을 선택하세요.</option>
											<option value="kukmin">국민은행</option>
											<option value="hana">하나은행</option>
										</select>
										<p id="pay_user_vw" style="display: none;">입금자명 : <input type="text" class="form-control" name="pay_user" id="pay_user"></p>
									</div>
								</div>
							</div>
					</div>
			</div>
		</div>

		<hr class="mb-4">
		<div class="mb-4 text-center">
			<input type="hidden" name="ord_price" id="ord_price" value="${cart_tot_price }">
			<button name="btn_buy" data-paytype="bank" class="btn btn-primary" id="btn_order" type="button">무통장 결제하기</button>
			<img src="/image/payment_icon_yellow_medium.png" name="btn_buy" data-paytype="kakaopay" id="btn_kakaopay"></img>
		</div>
  <%@include file="/WEB-INF/views/include/footer.jsp" %>
  
	</div>
</div>

</main>

<!-- footer -->
<%@include file="/WEB-INF/views/include/footer.jsp" %>

<!-- config -->
<%@include file="/WEB-INF/views/include/config.jsp" %>

<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
	<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
		// 우편번호 찾기 화면을 넣을 element
		var element_layer = document.getElementById('layer');

		function closeDaumPostcode() {
				// iframe을 넣은 element를 안보이게 한다.
				element_layer.style.display = 'none';
		}

		function sample2_execDaumPostcode() {
				new daum.Postcode({
						oncomplete: function(data) {
								// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

								// 각 주소의 노출 규칙에 따라 주소를 조합한다.
								// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
								var addr = ''; // 주소 변수
								var extraAddr = ''; // 참고항목 변수

								//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
								if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
										addr = data.roadAddress;
								} else { // 사용자가 지번 주소를 선택했을 경우(J)
										addr = data.jibunAddress;
								}

								// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
								if(data.userSelectedType === 'R'){
										// 법정동명이 있을 경우 추가한다. (법정리는 제외)
										// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
										if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
												extraAddr += data.bname;
										}
										// 건물명이 있고, 공동주택일 경우 추가한다.
										if(data.buildingName !== '' && data.apartment === 'Y'){
												extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
										}
										// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
										if(extraAddr !== ''){
												extraAddr = ' (' + extraAddr + ')';
										}
										// 조합된 참고항목을 해당 필드에 넣는다.
										document.getElementById("sample2_extraAddress").value = extraAddr;
								
								} else {
										document.getElementById("sample2_extraAddress").value = '';
								}

								// 우편번호와 주소 정보를 해당 필드에 넣는다.
								document.getElementById('sample2_postcode').value = data.zonecode;
								document.getElementById("sample2_address").value = addr;
								// 커서를 상세주소 필드로 이동한다.
								document.getElementById("sample2_detailAddress").focus();

								// iframe을 넣은 element를 안보이게 한다.
								// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
								element_layer.style.display = 'none';
						},
						width : '100%',
						height : '100%',
						maxSuggestItems : 5
				}).embed(element_layer);

				// iframe을 넣은 element를 보이게 한다.
				element_layer.style.display = 'block';

				// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
				initLayerPosition();
		}

		// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
		// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
		// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
		function initLayerPosition(){
				var width = 300; //우편번호서비스가 들어갈 element의 width
				var height = 400; //우편번호서비스가 들어갈 element의 height
				var borderWidth = 5; //샘플에서 사용하는 border의 두께

				// 위에서 선언한 값들을 실제 element에 넣는다.
				element_layer.style.width = width + 'px';
				element_layer.style.height = height + 'px';
				element_layer.style.border = borderWidth + 'px solid';
				// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
				element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
				element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
		}
</script>  
</body>

<script>
$(document).ready(function() {

	$("#btn_order").attr("disabled", true);
	$("#btn_kakaopay").attr("disabled", true);

	$("#pay_method").on("change", function() {

		let pay_method = $(this).val();
		console.log(pay_method);

		if(pay_method == "kakaopay") {
			$("#btn_order").attr("disabled", true);
			$("#btn_kakaopay").attr("disabled", false);
			$("#pay_user_vw").css("display", "none");
			$("#pay_bank").css("display", "none");

		}else if(pay_method == "bank") {
			$("#btn_order").attr("disabled", false);
			$("#btn_kakaopay").attr("disabled", true);
			$("#pay_user_vw").css("display", "block");
			$("#pay_bank").css("display", "block");

		}

	});

	$("[name='btn_buy']").on("click", function() {

			let pay_type = $(this).data("paytype");

			let order_info = {
				pay_type : pay_type,
				order_productName : $("#order_productName").val(),
				ord_sum : $("#ord_sum").val(),

				ord_name : $("#ord_name").val(),
				ord_email : $("#ord_email").val(),
				ord_phone : $("#ord_phone").val(),

				ord_zipcode : $("#sample2_postcode").val(),
				ord_addr : $("#sample2_address").val(),
				ord_addr_dtl : $("#sample2_detailAddress").val(),

				pay_px: $("#ord_sum").val(),
				pay_method : $("#pay_method").val(),
				pay_bank : $("#pay_bank").val(),
				pay_user : $("#pay_user").val(),
				pay_memo : '생략'
			};

			$.ajax({
				url: '/order/orderReady',
				data: order_info,
				dataType: 'json',
				type: 'get',
				success : function(result) {
          console.log("응답: " + result.next_redirect_pc_url);
					if(pay_type == "kakaopay") {
						location.href = result.next_redirect_pc_url
					}else if(pay_type == "bank") {
          console.log("무통장입금 완료?");
						location.href = "/order/orderComplete";
					}
				},
				error : function(xhr, textStatus, error) {
					if(xhr.responseText.includes("ORA-20001")) {
						let p_name = $("#p_name").text();
						console.log(xhr.responseText);
						// console.log(p_name);
						alert(p_name + "의 재고가 부족합니다.")
					}
					// console.log(xhr);
					// console.log(textStatus);
					// console.log(error);
				}

			});

	});

});
</script>
</html>
