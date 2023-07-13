<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String action = request.getParameter("action");//View로 부터 넘어오는 action 값

//action 값 비교해서 페이지 이동
if (action.equals("main")) {
	//메인 페이지
	//화면의 첫 페이지
} else if (action.equals("subscription")) {
	//구독 페이지
	//DB 에 저장되어있는 구독 상품의 정보 넘겨주기
} else if (action.equals("store")) {
	//상품 목록 페이지
	//DB에 저장되어있는 상품 정보 넘겨주기
} else if (action.equals("login")) {
	//로그인 페이지
	if (memberVO == null) {//회원 정보가 없다면
		out.println("<script>alert('로그인 실패...');history.go(-1);</script>");
	} else {
		session.setAttribute("", );//세션에 로그인 정보 유지
		response.sendRedirect("controller.jsp?action=main");//메인 페이지 이동, 저장할 데이터가 없기 때문에 sendRedirect 사용
	}
} else if (action.equals("logout")) {
	//로그아웃
	//로그아웃 후 메인 페이지로 이동
	session.removeAttribute("");//로그인 세션 비우기
	response.sendRedirect("controller.jsp?action=main");//메인 페이지로 이동
} 
else if (action.equals("register")) {
	//회원가입 페이지
} else if (action.equals("registerOK")) {
	//회원가입 성공 여부 페이지
	//1.회원가입 성공시 DB에 회원 정보 저장
	//2.회원가입 실패시 회원가입 실패 메시지 띄우고 이전 페이지로
	if(){//회원가입 성공이라면
		
	}else{//회원가입 실패라면
		out.println("<script>alert('회원가입 실패...'); history.go(-1);</script>");//회원 가입 화면으로
	}
} else if (action.equals("serarchID")) {
	//아이디 찾기
}else if (action.equals("serarchIDOK")) {
	//아이디 찾기 성공 여부 페이지
	//1.아이디 찾기 성공 시 서블릿 파일로 이동(아이디 문자로 보내주기)
	//2.아이디 찾기 실패시 회원가입 실패 메시지 띄우고 이전 페이지로
	if(){//아이디 찾기 성공이라면
		
	}else{//아이디 찾기 실패라면
		out.println("<script>alert('아이디를 찾을 수 없습니다.'); history.go(-1);</script>");//아이디 찾기 화면으로
	}
} 
else if (action.equals("detail")) {
	//상품 상세정보 페이지
	//DB에 저장되어 있는 상품의 상세 정보 넘겨주기
} else if (action.equals("order")) {
	//구매 페이지
	//상품 구매 & 구독 상품 구매
	//주소 API 사용 필요
} else if (action.equals("success")) {
	//구매 성공 페이지
} else if (action.equals("search")) {
	//검색 페이지
	//여기서 application 에 모든 상품 값 저장?
	//비동기 처리로 selectAll()
	//View랑 Ctrl에서 처리 예정
	//비동기 처리: 제일 먼저 실행되게함
	//단점: 프로그램이 느려짐
} else if (action.equals("result")) {
	//검색 결과 페이지
	//View에서 넘어온 검색 값 포함된 것 selectAll()넘겨주기
} else if (action.equals("cart")) {
	//장바구니 페이지
	//selectAll로 넘겨주기
	//session에 저장되어 있는 값 가져오기
}else if (action.equals("cartAdd")) {
	//장바구니에 담는 버튼
	//ArrayList()로 만들어서 session으로 세팅하기
	//새로 들어오는 값들은 add() 해주기
}
else if (action.equals("mypage")) {
	//마이페이지
} else if (action.equals("writeReview")) {
	//리뷰 작성 페이지
}else if (action.equals("changeReview")) {
	//리뷰 변경 페이지
	boardVO = boardDAO.selectOne(bVO);//현재 작성된 글 정보 가져오기
	if (bVO != null) {
		request.setAttribute("data", bVO);//data라는 이름에 현재 리뷰 정보 저장
		request.getRequestDispatcher("g_update.jsp").forward(request, response);//변경할 리뷰 정보를 유지해서 값 넘겨주기
	}
}else if(action.equals("changeReviewOK")){
	//리뷰 수정 성공
	//수정된 부분의 값을 넘겨받음
	if (boardDAO.update(boardVO)) {
		out.println("<script>alert('글 수정 성공...');");//글 정보 변경
		out.println("window.location.href = 'controller.jsp?action=main';"); // 수정후 이동할 페이지
		out.println("</script>");
	} else {

		out.println("<script>alert('변경 실패...'); history.go(-1);</script>");//회원 가입 띄위기
	}
}else if (action.equals("userEdit")) {
	//회원 정보 수정 페이지
	if (memberDAO.update(memberVO)) {//회원 정보 수정에 성공한다면
		out.println("<script>alert('회원 정보 변경 성공...');");//정보 변경 알림 보여주기
		out.println("window.location.href = 'controller.jsp?action=main';");//메인 페이지로 이동
		out.println("</script>");
	} else {//회원 정보 변경에 실패한다면
		out.println("<script>alert('변경 실패...'); history.go(-1);</script>");//회원 정보 수정 페이지로 이동
	}
}else if (action.equals("unregister")) {
	//회원 탈퇴 페이지
	if (memberDAO.delete(memberVO)) {//회원 정보 삭제에 성공한다면
		out.println("<script>alert('회원 정보 삭제 성공...');");//정보 삭제 알림 보여주기
		//삭제 성공 시 진행되어야 될 것
		//1.탈퇴한 회원의 이름을 "탈퇴한 회원" 으로 바꾸기 → 리뷰에서는 탈퇴한 회원의 이름 대신에 띄울 것.
		//2.세션에 저장된 로그인 정보를 null로 바꾸기 → 탈퇴 시 로그아웃
		out.println("window.location.href = 'controller.jsp?action=main';");//메인 페이지로 이동
		out.println("</script>");
	} else {//회원 정보 삭제에 실패한다면
		out.println("<script>alert('삭제 실패...'); history.go(-1);</script>");//회원 정보 삭제 페이지로 이동
	}
}else {
	//잘못된 파라미터로 접근
	//전 페이지로 이동
	out.println("<script>alert('action 파라미터의 값을 확인해주세요!');history.go(-1);</script>");
}
%>