<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(document).ready(function() {
		  $("#searchForm").submit(function() {
		    if ($("#searchForm :input[name=id]").val().trim() == "") {
		      alert("이메일을 입력하세요!");
		      return false;
		    }
		    
		    if ($("#searchForm :input[name=nickname]").val().trim() == "") {
		      alert("별명을 입력하세요!");
		      return false;
		    }
	      });
	});
</script>

  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">비밀번호찾기</h4>
      </div>
      	<form action ="${pageContext.request.contextPath}/memberSearch.do" id="searchForm">
      	<div class="modal-body">
      		<div class="form-group">
      			<label for="id" class="control-label">이메일</label>
        		<input type="text" class="form-control" name="id" id="id">
        	</div>
        	<div class="form-group">
        		<label for="nickname" class="control-label">별명</label>
				<input type ="text" class="form-control" name="nickname" id="nickname">
			</div>
      	</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">창닫기</button>
        <input type ="submit" class="btn btn-primary" value="찾기">
      </div>
		</form>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
