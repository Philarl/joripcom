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

  <section class="container">
  	<div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
        	<form class="validation-form" id="joinForm" method="post" action="/member/join">
	          <div class="card card-primary">
	              <div class="card-header">
	                <h3 class="card-title">회원 가입</h3>
	              </div>
	              <!-- /.card-header -->
	              <!-- form start -->
	                <div class="card-body">
	                  <div class="form-group row">
	                  	<div class="col-md-4 mb-3">
		                    <label for="u_name">이름</label>
		                    <input type="text" class="form-control" name="u_name" id="u_name">
		                    <input type="hidden" class="form-control" name="u_id" id="u_id" value="${kakao_id }">
		                    <input type="hidden" class="form-control" name="u_pw" id="u_pw" value="${kakao_pw }">
	                    </div>
	                  	<div class="col-md-4 mb-3">
		                    <label for="u_phone">전화번호</label>
		                    <input type="text" class="form-control" name="u_phone" id="u_phone">
	                    </div>
	                  	<div class="col-md-4 mb-3">
		                    <label for="u_nic">닉네임</label>
		                    <input type="text" class="form-control" name="u_nic" id="u_nic">
	                    </div>
	                  </div>
	                  <div class="form-group row">
	                  	<div class="col-md-4 mb-3">
		                    <label for="u_email">이메일</label>
		                    <input type="email" class="form-control" name="u_email" id="u_email">
	                    </div>
	                  	<div class="col-md-2 mb-3">
		                    <label for="btn_authcode"></label><br>
		                    <button type="button" class="btn btn-primary" id="btn_authcode">인증코드 발송</button>
	                    </div>
	                  	<div class="col-md-4 mb-3">
		                    <label for="email_auth_code">인증번호</label>
		                    <input type="text" class="form-control" name="email_auth_code" id="email_auth_code">
	                    </div>
	                  	<div class="col-md-2 mb-3">
		                    <label for="btn_confirmAuthcode"></label><br>
		                    <button type="button" class="btn btn-primary" id="btn_confirmAuthcode">인증번호 확인</button>
	                    </div>
	                  </div>
	                  <div class="form-group row">
	                  	<div class="col-md-4 mb-3">
		                    <label for="sample2_postcode">우편번호</label>
		                    <input type="text" class="form-control" name="u_zipcode" id="sample2_postcode">
	                    </div>
	                  	<div class="col-md-2 mb-3">
		                    <label for="btn_u_zipcode"> </label><br>
		                    <button type="button" class="btn btn-primary" id="btn_u_zipcode" onclick="sample2_execDaumPostcode()">우편번호 찾기</button>
	                    </div>
	                  	<div class="col-md-6 mb-3">
		                    <label for="sample2_address">주소</label>
		                    <input type="text" class="form-control" name="u_addr" id="sample2_address">
	                    </div>
	                  </div>
	                  <div class="form-group row">
	                  	<div class="col-md-12 mb-3">
		                    <label for="sample2_detailAddress">상세주소</label>
		                    <input type="text" class="form-control" name="u_addr_dtl" id="sample2_detailAddress">
		                    <input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
	                    </div>
	                  </div>
	                  <div class="form-check">
	                    <input type="checkbox" class="form-check-input" name="check_personal" id="check_personal" required oninvalid="개인정보 수집에 동의해주세요.">
	                    <label class="form-check-label" for="check_personal">개인정보 수집 및 이용에 동의합니다.</label><br>
	                    <input type="checkbox" class="form-check-input" name="check_email_rx" id="check_email_rx" value="Y">
	                    <label class="form-check-label" for="check_email_rx">메일 수신에 동의합니다.</label>
	                  </div>
	                </div>
	                <!-- /.card-body -->
	
	                <div class="card-footer">
	                  <button type="submit" class="btn btn-primary">Submit</button>
	                </div>
	                </div>
	              </form>
	            </div>
        </div>
      </div>
  <!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
	<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
	<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>
  </section>

</main>

<!-- footer -->
<%@include file="/WEB-INF/views/include/footer.jsp" %>

<!-- config -->
<%@include file="/WEB-INF/views/include/config.jsp" %>
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
<script>

  $(document).ready(function() {

    let idCheck = false;
    let isAuthcode = false;

    // ID중복체크
    $("#btn_idCheck").on("click", function() {
      
      if($("#u_id").val() == "") {
        alert("아이디를 입력하세요.");
        $("#u_id").focus();
        return;
      }

      $.ajax({
        url: '/member/idCheck',
        type: 'get',
        dataType: 'text',
        data: {u_id : $("#u_id").val()},
        success: function(result) {

          if(result == "yes") {
            alert("아이디 사용가능");
            idCheck = true;
          }else {
            alert("아이디 사용 불가능");
            $("#u_id").val("");
            $("#u_id").focus();
          }
        }
      }
      );
    });

    // 메일인증코드
    $("#btn_authcode").on("click", function() {
      if($("#u_email").val() == "") {
        alert("메일주소를 입력하세요.");
        $("#u_email").focus();
        return;
      }

      $.ajax({
        url: '/email/send',
        type: 'get',
        dataType: 'text',
        data: {receiverMail : $("#u_email").val()},
        success: function(result) {

          if(result == "success") {
            alert("인증메일이 발송되었습니다. 메일을 확인해주세요.");
          }
        }
      });
    });

    $("#btn_confirmAuthcode").on("click", function() {
      if($("#email_auth_code").val() == "") {
        alert("인증코드를 입력하세요.");
        $("#email_auth_code").focus();
        return;
      }

      $.ajax({
        url: '/email/comfirmAuthcode',
        type: 'get',
        dataType: 'text',
        data: {authCode : $("#email_auth_code").val()},
        success: function(result) {

          if(result == "success") {
            alert("인증코드가 확인되었습니다.");
            isAuthcode = true;
          }else if(result == "fail") {
            alert("인증코드가 다릅니다. 인증코드 요청을 다시 해주세요.");
          }
        }
      });

    });

  });

</script>
  </body>
</html>
