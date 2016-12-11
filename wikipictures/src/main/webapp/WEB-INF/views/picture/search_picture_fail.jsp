<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
  <div class="row text-center">
    <h1>(${pictureVO.keyword})</h1>
    <span style="font-size:1.5em">
      와(과) 일치하는 검색결과가 없습니다. 다시 검색하시려면 상단의 검색창을 이용해주세요.
    </span>
    <hr>
    <a class="btn btn-warning btn-lg btn-block" id="formButton" type="button" href="${pageContext.request.contextPath}/picture/register_picture_form.do">
      <strong>"${pictureVO.keyword}"</strong>에 대한 추억이 있으신가요? 당신의 추억을 공유해주세요!</a>
  </div>
  <div class="row">
    <div class="col-md-8"><img src="resources/img/tube.jpeg" style="width:400px; height:auto;"></div>
    <div class="col-md-4" style="margin-top:10%">
      <h3>제안 : </h3>
      <ul style="font-size:1.5em">
        <li>다른 검색어를 사용해 보세요.</li>
        <li>더 일반적인 검색어를 사용해 보세요.</li>
        <li>키워드 수를 줄여보세요.</li>
        <li>모든 단어의 철자가 정확한지 확인하세요.</li>
      </ul>
    </div>
  </div>
</div>
