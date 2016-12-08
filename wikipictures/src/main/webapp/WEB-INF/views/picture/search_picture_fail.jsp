<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <div style="width:600px; height:auto; margin:0 auto; border:1px solid white;">
<img src="resources/img/이미지없음.jpg" align="center" width="600" height="450">
<br>
일치하는 정보를 찾을수 없습니다.
 <!-- Carousel Button END ================================================== -->
  <br>
    
    <!-- Serch ================================================== -->
    <div class="col-xs-12">
      <div class="input-group">
     	 <form action ="searchPicture.do">
        <input type="text" name="keyword" class="form-control" placeholder="검색할 내용을 입력해주세요">
        <span class="input-group-btn">
          <button class="btn btn-default" type="submit">검색</button>
        </span>
        </form>
      </div><!-- /input-group -->
    </div><!-- /search -->
  </div><!-- /.carousel -->
  </div>
  <!-- Carousel END ================================================== -->