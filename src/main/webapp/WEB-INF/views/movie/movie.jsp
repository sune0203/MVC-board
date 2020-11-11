<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../top.jsp" %>

<% if (member == null){ %>
<script> alert("로그인을 하면 이용 가능 합니다.");
location.href="/";</script>
<% }  %>


<div class="container">

</div>

<h3>영화 랭킹 출력</h3>
<div id="result"></div>

 <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">영화 후기 작성</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
       
            <div class="form-group">
              <label for="m_tit">영화제목:</label>
              <input type="text" class="form-control" id="m_tit" placeholder="영화제목" name="m_tit" disabled="disabled">
               <input type="hidden" id="mv_num" value="">
            </div>
            <div class="form-group">
              <label for="name">작성자:</label>
              <input type="text" class="form-control" id="name" placeholder="작성자" name="name" readonly="readonly">
               <input type="hidden" id="mb_num" value="">
            </div>
           <div class="form-group">
              <label for="h_tit">후기제목:</label>
              <input type="text" class="form-control" id="h_tit" placeholder="후기제목" name="h_tit">
              
            </div>
            
            <div>
            <label for="grade_L">별점:</label><br>
			<select id="grade" name="grade" class="custom-select" style="max-width: 120px;" value="">
		    <option value="1" selected>★</option>
		    <option value="2">★★</option>
		    <option value="3">★★★</option>
		    <option value="4">★★★★</option>
            <option value="5">★★★★★</option>
			</select>
            </div>
            <br>
    
            <div class="form-group">
              <label for="hugi">후기 작성:</label>
              <textarea class="form-control" rows="5" id="hugi" name="hugi"></textarea>
              
            </div>
            

        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary" id="okBtn">작성완료</button>
          <button type="button" class="btn btn-danger" id="close_modal">Close</button>
        </div>
        
      </div>
	</div>
	</div>
 <!-- The Modal -->
</div>  
<script>

function modal_show (num) {
    $("#myModal").modal("show");
	//사용자에게 보여주는 값 셋팅
    var title = $("#mv"+num).val();
    $("#m_tit").val(title); //영화 제목	
    $("#name").val('<%=member.getName() %>'); //작성자

	//데이터 넘길 때 값 셋팅
	$("#mv_num").val(num); //영화번호
	$("#mb_num").val(<%=member.getNum() %>); //유저번호
}

$(document).ready(function(){
    $("#close_modal").click(function() {
        $("#myModal").modal("hide");
    });
    
    $("#okBtn").click(function() {
    	 var m_tit = $("#mv_num").val(); //영화제목
    	 var name = $("#mb_num").val(); //이름
    	 var h_tit = $("#h_tit").val(); //후기제목
    	 var hugi = $("#hugi").val(); //후기
    	 var grade = $("#grade").val();
    	 console.log(m_tit);
    	 console.log(name);
    	 console.log(h_tit);
    	 console.log(hugi);
    	 console.log(grade);
    	 
    	  $.get("{pageContext.request.contextPath}/movie/hugi",
    	  {
    		  mv_num: m_tit,
    		  mb_num: name,
    		  h_tit: h_tit,
    		  hugi: hugi,
    		  grade: grade
    	  
    	  },function(data, status){
          	if (data.trim() == "ok") {
        		alert("후기가 저장 되었습니다.");
        		location.reload();   // 페이지 새로고침
        	} else {
        		alert("저장에 실패 했습니다.\n관리자에게 문의");
        	}
    	  });
    });
    
	var search = $("#search").val();
	$("#result").html("여기에 찍히나: " + search);
	console.log(search);
	
    $.get("${pageContext.request.contextPath}/movie/getmv",
    function(data, status){
    	var html = "";
    	console.log(data);
//     	console.log(data.items);
    	$.each(data, function(key, field){
    		console.log(key);	
    		console.log(field);	
    		html += "<img src='" + field.img + "'><br>";
    		html += field.title + "<br>";
    		html += field.dir + "<br>";
    		html += field.act + "<br>";
    		html += "<input type='hidden' id ='mv"+field.num+"' value='" + field.title + "'>";
//     		html += '<button type="button" class="btn btn-success" onclick="modal_show(\'' + field.title +'\')">후기작성</button><br>>';
    		html += '<button type="button" class="btn btn-success" onclick="modal_show(' + field.num +')">후기작성</button><br>>';
//     		html += '<button type="button" class="btn btn-success">후기작성</button><br>';
          });
		$("#result").html(html);
    });
});
</script>
</body>
</html>