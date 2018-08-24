<%
String username_naja_a = String.valueOf(session.getAttribute("username_naja")); 
String status_naja = String.valueOf(session.getAttribute("status")); 
String check_free_status = String.valueOf(session.getAttribute("status1")); 
if(status_naja.equals("admin")){%>
    <!-- Bootstrap -->
 <!--    <link href="../css/bootstrap.min.css" rel="stylesheet">
    	<link rel="stylesheet" href="../css/font-awesome.min.css">
    	<link href="../css/animate.min.css" rel="stylesheet">
    <link href="../css/prettyPhoto.css" rel="stylesheet">      
    	<link href="../css/main.css" rel="stylesheet">
    	 <link href="../css/responsive.css" rel="stylesheet">
    	 <link href="../css/w3.css" rel="stylesheet">
    	 <meta name="viewport" content="width=device-width, initial-scale=1">
     <link href="../css/bootstrap.min.css" rel="stylesheet">  -->
<%@page pageEncoding="UTF-8"%>
<%@ include file="../connect.jsp"%>
<%
String cid=request.getParameter("cid");
String sName=request.getParameter("sName");
int p1=0;
ResultSet cat_id = null;
ResultSet res_cid = null;
try{
	 request.setCharacterEncoding("UTF-8");
	 Statement stmt_cat = connection.createStatement();
	 String sql_cat="";
	 String sql="";
	 sql_cat="select * from category";
		if (sName!=null){
			sql="Select * from category where cat_id like '"+'%'+sName+'%'+"' or cat_name like '"+'%'+sName+'%'+"'";
		}
		else{
		sql="select * from category";
		}
	    cat_id=stmt_cat.executeQuery(sql);

}
 catch (Exception ex){
	out.println("connected error : "+ex);	
 }
 %>

	 <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    

	<section id="services" class="service-item">
	   <div class="container">
	   <div class="col-md-offset-3 col-sm-5 col-md-4">
				</div>
            <div class="row">
				  
                <div class="col-md-offset-3  col-sm-6 col-md-6">
				<h2>จัดการประเภทสินค้า</h2>
                    <div class="media services-wrap wow fadeInDown">
					<div class="col-md-offset-6 col-md-8">
					<form method="post" action="" class="form-inline">
						<input class="form-control"type="text" name="sName"  placeholder="ค้นหา">
						<input class="btn btn-sm w3-green" type="submit" value="ค้นหา">
					</form>
					</div>
					<%
	String sql_cid=null;
	String bd=null;
	 if(cid!=null){
	 Statement stmt_cid = connection.createStatement();
	 sql_cid="select * from category where cat_id='"+cid+"'";
	 res_cid=stmt_cid.executeQuery(sql_cid);
	 res_cid.next();
	 bd=res_cid.getString("cat_id");
	 %>
<style>
div.absolute {
    position: absolute;
    top: 80px;
    right: 0;
    }
</style>
	    <div class="modal-dialog absolute" id="mm" role="document" >
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" id="up" class="close" data-dismiss="modal-dialog" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="ebrand">แก้ไขข้อมูล</h4>
                </div>
                <br>
                <form class="form-horizontal"action="../category/updatecategory_sql.jsp" >		
                    <div class="form-group">
                        <label for="fname" class="col-sm-2 col-md-2 control-label">รหัส:</label>
                        <div class="col-sm-3 col-md-3">
                            <input type="hidden" class="form-control"  name="id" maxlength="250"id="name" value="<%=(res_cid.getString("cat_id"))%>"><%=(res_cid.getString("cat_id"))%>
                            <p id="spname"></p>
                        </div>

                        <label for="lname" class="col-sm-2 control-label">ชื่อ:<font color="#ff0000">*</font></label>
                        <div class="col-sm-3 col-md-3">
                            <input type="text" class="form-control" id="surname" name="name" value="<%=(res_cid.getString("cat_name"))%>" maxlength="250"id="surname">
                            <p id="spsurname">
                        </div>

                    </div>

                    <div class="modal-footer">
                        <input class="btn btn-success" type="submit" id="ok"value="ตกลง">
						 <input class="btn btn-success" type="button" id="up1"value="ยกเลิก">
                    </div>

                    <br>        
                </form>
            </div>
        </div>
		<%}//ปิด if ตึ๋ง%>
					<table class="table">
					<tr>
					<td bgcolor="#ffcc99">รหัสประเภทสินค้า</td>
					<td bgcolor="#ffcc99">ชื่อประเภทสินค้า</td>
					<td bgcolor="#ffcc99">จัดาการข้อมูล</td>
					</tr>
					<% while(cat_id.next()){%>
                        
							<tr>
							<td><%= (cat_id.getString("cat_id"))%>
                        </td>
						<td><%= (cat_id.getString("cat_name"))%>
						</td>
						<td>
						

<a href="select_category.jsp?cid=<%= (cat_id.getString("cat_id"))%>"><i class="fa fa-pencil" style="font-size:20px;color:#660000;"></i></a>


						<a href="../category/delete.jsp?id=<%= (cat_id.getString("cat_id"))%>" onclick="return confirm('คุณแน่ใจหรือไม่ที่จะลบข้อมูล?');"><i class="fa fa-trash-o" style="font-size:20px;color:red;"></i></a>
                        </td>
						</tr>
						

<%
}
%>
</table>
<a type="" class=" col-md-offset-6 col-md-5 btn btn-sm w3-indigo"data-toggle="modal" data-target="#brand"><font color="#ffffff"size="3">เพิ่มข้อมูล</font></a>
</div>
</div>
</div>
<!--
	<form method="post" action="">
		<input type="text" name="b" value="<%= cid%>">		<input class="btn btn-success" type="button" name="test"id="test"value="test">

		<h3>kkljlk</h3>  ajax-->
	</form>
	</section><!--/#feature-->
	<%@ include file="../category/frominsertcategory.jsp"%>
	<%@ include file="../category/fromeditcategory.jsp"%>
	<%//@ include file="insert_basket.jsp"%>
	<%//@ include file="../footer.jsp"%>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <!-- <script>
  $(document).ready(function(){
    $("#up").click(function(){
  		//alert("ooo");
         $("#mm").toggle();
    });
  	$("#up1").click(function(){
  		//alert("ooo");
         $("#mm").toggle();
    });
  });
  </script>
   -->  </body>
</html>
  <%}//ปิดelse บนสูดๆๆๆๆๆๆๆ ตึ๋งเองจะใครล่ะ*/
  else{%>
  <meta http-equiv="refresh" content="0; url=../index.jsp">
  <%
  }%>