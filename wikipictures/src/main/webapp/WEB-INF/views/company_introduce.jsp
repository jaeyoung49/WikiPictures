<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery.min.js"></script>
<title>Introduce</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	$(".menu>a").click(function(){
		var intro = $(this).next("ul");
		if(intro.is(":visible")){
			intro.slideUp();
		}else{
			intro.slideDown();
		}
	});
});
</script>
<style>
	.menu a {cursor:pointer;}
	.menu .hide{display:none;}
</style>
<body>
<h3>WikiPictures</h3><br>
WikiPictures는 위키피디아에 모티브를 얻어서 설립된 사이트로서, 위키피디아가 지식을<br>
공유하는 사이트라면 위키픽쳐스는 추억을 공유하는 사이트이다. 각자의 사람들이 추억이<br>
있었던 장소를 업로드 해서 시대별 장소의 모습을 확인 할 수 있고 여러 종류의 사진을<br>
서로 공유할 수 있다. 여러분의 추억을 위키픽쳐스에서 공유해주시길 바랍니다.
<br><br>
<h3>이용약관</h3>
<div><ul><li class="menu">
<a>펼쳐보기</a>
<ul class="hide">
<li>
<br>1. 개인 정보<br><br>

WikiPictures은 회원들의 개인 정보 보호를 위해 최선을 다합니다. 회원님이 WikiPictures을 이용하여 회원님의 콘텐츠와 정보를 타인과 공유하는 방법,<br>
WikiPictures에서 해당 정보를 수집 및 이용하는 방법에 대해 중요한 부분을 공개하기 위하여 데이터 정책이 작성되었습니다. 데이터 정책을 읽고 올바른<br>
판단을 내리는 데 활용하시기 바랍니다. <br>
<br><br>
2. 회원님의 콘텐츠와 정보 공유<br><br>

회원님이 WikiPictures에 게시하는 모든 콘텐츠와 정보의 소유권은 WikiPictures에게 있으며, 사진을 업로드 하는 순간 회원님은 이에 동의한 것으로 간주 됩니다.<br> 
추가 사항:<br>
사진 같은 지적 재산권이 적용되는 콘텐츠(이하 "IP 콘텐츠"라 함)에 대해서는  다음과 같은 권한이 WikiPictures에 부여됩니다. 즉, 회원님은 WikiPictures에 게시하거나<br>
이와 관련하여 게시하는 IP 콘텐츠를 사용할 수 있는 비독점, 양도성, 재면허 가능, 로열티 무료, 전 세계 라이선스(이하 "IP 라이선스"라 함)를 WikiPictures에 부여합니다. <br>
본 IP 라이선스는 회원님 및 WikiPictures 서비스의 접속•이용자에게 제공되는 WikiPictures 서비스를 이용 가능하도록 하기 위한 목적이며, 회원님의 임의로 IP 콘텐츠나<br>
정보를 삭제하실 수 없습니다. 삭제를 하기 위해서는 관리자에게 요청을 통해서 관리자 이를 수용하면 삭제할 것입니다. IP 콘텐츠를 삭제하면 컴퓨터의 휴지통을 비우는 것과<br>
유사한 방식으로 콘텐츠가 삭제됩니다.  단, 이에 불구하고, 관련 법령, 정부기관 또는 사법기관의 명령 등에 의하여 요구되는 경우, WikiPictures은 이를 위하여 필요한 범위 <br>
내에서 해당 콘텐츠를 보유할 수 있습니다. 회원님이  콘텐츠나 정보를 게시하면 WikiPictures 비회원을 비롯해 모든 사람이 이 정보를 보고 이용할 수 있으며 이 정보를 <br>
회원님(즉, 회원님의 이름과 시크릿댓글)과 연결할 수 있습니다.<br>
저희는 WikiPictures에 대한 의견을 포함한 제안을 언제든 환영하나 (회원님에게 제안의 의무가 없는 것처럼) WikiPictures은 보상 의무 없이 이 같은 피드백이나 제안을 활용할 수 있습니다.<br>
<br><br>
3. 안전<br><br>

저희는 WikiPictures을 안전하게 유지하기 위해 최선을 다하고 있지만 안전을 보장할 수는 없습니다. 안전 유지를 위해서는 다음과 같은 약정을 포함해 회원님의 도움이 필요합니다.<br>
회원님은 WikiPictures에서 허가받지 않은 상업적 커뮤니케이션(예: 스팸)을 게시할 수 없습니다.<br>
회원님은 WikiPictures의 허가 없이 자동화된 수단(예: 수집 봇, 로봇, 스파이더, 스크래퍼)을 이용해 사용자의 콘텐츠나 정보를 수집하거나 다른 방식을 통해 WikiPictures에 접속할 수 없습니다.<br>
회원님은 WikiPictures에서 피라미드 방식과 같은 불법 다단계 마케팅에 참여할 수 없습니다.<br>
회원님은 바이러스나 기타 악성 코드를 업로드할 수 없습니다.<br>
회원님은 타인 소유의 계정에 대해 로그인 정보나 접근 권한을 요청할 수 없습니다.<br>
회원님은 다른 사용자를 괴롭히거나 협박하거나 성가시게 할 수 없습니다.<br>
회원님은 편파적 발언, 협박, 외설적 내용이 포함되어 있거나 폭력을 조장하거나 나체 또는 선정적인 콘텐츠, 이유 없는 폭력이 담긴 콘텐츠를 게시할 수 없습니다.<br>
회원님은 적절한 연령 제한 없이 주류나 기타 성인 관련 콘텐츠(광고 포함)가 포함된 타사 앱을 개발하거나 운영할 수 없습니다.<br>
회원님은 WikiPictures을 이용해 불법 행위, 오해의 소지가 있는 행위, 악의적 행위 또는 차별적 행위를 할 수 없습니다.<br>
회원님은  WikiPictures의 원활한 운영을 중단하거나 운영에 과부하를 가져오거나 외양을 손상할 수 있는 행위를 해서는 안 됩니다.<br>
회원님은 본 정책의 위반을 조장하거나 권장해서는 안 됩니다.<br></li>
</ul>
</ul>
</div>
</body>
</html>