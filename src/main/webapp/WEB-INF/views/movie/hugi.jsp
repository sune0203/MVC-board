<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.naver.dao.MemberDaoImpl"  
    import="com.naver.VO.HugiVO"
    import="java.util.*" %>
    
<%@ include file="../top.jsp" %>

<% if (member == null){ %>
<script> alert("로그인을 하면 이용 가능 합니다.");
location.href="login.nhn";</script>
<% }  %>

<% 
// 	ArrayList<HugiVO> list = (ArrayList<HugiVO>)request.getAttribute("hugilist");
%>

<!-- bar-rating -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-bar-rating/1.2.2/themes/fontawesome-stars.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-bar-rating/1.2.2/jquery.barrating.min.js"></script>


<div class="container">					
<h3>여기에 후기가 쫙!~</h3>
	  <table class="table table-dark table-hover">
	    <thead>
	      <tr>
	        <th>번호</th>
	        <th>영화제목</th>
	        <th>후기제목</th>
	        <th>점수</th>
	        <th>작성자</th>
	      </tr>
	    </thead>
				
<!-- 			<tbody>	 -->
<%-- 			<%for (HugiVO d : list) {%> --%>
<%-- 				<tr onclick="modal_show(<%=d.getNo() %>)">	 --%>
<%-- 					<td><%=d.getNo() %></td> --%>
<%-- 					<td><%=d.getM_name() %></td> --%>
<%-- 					<td><%=d.getTitle() %></td> --%>
<%-- 					<td><%if(d.getGrade()==1){%> --%>
<!-- 						★ -->
<%-- 						<%}else if(d.getGrade()==2){ %> --%>
<!-- 						★★ -->
<%-- 						<%}else if(d.getGrade()==3){ %> --%>
<!-- 						★★★ -->
<%-- 						<%}else if(d.getGrade()==4){ %> --%>
<!-- 						★★★★ -->
<%-- 						<%}else {%> --%>
<!-- 						★★★★★ -->
<%-- 						<% } %> --%>
<!-- 					</td> -->
<%-- 					<td><%=d.getName() %></td> --%>
<!-- 				</tr>	 -->
<%-- 			<% } %>	 --%>
<!-- 			</tbody> -->
	
		</table>
		
	<!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">영화 후기 보기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
       
            <div class="form-group">
              <label for="m_tit">영화제목:</label>
              <input type="text" class="form-control" id="m_tit" placeholder="영화제목" name="m_tit" readonly>
              <input type="hidden" id="mv_num" value="">
            </div>
            <div class="form-group">
              <label for="name">작성자:</label>
              <input type="text" class="form-control" id="name" placeholder="작성자" name="name" readonly>
              <input type="hidden" id="mb_num" value="">
            </div>
           <div class="form-group">
              <label for="h_tit">후기 제목:</label>
              <input type="text" class="form-control" id="h_tit" placeholder="후기제목" name="h_tit" readonly>
            </div>
    
            <div class="form-group">
              <label for="hugi">후기 내용:</label>
              <textarea class="form-control" rows="5" id="hugi" name="hugi" readonly></textarea>
            </div>
            

        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" id="update_btn">수정하기</button>
          <button type="button" class="btn btn-danger" id="del_btn">삭제하기</button>
          <button type="button" class="btn btn-danger" id="close_modal">Close</button>
        </div>
        
      </div>
	</div>
	</div>
 <!-- The Modal --> 
</div>				

</div>					
<script>
function modal_show (num) {
    $("#myModal").modal("show");
//     alert(num);

    $.post("hugidetail.nhn",
            {
    			mv_num:	num
            }, function(data, status){
            	console.log(data);
            	$("#m_tit").val(data.M_name);
            	$("#name").val(data.name);
            	$("#h_tit").val(data.title);
            	$("#hugi").val(data.content);
//             	if (data.trim() == "ok") {
//             		alert("후기가 저장 되었습니다.");
//             		location.reload();   // 페이지 새로고침
//             	} else {
//             		alert("저장에 실패 했습니다.\n관리자에게 문의");
//             	}
            });
    
}
$(document).ready(function(){
    $("#close_modal").click(function() {
        $("#myModal").modal("hide");
    });
});

</script>
</body>
</html>