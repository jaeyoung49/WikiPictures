<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <ul class="nav navbar-nav navbar-right">
    <li class="dropdown">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown"><b>로그인</b>
  <span class="caret"></span></a>
      <ul id="login-dp" class="dropdown-menu">
        <li>
          <div class="row">
            <div class="col-md-12">
              <b style="color: #fff">소셜 로그인</b>
              <div class="social-buttons">
                <a href="#" class="btn btn-fb"><i class="fa fa-facebook"></i> Facebook</a>
                <a href="#" class="btn btn-go"><i class="fa fa-google"></i> Google</a>
              </div>
              <form class="form" role="form" method="post" action="${pageContext.request.contextPath}/login.do" accept-charset="UTF-8" id="login-nav">
                <div class="form-group">
                  <label class="sr-only" for="exampleInputId2">id</label>
                  <input type="text" class="form-control" id="exampleInputEmailId2" name="id" placeholder="이메일" required>
                </div>
                <div class="form-group">
                  <label class="sr-only" for="exampleInputPassword2">password</label>
                  <input type="password" class="form-control" id="exampleInputPassword2" name="password" placeholder="비밀번호" required>
                  <div class="help-block text-right"><a href="${pageContext.request.contextPath}/member.do">
                  <strong style="color: Navy">비밀번호 찾기</strong></a></div>
                </div>
                <div class="form-group">
                  <input type="submit" class="btn btn-primary btn-block" value="로그인">
                </div>
              </form>
            </div>
            <div class="bottom text-center">
              회원이 아니세요?&nbsp;<a href="#" style="text-decoration:none;" data-toggle="modal" data-target="#registerModal">
              <strong style="color: Navy">&nbsp;회원가입</strong></a>
            </div>
          </div>
        </li>
      </ul>
    </li>
  </ul>