<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원가입</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "${pageContext.request.contextPath}/";
			})
		
			$("#submit").on("click", function(){
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("이름을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				$.ajax({
					url : "${pageContext.request.contextPath}/member/passChk",
					type : "POST",
					dateType : "json",
					data : $("#updateForm").serializeArray(),
					success: function(data){
						
						if(data==true){
							if(confirm("회원수정하시겠습니까?")){
								$("#updateForm").submit();
							}
							
						}else{
							alert("패스워드가 틀렸습니다.");
							return;
							
						}
					}
				})
			});
			
		})
	</script>
	<body>
		<section id="container">
			<form action="${pageContext.request.contextPath}/member/memberUpdate" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="userId">이메일</label>
					<input class="form-control" type="text" id="userId" name="email" value="${member.email}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userPass">패스워드</label>
					<input class="form-control" type="password" id="userPass" name="pw" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userName">이름</label>
					<input class="form-control" type="text" id="userName" name="name" value="${member.name}"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="tel">이름</label>
					<input class="form-control" type="text" id="tel" name="tel" value="${member.tel}"/>
				</div>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
		</section>
		
	</body>
	
</html>