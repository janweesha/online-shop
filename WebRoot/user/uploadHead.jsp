<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>客户关系系统主页</title>
  </head>
  
  <body>
  	<form action="${pageContext.request.contextPath}/uploadHead.action" method="post"enctype="multipart/form-data">
 		<table>
 			<tr>
 				<td id="localImg"><img id="preview" width="100px" height="100px" style="diplay:none"></td>
 			</tr>
 			<tr>
 				<td>头像上传</td>
 				<td><input type="file" name="uploadFile" id="file" onchange="showImage();"></td>
 			</tr>
 			<tr>
 				<td>
 					<input type="submit" value="上传头像"/>
 				</td>
 				<td>
 					<font color="red"  style="font-size: 10px;font-style: italic;">
 					${requestScope.errorMsg}
 					</font>
 					<font color="green"  style="font-size: 10px;font-style: italic;">
    				${requestScope.successMsg}
    				</font>
 				</td>
 			</tr>
 		</table>     
     </form>
     <script type="text/javascript">
    function showImage() {
        var docObj = document.getElementById("file");
        var imgObjPreview = document.getElementById("preview");
        if (docObj.files && docObj.files[0]) {
            //火狐下，直接设img属性  
            imgObjPreview.style.display = 'block';
            imgObjPreview.style.width = '100px';
            imgObjPreview.style.height = '100px';
            //imgObjPreview.src = docObj.files[0].getAsDataURL();  
            //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式  
            imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
        } else {
            //IE下，使用滤镜  
            docObj.select();
            var imgSrc = document.selection.createRange().text;
            var localImagId = document.getElementById("localImg");
            //必须设置初始大小  
            localImagId.style.width = "100px";
            localImagId.style.height = "100px";
            //图片异常的捕捉，防止用户修改后缀来伪造图片 
            try {
                localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                localImagId.filters
                        .item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
            } catch (e) {
                alert("您上传的图片格式不正确，请重新选择!");
                return false;
            }
            imgObjPreview.style.display = 'none';
            document.selection.empty();
        }
        return true;
    }
</script>
  </body>
</html>
