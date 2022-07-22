<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>requestForm1.jsp - request 객체 예제</h1>
	<!-- 
	form 태그
	1) action 속성 : submit 시 폼 태그 내의 파라미터(폼파라미터)를 모두 request 객체에 저장한 뒤
	                 action 속성에 지정된 페이지(또는 파일)로 이동
	                 ex) submit 버튼 클릭 시 requestPro1.jsp 페이지로 이동
	2) method 속성 : 
	   - GET 방식 : method="get" 또는 하이퍼링크 또는 URL 직접 입력하여 이동할 경우
	     => 한글 처리를 위해서는 문서 캐릭터셋을 UTF-8 방식으로 변경해야함
	        (Window - Preferences - Web - JSP Files 메뉴에서 Encoding 부분을 UTF-8 로 변경)
	        => 변경 시 <meta charset="UTF-8"> 추가되며 JSP page 디렉티브에도 추가됨 
	   - POST 방식 : method="post" 를 지정할 경우
	     => 한글 처리를 위해서는 request 객체의 setCharacterEncoding() 메서드를 호출하여
	        "UTF-8" 문자열을 파라미터로 전달해야함
	-->
	<form action="requestPro1.jsp" method="get">
<!-- 		<form action="requestPro1.jsp" method="post"> -->
		<table >
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" required="required"></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="age" required="required"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<!-- lable 태그의 for 속성값과 폼태그 요소의 id 속성값이 같으면 레이블 클릭 시 해당 항목 클릭됨 -->
					<label for="gender_male">남</label><input type="radio" id="gender_male" name="gender" value="male" required="required">
					<label for="gender_female">여</label><input type="radio" id="gender_female" name="gender" value="female" required="required">
				</td>
			</tr>
			<tr>
				<td>취미</td>
				<td>
					<label for="hobby_book">독서</label><input type="checkbox" id="hobby_book" name="hobby" value="독서">
					<label for="hobby_game">게임</label><input type="checkbox" id="hobby_game" name="hobby" value="게임">
					<label for="hobby_tv">TV시청</label><input type="checkbox" id="hobby_tv" name="hobby" value="TV시청">
				</td>
			</tr>
			<tr>
				<!-- submit 버튼("전송") 생성 => 클릭 시 requestPro1.jsp 페이지로 이동함 -->
				<td colspan="2"><input type="submit" value="전송"></td>
			</tr>
		</table>
	</form>
</body>
</html>