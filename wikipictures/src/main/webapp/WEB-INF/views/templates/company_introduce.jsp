<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
$(document).ready(function() {
  $(".menu>a").click(function() {
    var intro = $(this).next("ul");
    if (intro.is(":visible")) {
      intro.slideUp();
    } else {
      intro.slideDown();
    }
  });
});
</script>
<style>
.menu a {
  cursor: pointer;
}

.menu .hide {
  display: none;
}
</style>
<div class="container">
  <h3>WikiPictures</h3>
  <br> WikiPictures는 위키피디아에 모티브를 얻어서 설립된 사이트로서, 위키피디아가 지식을
  <br> 공유하는 사이트라면 위키픽쳐스는 추억을 공유하는 사이트이다. 각자의 사람들이 추억이
  <br> 있었던 장소를 업로드 해서 시대별 장소의 모습을 확인 할 수 있고 여러 종류의 사진을
  <br> 서로 공유할 수 있다. 여러분의 추억을 위키픽쳐스에서 공유해주시길 바랍니다.
  <br>
  <br>
  <div class="container">
    <a href='javascript:void(0)' onclick="this.innerHTML=(this.nextSibling.style.display=='none')?
    '닫기':'<h3>인재채용기준</h3>';this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none'" ;>
      <h3>인재채용 기준</h3></a>
    <DIV style='display:none'>
      <h3>인재채용 기준</h3>
      <table>
        <tr>
          <td>
            <br>
            <h4><font color="gray">Culture Report. 01<br><br></font>
			<font color="green">내 일</font> 에<br>
			책임을 다하는 문화<br><br>
			WikiPictures는 24시간 서비스를 제공<br>
			하기 때문에 늘 즉각적인 대응과 업무 <br>
			확인이 필요합니다. 회사가 ‘얼마나 일<br>
			했느냐’를 관리하는 방식에서 나 스스<br>
			로 ‘어떤 성과를 낼 것이냐’에 집중하여 <br>
			개개인이 자율적으로 업무 시간을 관리<br>
			하고 일에 책임지는 문화를 정착<br>
			시켜 나가고 있습니다.</td></h4>
            <td>
              <font color="white"> 공백생성하기
              </font>
            </td>
            <td>
              <h4><font color="gray">Culture Report. 02<br><br></font>
			<font color="green">스스로</font> 결정하고<br>
			선택하는 제도<br><br>
			일 하자고 올린 결재만 며칠이 걸리는 일, <br>
			WikiPictures에는 없습니다. 결재의 대부분<br>
			을 조직장이 승인하는 번거로운 과정을 <br>
			줄였으며, 업무의 효율성을 높이고 직원들은<br>
			업무 환경에서 노트북이나 PC등의 업무기기 <br>
			개인의 업무 스타일에 맞게 스스로 선택 <br>
			할 수 있습니다.<br></h4>
            </td>
      </table>
    </div>
    <br>
    <h3>팀원소개</h3>
    <br> Name: Position: Cell Phone: Favorite Space:
    <br>
    <img src="${pageContext.request.contextPath}/resources/img/lsh.jpg">
    <img src="${pageContext.request.contextPath}/resources/img/ljy.jpg">
    <img src="${pageContext.request.contextPath}/resources/img/jh.jpg">
    <br>
    <img src="${pageContext.request.contextPath}/resources/img/jhs.jpg">
    <img src="${pageContext.request.contextPath}/resources/img/mnc.jpg">
    <img src="${pageContext.request.contextPath}/resources/img/dhk.jpg">
    <br>
    <br>
  </div>


