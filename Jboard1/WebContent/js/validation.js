	$(function(){
   		var form = $('.register > form');
   		
   		//form의 전송버튼 (submit)을 클릭하면(전송전 최종점검)
   		form.submit(function(){
   			if(isUidOk == false){
   				alert('아이디를 확인하세요');
   				return false;
   			}
   			if(isPassOk == false){
   				alert('비밀번호를 확인하세요');
   				return false;
   			}
   			if(isNameOk == false){
   				alert('이름을 확인하세요');
   				return false;
   			}
   			if(!isNickOk){
   				alert('별명을 확인하세요');
   				return false;
   			}
   			/*
   			if(){
   				alert('이메일을 확인하세요');
   				return false;
   			}
   			if(){
   				alert('휴대폰을 확인하세요');
   				return false;
   			}
   			*/
   			//최종 모든 검증을 통과 된 후 서버로 데이터전송
   			return true;
   		});
   	});