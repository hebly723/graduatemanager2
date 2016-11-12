<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
  <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
  <script src="http://malsup.github.io/jquery.form.js"></script>
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
	 $.ajax({
		 type:'post',
		 url:'<%=basePath%>updateActivity.action',
		 contentType:'application/json;charset=utf-8',
		 data:'{"acId":4,"acCreId":"1133710501","acCreDate":"1916-8-17 9:9","acDueDate":"2016-8-19 9:9","acTitle":"测试活动哈哈哈","acDesc":"测试测试","acDocId":"34132412","acDoc1Name":"文件1"}',
		 success:function(data){
			 alert(data);
		 }
		 
	 });
 }
 function saveReport() {
	// jquery 表单提交
	$("#showDataForm").ajaxSubmit(function(data) {
	// 对于表单提交成功后处理，message为提交页面saveReport.htm的返回内容
	});
 	
	return false; // 必须返回false，否则表单会自己再做一次提交操作，并且页面跳转
	}
 function ceshi(){
	 $.ajax({
		 type:'post',
		 url:'<%=basePath%>ceshi.action',
		 contentType:'application/json;charset=utf-8',
		 data:'{"userId":"1233433","userPassword":"3344trt"}',
		 success:function(data){
			 alert("成功");
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
    <form id="showDataForm"  enctype="multipart/form-data" action="<%=basePath %>activityFileUpload.action?acId=4" method="post" ">
 		<input name="file" type="file">  
	    <input type="submit" value="上传文件"> 
	</form> 
	<h1>测试活动</h1>
    <input type="button"  value="更新活动数据" onclick="requestactivity()">
    <h1>测试文件下载</h1>
    <a href="<%=basePath %>activityfileDownload.action?fileName=QQ截图20160712195042.png&acDocId=0e1d8833-1bb8-4b98-a01e-821981f271f1" >下载</a>
     <h1>测试</h1>
    <input type="button"  value="测试数据" onclick="ceshi()">
  	<form action="<%=basePath %>loginValidation.action">
  		<input name="userId" type="text">  
  		<input name="password" type="password"> 
  		<input name="role" type="text"> 
	    <input type="submit" value="tijiao"> 
  	</form>
  </body>
</html>
