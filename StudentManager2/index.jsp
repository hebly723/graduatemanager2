<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
  <script type="text/javascript">
 function requestjson(){
	 $.ajax({
		 type:'post',
		 url:'<%=basePath%>updateMessage.action',
		 //contentType:'application/jason;charset=utf-8',
		 data:'notId=12&notStatus=1',
		 success:function(data){
			 alert(data[2].notDet);
		 }
		 
	 });
 }
 function requestactivity(){
	 //var message=JSON.stringify([{acCreId:"1133710501",acCreDate:"1999-8-17 9:9"}]);
	 $.ajax({
		 type:'post',
		 url:'http://www.ly723.site/StudentManager2/insertActivity.action',
		 contentType:'application/json;charset=utf-8',
		 data:'{"acCreId":"1133710501","acCreDate":"1999-8-17 9:9"}',
		 //&acDueDate=2016-8-19 9:9&acTitle=测试活动&acDesc=测试测试&acDocId=34132412&acDoc1Name=文件1&acDoc2Name=文件2&acDoc3Name=文件三',
		 success:function(data){
			 alert(data);
		 }
		 
	 });
 }
 function insertmessages(){
	 var message= JSON.stringify([{notSenId:"1143710503",notRecId:"1143710501",notDet:"测试批量插入",notSenDate:"1999-04-23 09:40"}
	 ,{notSenId:"1143710501",notRecId:"1143710503",notDet:"测试批量插入",notSenDate:"1999-04-13 09:40"}]);
	 $.ajax({
		 type:'post',
		 url:'<%=basePath%>insertMessages.action',
		 contentType:'application/json;charset=utf-8',
		 data:message,
		 success:function(data){
			 alert(data[2].notDet);
		 }
		 
	 });
 }
 function ceshi(){
	 $.ajax({
		 type:'post',
		 url:'<%=basePath%>LoginValidation.action',
		 contentType:'application/json;charset=utf-8',
		 data:'{"userId":"1143710506","userPassword":"19951102","userRole":"0"}',
		 success:function(data){
			 alert("成功");
		 }
		 
	 });
 }
 function ceshi2(){
	 $.ajax({
		 type:'post',
		 url:'<%=basePath%>insertMessage.action',
		 contentType:'application/json;charset=utf-8',
		 data:'{"notSenId":"34","notRecId":"1143710506","notSenDate":"1999-8-17 9:9"}',
		 success:function(data){
			 alert("成功");
		 }
		 
	 });
 }
 function ceshi3(){
	 $.ajax({
		 type:'post',
		 url:'<%=basePath%>insertMessage.action',
		 //url:'http://www.ly723.site/StudentManager2/teacher/updateSignStatus.action',
		 contentType:'application/json;charset=utf-8',
		 data:'{"notSenId":"34","notRecId":"1143710506","notSenDate":"1999-8-17 9:9"}',
		 success:function(data){
			 alert("成功");
		 }
		 
	 });
 }
 function add(){
     var formData = new FormData($("#uploadForm")[0]);//用form 表单直接 构造formData 对象; 就不需要下面的append 方法来为表单进行赋值了。 
     $.ajax({ 
         async: false,//要求同步 不是不需看你的需求
         url : 'http://www.ly723.site/StudentManager2/boss/insertTask.action',  
         type : 'POST',  
         data : formData,  
         processData : false,  //必须false才会避开jQuery对 formdata 的默认处理   
         contentType : false,  //必须false才会自动加上正确的Content-Type 
         success : function(result) {  
                if(result==1){
                    forward=true;
                }else{
                    
                    $(".myModal-click").trigger("click");
                    forward=false;
                } 
         },  
         error : function(result) {  
             $(".myModal-click").trigger("click");
                forward=false; 
         }  
     });  
    
}
</script>
  
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
  	<h1>测试json</h1>
    <input type="button"  value="返回json数据" onclick="requestjson()">
    <h1>测试文件上传</h1>
    <form id="showDataForm"  enctype="multipart/form-data" action="<%=basePath %>fileOnTemp.action" method="post" ">
 		<input name="file" type="file">  
	    <input type="submit" value="上传文件"> 
	</form> 
	<h1>测试活动</h1>
    <input type="button"  value="插入活动数据。。。。" onclick="requestactivity()">
    <h1>测试文件下载</h1>
    <a href="<%=basePath %>activityfileDownload.action?fileName=db_operations.php&acId=37" >下载</a>
    <input type="button" value="批量插入" onclick="insertmessages()">
    <h1>测试</h1>
    <input type="button"  value="删除数据" onclick="ceshi2()">
    <h1>--------------------</h1>
	<form class="inpform" id="uploadForm" enctype="multipart/form-data">
		<div class="f-inp">
			<div>
				&#12288;<i>tasCreId：</i> <input type="text" name="tasCreId" id="tasCreId">
			</div>
			<div>
				&#12288;<i>tasCreName</i> <input type="text" name="tasCreName"id="tasCreName">
			</div>
			<div>
				&#12288;<i>tasDueId</i> <input type="text" name="tasDueId"id="tasDueId">
			</div>
			<h4>Logo</h4>
		 	<!-- <input type="file" id="file1" name="file1" />
			<input type="file" id="file2" name="file2" />
			<input type="file" id="file3" name="file3" />  -->
		</div>
	</form>
	<input type="button" value="提交" onclick="add();">
	 <h1>--------------------</h1>
	 <a href="http://www.ly723.site/StudentManager2/taskfileDownload.action?fileName=QQ截图20160730163724.png&tasId=4">文件一</a>
	 <input type="button" value="查询" onclick="ceshi2();">
	  <input type="button" value="提交22" onclick="ceshi3();">
</body>
</html>
