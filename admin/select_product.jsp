<%
String username_naja_a = String.valueOf(session.getAttribute("username_naja")); 
String status_naja = String.valueOf(session.getAttribute("status")); 
String check_free_status = String.valueOf(session.getAttribute("status1")); 
if(status_naja.equals("admin")){%>
<%@page pageEncoding="UTF-8"%>
<%@ include file="../connect.jsp"%>
<%
String pid_naja=request.getParameter("pid_naja");
String sName=request.getParameter("sName");
int p1=0;
ResultSet pro_id1 = null;
ResultSet res_pid_naja = null;
ResultSet res_stmt_brand1 = null;
ResultSet res_stmt_cat1 = null;
ResultSet res_stmt_rub1 = null;
try{
	 request.setCharacterEncoding("UTF-8");
	 Statement stmt_cat = connection.createStatement();
	 String sql_cat="";
	 String sql="";
	 sql_cat="select * from product";
		if (sName!=null){
			sql="Select * from product where pro_id like '"+'%'+sName+'%'+"' or pro_name like '"+'%'+sName+'%'+"'";
		}
		else{
		sql="select * from product";
		}
	    pro_id1=stmt_cat.executeQuery(sql);
		Statement stmt_brand = connection.createStatement();
	    String sql_brand="";
		sql_brand="select * from brand";
	    res_stmt_brand1=stmt_brand.executeQuery(sql_brand);
	
	Statement stmt_cat33 = connection.createStatement();
	String sql_cat1="";
	sql_cat1="select * from category";
	res_stmt_cat1=stmt_cat33.executeQuery(sql_cat1);

	Statement stmt_rub = connection.createStatement();
	String sql_rub="";
	sql_rub="select * from rubber_face";
	res_stmt_rub1=stmt_rub.executeQuery(sql_rub);
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
	   <div class="col-md-offset-3 col-sm-5 col-md-7">
				</div>
            <div class="row">
				  
                <div class="col-md-offset-2  col-sm-6 col-md-9">
				<h2>จัดการสินค้า</h2>
                    <div class="media services-wrap wow fadeInDown">
					<div class="col-md-offset-8 col-md-5">
					<form method="post" action="" class="form-inline">
						<input class="form-control"type="text" name="sName"  placeholder="ค้นหา">
						<input class="btn btn-sm w3-green" type="submit" value="ค้นหา">
					</form>
					</div>
				
					<table class="table">
					<tr>
					<td bgcolor="#ffcc99">รหัสสินค้า</td>
					<td bgcolor="#ffcc99">ชื่อสินค้า</td>
					<td bgcolor="#ffcc99">รหัสประเภท</td>
					<td bgcolor="#ffcc99">รหัสหน้ายาง</td>
					<td bgcolor="#ffcc99">ราคา</td>
					<td bgcolor="#ffcc99">รูป</td>
					<td bgcolor="#ffcc99">สถานะ</td>
					<td bgcolor="#ffcc99">จัดการ</td>
					</tr>
					<% while(pro_id1.next()){%>
                        
							<tr>
							<td><%=(pro_id1.getString("pro_id"))%>
                        </td>
						<td><%= (pro_id1.getString("pro_name"))%>
						</td>
						<td><%= (pro_id1.getString("cat_id"))%>
						</td>
						<td><%= (pro_id1.getString("rub_id"))%>
						</td>
						<td><%=(pro_id1.getString("price"))%>
                        </td>
						<td><%= (pro_id1.getString("image"))%>
						</td>
						<td><%= (pro_id1.getString("status"))%>
						</td>
<td>
<a href="select_product.jsp?pid_naja=<%= (pro_id1.getString("pro_id"))%>"><i class="fa fa-pencil" style="font-size:20px;color:#660000;"></i></a>

						<a href="../product/delete.jsp?id=<%= (pro_id1.getString("pro_id"))%>" onclick="return confirm('คุณแน่ใจหรือไม่ที่จะลบข้อมูล?');"><i class="fa fa-trash-o" style="font-size:20px;color:red;"></i></a>
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
		<input type="text" name="b" value="<%= pid_naja%>">		<input class="btn btn-success" type="button" name="test"id="test"value="test">

		<h3>kkljlk</h3>  ajax-->
	</form>
	</section><!--/#feature-->
		<%
	String sql_pid_naja=null;
	String bd=null;
	 if(pid_naja!=null){
	 Statement stmt_pid_naja = connection.createStatement();
	 sql_pid_naja="select * from product where pro_id='"+pid_naja+"'";
	 res_pid_naja=stmt_pid_naja.executeQuery(sql_pid_naja);
	 res_pid_naja.next();
	 bd=res_pid_naja.getString("pro_id");
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
                  <form class="form-horizontal"action="../product/updateproduct_sql.jsp">		
                    <div class="form-group">
                        <label for="fname" class="col-sm-2 col-md-2 control-label">รหัสสินค้า:<font color="#ff0000">*</font></label>
                        <div class="col-sm-3 col-md-3">
                            <input type="hidden" class="form-control"  name="id" maxlength="250"id="name" value="<%=(res_pid_naja.getString("pro_id"))%>"><%=(res_pid_naja.getString("pro_id"))%>
                            <p id="spname"></p>
                        </div>

                        <label for="lname" class="col-sm-2 control-label">แบรน:<font color="#ff0000">*</font></label>
                        <div class="col-sm-3 col-md-3">
						<select name="b_id">
							<%while (res_stmt_brand1.next()){%>
								<option value="<%=res_stmt_brand1.getString("brand_id")%>"
	<%if (res_stmt_brand1.getString("brand_id").equals(res_pid_naja.getString("pro_name"))){
								out.print("selected");
								}%>>
								<%=res_stmt_brand1.getString("brand_name")%></option>
							<%}%>
                        </select>
						</div>

                    </div>

                    <div class="form-group">
                        <label for="line" class="col-sm-2 control-label">ประเภท</label>
                        <div class="col-sm-3">
                            <select name="cat_id">
							<%while (res_stmt_cat1.next()){%>
						<option  value="<%=res_stmt_cat1.getString("cat_id")%>"
			<%if (res_stmt_cat1.getString("cat_id").equals(res_pid_naja.getString("cat_id"))){
								out.print("selected");
								}%>>
								<%=res_stmt_cat1.getString("cat_name")%></option>
							<%}%>
                        </select>                        </div>
						<label for="facebook" class="col-sm-2 control-label">หน้ายาง</label>
                        <div class="col-sm-3">
            <select name="rub_id">
							<%while (res_stmt_rub1.next()){%>
						<option  value="<%=res_stmt_rub1.getString("rub_id")%>"
			<%if (res_stmt_rub1.getString("rub_id").equals(res_pid_naja.getString("rub_id"))){
								out.print("selected");
								}%>>
								<%=res_stmt_rub1.getString("rub_name")%></option>
							<%}%>
                        </select>                       
                        </div>
                    </div>


 <div class="form-group">
                        <label for="phone" class="col-sm-2 control-label">ราคา</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="phone" name="price" value="<%=(res_pid_naja.getString("price"))%>"maxlength="250">
                        </div>
                    </div>



                    <div class="form-group">
                        <label for="address" class="col-sm-2 control-label">รูป:<font color="#ff0000">*</font></label>
                        <div class="col-sm-8">
						 <input type="text" class="form-control" id="phone" name="image"value="
						 <%=(res_pid_naja.getString("image"))%>"maxlength="250">
                           
                        </div>

                    </div>
                    <div class="modal-footer">

                        <input class="btn btn-success" type="submit" value="ตกลง">
                             <input class="btn btn btn-danger" type="button" id="up1"value="ยกเลิก">

                    </div>

                    <br>        
                </form>
				</div>
        </div>
		<%}//ปิด if ตึ๋ง%>
	<%@ include file="../product/frominsertproduct.jsp"%>
	<%//@ include file="../product/fromeditproduct.jsp"%>
	<%//@ include file="insert_basket.jsp"%>
	<%//@ include file="../footer.jsp"%>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script>
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
  </body>
</html>
 <%}//ปิดelse บนสูดๆๆๆๆๆๆๆ ตึ๋งเองจะใครล่ะ*/
  else{%>
  <meta http-equiv="refresh" content="0; url=../index.jsp">
  <%
  }%>