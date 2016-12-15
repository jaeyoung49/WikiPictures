<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function() {
	  var checkResultId = "";
	  $("#regForm").submit(function() {
	   
	  });
	  $("#regForm :input[name=id]").keyup(function() {
	    var id = $(this).val().trim();
	    if (id.length < 4 || id.length > 100) {
	      $("#idCheckView").html("사용중인 이메일 입력해주세요!").css(
	        "background", "pink");
	      checkResultId = "";
	      return;
	    }
	    $.ajax({
	      type: "POST",
	      url: "${pageContext.request.contextPath}/idcheckAjax.do",
	      data: "id=" + id,
	      success: function(data) {
	        if (data == "fail") {
	          $("#idCheckView").html(id + "사용불가!").css("background", "red");
	          checkResultId = "";
	        } else {
	          $("#idCheckView").html(id + "사용가능!").css(
	            "background", "yellow");
	          checkResultId = id;
	        }
	      }
	    });
	  });
	});
</script>
<div id="map" style="width:100%;height:350px;margin:0 auto;display:none"></div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//apis.daum.net/maps/maps3.js?apikey=2f84ffd7f776b0da2b1683fe0b016555&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });

    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = fullAddr;
                // 주소로 좌표를 검색
                geocoder.addr2coord(data.address, function(status, result) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
<div class="modal-dialog">
  <h1 class="text-center" style="color:#fff;">환영합니다</h1>
  <form name="login" class="register" role="form" method="post" id="regForm" action="${pageContext.request.contextPath}/registerMember.do" accept-charset="UTF-8">
    <b style="color: #fff">소셜 가입</b>
    <div class="social-buttons form-group">
      <a href="#" class="btn btn-fb btn-block"><i class="fa fa-facebook"></i> Facebook</a>
      <a href="#" class="btn btn-go btn-block"><i class="fa fa-google"></i> Google</a>
    </div>
    <div class="form-group">
      <label class="sr-only">id</label>
      <input type="email" name="id" class="form-control" placeholder="이메일" required>
      <span id="idCheckView"></span>
    </div>
    <div class="form-group">
      <label class="sr-only">비밀번호</label>
      <input type="password" name="password" class="form-control" placeholder="비밀번호" required>
    </div>
    <div class="form-group">
      <label class="sr-only">닉네임</label>
      <input type="text" name="nickname" class="form-control" placeholder="닉네임" required>
    </div>
    <div class="form-group">
      <input class="form-control" type="text" data-format="Y-m-d" data-lang="ko" id="date" name="birth" required>
    </div>
    <div class="form-group">
      <label class="sr-only">선호장소</label>
    	<div class="input-group">
      		<input type="text" id="sample5_address" placeholder="장소 검색 버튼을 누르세요"
      			name="favoriteSpace" class="form-control" readonly required>
      		<span class="input-group-btn">
			<button class="btn btn-default" type="button" onclick="sample5_execDaumPostcode()">장소검색</button>
			</span>
		</div>
    </div>
    <div class="form-group">
      <button type="submit" class="btn btn-primary btn-block">회원가입</button>
      <button type="button" class="btn btn-default btn-block" data-dismiss="modal">닫기</button>
    </div>
  </form>
</div>

<script>
	$(document).ready(function() {
	  // 날짜 선택 Controll
	  $('#date').dateDropper();
	});
</script>
