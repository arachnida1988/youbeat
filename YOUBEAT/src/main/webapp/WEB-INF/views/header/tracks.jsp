<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/beat/resources/js/calendar/calendar_beans_v2.0.js" type="text/javascript" charset="utf-8"></script>

<title>YOUBEAT - Tracks</title>

<style type="text/css">
	body {
	background: #ababab;
	}
	#tracks_main_wrap{
		padding-top:80px;
		background-color: #212121; /* 메인페이지 색 */
		color: white;
		border: 1px solid #343434;
	}
	#test_wrap{
		border: 1px red gray;
		width: 1px;
		height: 1px;	
	}
	#high_container{
		width: 1100px;
		margin: 0 auto;
	}
	.main_title_name1{
		font-size: 60px;
	}
	#tracks_search{
		width: 1100px;
		margin: 0 auto;
		position: inherit;
	}
	#block_list_image{
		position: absolute; /* block page list와 num pagelist 합침 */
	}
	#tracks_array_title{
		color: white;
	}
	#chk_calinders input{
		color: black;
	}
	#tracks_wrap{
		width: 1100px;
		height: 1300px;
		margin: 0 auto;
		line-height: 50px; /* Title 윗단 / page 번호 간격 */
	}
	.tracks_detail{
		width: 100%;
		height: 40px;
		background-color: #343434; /* 게시글 라인 색 */
		margin-bottom: 0.4em; /* 게시글 간격 */
	}
	.album{
		float: left;
		width: 50px;
		height: 40px;
	}
	.album img{
		width: 50px;
		height: 40px;
	}
	#get_playlist{
		float: left;
		width: 50px;
		height: 40px;
	}
	#get_playlist img{
		width: 50px;
		height: 40px;
	}
	._title{
		float: left;
		width: 378px;
		height: 40px;
		line-height: 35px;
		text-align: center;
	}
	._artist{
		float: left;
		width: 200px;
		height: 40px;
		line-height: 35px;
		text-align: center;
	}
	.genre{
		float: left;
		width: 200px;
		height: 40px;
		line-height: 35px;
		text-align: center;
	}
	.date{
		float: left;
		width: 150px;
		height: 40px;
		line-height: 35px;
		text-align: center;
	}
	
	.price{
		float: left;
		width: 50px;
		height: 40px;
		line-height: 35px;
		text-align: center;
	}
	.listClick, .blockClick, a{
		cursor: pointer;
	}
	#footer{
		position: fixed;
		bottom: 1px;
	}
</style>
<script type="text/javascript">
	function pageHeight(data) {
		$("#tracks_wrap").css("height",data);
	}
	$(function() {
		var startDate;
		var lastDate;
		
		var date=new Date();
		var curday=date.getFullYear();
		var month = parseInt(date.getMonth())+1;
		curday=curday+"-"+month;
		curday=curday+"-"+date.getDate();
		$("#cal2").val(curday);
		var per=25;
		var height="1300px";
		
		//앨범정렬 체크 박스 누르기
		$("#albumASC").on("click", function() {
			if($("#albumASC").val()==0){
				$("#albumASC").val("1");
			}else{
				$("#albumASC").val("0");
			}
		});
		
		//한페이지에 몇개씩보여줄지
		$(".perPageSelect").click(function() {
			per=$(this).attr("id");
			height=$(this).attr("data-src");
			$(".perPageSelect").each(function () {
				$(this).css("opacity","1");
			});
			pageHeight(height);
			$(this).css("opacity","0.5");
			$.ajax({url:"tracks", type:"post", data:{
				startDate : $("#cal1").val(),
				lastDate : $("#cal2").val(),
				albumASC : $("#albumASC").val(),
				arraytype : $("#tracks_array").val(),
				perPage : per
			}, success:function(data){
				$("#tracks_wrap").html(data);
			}});
		});
		
		//처음 페이지 뿌려주기
		$.ajax({url:"tracks", type:"post", data:{
			lastDate : $("#cal2").val(),
			arraytype : $("#tracks_array").val()
		}, success:function(data){
			$("#tracks_wrap").html(data);
		}});
		//페이지 클릭시 해당페이지 이동1
	    $("#tracks_wrap").on("click", "#pageClick", function(){
	    	var curPage = $(this).text();
			var perPage = per;
			
	 		$.ajax({url: "tracks",type:"post", data : {
				startDate : $("#cal1").val(),
				lastDate : $("#cal2").val(),
				albumASC : $("#albumASC").val(),
				arraytype : $("#tracks_array").val(),
	 			curPage : curPage,
	 			perPage : perPage
	 		}, success: function(data){
	 			$("#tracks_wrap").html(data);
	        }});
	    });
		//블럭클릭시 해당페이지 이동
	    $("#tracks_wrap").on("click", ".blockClick", function(){
	    	var curPage = $(this).attr("data-src");
			var perPage = per;
			var url = 'tracks';
	 		$.ajax({url: url,type:"post", data : {
				startDate : $("#cal1").val(),
				lastDate : $("#cal2").val(),
				albumASC : $("#albumASC").val(),
				arraytype : $("#tracks_array").val(),
	 			curPage : curPage,
	 			perPage : perPage
	 		}, success: function(data){
	 			$("#tracks_wrap").html(data);
	        }});
	    });
		$("#tracks_array").change(function() {
			var url = 'tracks';
			var perPage = per;
			alert($("#tracks_array").val());
			$.ajax({url: url,type:"post", data : {
				startDate : $("#cal1").val(),
				lastDate : $("#cal2").val(),
				albumASC : $("#albumASC").val(),
				arraytype : $("#tracks_array").val(),
				perPage : perPage
	 		}, success: function(data){
	 			$("#tracks_wrap").html(data);
	        }});
		});
	});
</script>
</head>
<body>
<div>
	<c:import url="../template/header.jsp"></c:import>
</div>
<div id="test_wrap"></div>
	<div id="tracks_main_wrap">
		<div id="high_container">
			<div class="main_title_name1">
				<h1>Track</h1>
			</div>
			
			<div id="chk_calinders">
				<input type="checkbox" id="albumASC" value="0">앨범순
					<input type="text" id="cal1">
				<input type="text" id="cal2">
			</div>
			
			<div id="tracks_partner">
				<span id="tracks_array_title">Sort By:</span>
				 <select id="tracks_array">
					<option value="dateup">Newest to Oldest</option>
					<option value="datedown">Oldest to Newest</option>
					<option value="titleup">Title A - Z</option>
					<option value="titledown">Title Z - A</option>
					<option value="genreup">Genre A - Z</option>
					<option value="genredown">Genre Z - A</option>
				</select>
			</div>
		</div>
		
			<div id="tracks_search">
				<div id="block_list_image">
					<span>Result Per Page</span>
						<img class="perPageSelect" data-src="1400px" src="/beat/resources/image/page/25.png" id="25">
								<img class="perPageSelect" data-src="2500px" src="/beat/resources/image/page/50.png" id="50">
									<img class="perPageSelect" data-src="3500px" src="/beat/resources/image/page/75.png" id="75">
								<img class="perPageSelect" data-src="4600px" src="/beat/resources/image/page/100.png" id="100">
							</div>
				</div>
		<div id="tracks_wrap">
					<!-- 메인 미들wrap -->
					<!-- ajax list get, paging--></div>
					
			
				</div>
	<div id="footer">
		<c:import url="/header/audio"></c:import>
	</div>
	<script type="text/javascript">			
			CalAddCss(); // !!제일 상단에 필수!!
			/*
				id		:텍스트박스Id   // *필수
				type	:day,mon	    // 둘중 하나입력		,기본값> 일달력 출력
				minYear :xxxx			// 최소년도 4자리 입력	,기본값> 2000
				maxYear :xxxx  			// 최대년도 4자리 입력	,기본값> 현재년도
				splitKey:'-','/'		// 달력 구분값        	,기본값> '-'
				todayYN :'y','n'		// today 표시         	,기본값> 안보여주기
				iconYN  :'y','n'		// 달력그림표시여부	  	,기본값> 안보여주기
				iconUrl :fullUrl 혹은 해당위치 상대경로 url'	,기본값> jquery 사이트 달력
			 */
			initCal({id:"cal1",type:"day",today:"y",icon:"y"});			
			initCal({id:"cal2",type:"day",today:"y",icon:"y"});
	</script>
</body>
</html>