<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>   
    <script>
      $(document).ready(function(){
        $('ul.first').bsPhotoGallery({
          "classes" : "col-lg-2 col-md-4 col-sm-3 col-xs-4 col-xxs-12",
          "hasModal" : true,
          "fullHeight" : true
        });
      });
    </script>

 
  <div style="margin-bottom: 20px;">
  </div>
 
        <ul class="row first">
               <c:forEach items="${requestScope.searchPicture }" var ="pictureVO">
            <li>
<%-- <a href="${pageContext.request.contextPath}/searchDetailPicture.do?pictureDate=${pictureVO.pictureDate}&keyword=${pictureVO.keyword}"> --%>
<img alt="" src="${pageContext.request.contextPath}/resources/img/${pictureVO.path}">
    <!-- </a> -->
                    <div class="text"><h3><a href="${pageContext.request.contextPath}/searchDetailPicture.do?pictureDate=${pictureVO.pictureDate}&keyword=${pictureVO.keyword}">${pictureVO.keyword }</a></h3></div>
           </li> 
        </c:forEach>
        <!-- <li>
                <img alt="키워드"  src="resources/img/2.jpg">
                <div class="text"><a href="http://www.naver.com">링크</a></div>
            </li> -->
  </ul>
