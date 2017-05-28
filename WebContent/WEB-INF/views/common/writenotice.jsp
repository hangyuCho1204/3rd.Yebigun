<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Insert title here</title>

<script type="text/javascript"
   src="/3rd.Yebigun/SE2.8.2.O4259f59/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
   function _onSubmit(elClicked) {
      oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

      // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
      document.getElementById("content").value
      try {
         elClickedObj.form1.submit();
      } catch (e) {
      }
   }
</script>
</head>
<body>
<div style="margin-left: 18%;">
<textarea name="content" id="content" rows="22"
                  style="width: 1000px;"></textarea>
               <script type="text/javascript">
                  var oEditors = [];
                  $(function() {
                     nhn.husky.EZCreator
                           .createInIFrame({
                              oAppRef : oEditors,
                              elPlaceHolder : "content",
                              //SmartEditor2Skin.html 파일이 존재하는 경로
                              sSkinURI : "/3rd.Yebigun/SE2.8.2.O4259f59/SmartEditor2Skin.html",
                              htParams : {
                                 // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
                                 bUseToolbar : true,
                                 // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
                                 bUseVerticalResizer : false,
                                 // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
                                 bUseModeChanger : true,
                                 fOnBeforeUnload : function() {

                                 }
                              },
                              fOnAppLoad : function() {
                                 //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
                                 oEditors.getById["content"].exec(
                                       "PASTE_HTML", ['']);
                              },
                              fCreator : "createSEditor2"
                           });
                     $("#save")
                           .click(
                                 function() {
                                    if ($('#title').val().length == 0) {
                                       alert("제목을 입력해주세요");
                                    } else {
                                       oEditors.getById["content"]
                                             .exec(
                                                   "UPDATE_CONTENTS_FIELD",
                                                   []);
                                       $("#form1").submit();
                                    }

                                 })

                  });
               </script>
               </div>
	</br>
	</br>
	<DIV align="center" style="margin-right: 20%;">
		<button id="write" style="font-size:24px"><i class="fa fa-edit">등록</i></button>
		<button id="write" style="font-size:24px">취소</i></button>
	</DIV>
</body>
</html>