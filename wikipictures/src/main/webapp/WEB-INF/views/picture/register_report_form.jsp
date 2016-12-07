<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

report_no, report_type,report_content,report_date,pic_date,keyword
<form method="post" action="#">
<select >
<option class="1">신고요청
<option class="2">정정요청
</select>
<input type="hidden" value="${reportNo}">
<input type="hidden" value="${reportDate}">
<input type="hidden" value="${pictureVO.pictureDate }">
<input type="hidden" value="${pictureVO.keyword }">
타입 : <input type="text">
사유 : <input type="text">
</form>
