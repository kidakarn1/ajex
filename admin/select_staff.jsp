<%
String username_naja_a = String.valueOf(session.getAttribute("username_naja")); 
String status_naja = String.valueOf(session.getAttribute("status")); 
String check_free_status = String.valueOf(session.getAttribute("status1")); 
if(status_naja.equals("admin")){%>
<%@page pageEncoding="UTF-8"%>
<%@ include file="../connect.jsp"%>
<%
String cid=request.getParameter("cid");
String sName=request.getParameter("sName");
int p1=0;
ResultSet staff_id = null;
ResultSet res_cid = null;
try{
	 request.setCharacterEncoding("UTF-8");
	 Statement stmt_cat = connection.createStatement();
	 String sql_cat="";
	 String sql="";
	 sql_cat="select * from staff";
		if (sName!=null){
			sql="Select * from staff where fname like '"+'%'+sName+'%'+"' or lname like '"+'%'+sName+'%'+"'";
		}
		else{
		sql="select * from staff";
		}
	    staff_id=stmt_cat.executeQuery(sql);

}
 catch (Exception ex){
	out.println("connected error : "+ex);	
 }
 %>
	<section id="services" class="service-item">
	   <div class="container">
	   <div class="col-md-offset-3 col-sm-5 col-md-7">
				</div>
            <div class="row">
				  
                <div class="col-md-offset-2  col-sm-6 col-md-9">
				<h2>จัดการพนักงาน</h2>
                    <div class="media services-wrap wow fadeInDown">
					<div class="col-md-offset-8 col-md-5">
					<form method="post" action="" class="form-inline">
						<input class="form-control"type="text" name="sName"  placeholder="ค้นหา">
						<input class="btn btn-sm w3-green" type="submit" value="ค้นหา">
					</form>
					</div>
				
					<table class="table">
					<tr>
					<td bgcolor="#ffcc99">รหัส</td>
					<td bgcolor="#ffcc99">ชื่อ</td>
					<td bgcolor="#ffcc99">นามสกุล</td>
					<td bgcolor="#ffcc99">ที่อยู่</td>
					<td bgcolor="#ffcc99">เบอร์โทรศัพท์</td>
					<td bgcolor="#ffcc99">เพศ</td>
					<td bgcolor="#ffcc99">การศึกษา</td>
					<td bgcolor="#ffcc99">เงินเดือน</td>
					<td bgcolor="#ffcc99">วันเข้าทำงาน</td>
					<td bgcolor="#ffcc99">จัดการ</td>
					</tr>
					<% while(staff_id.next()){%>
                        
							<tr>
							<td><%=(staff_id.getString("staff_id"))%>
                        </td>
						<td><%= (staff_id.getString("fname"))%>
						</td>
						<td><%= (staff_id.getString("lname"))%>
						</td>
						<td><%= (staff_id.getString("address"))%>
						</td>
						<td><%=(staff_id.getString("telephone"))%>
                        </td>
						<td><%= (staff_id.getString("sex"))%>
						</td>
						<td><%= (staff_id.getString("education"))%>
						</td>
						<td><%= (staff_id.getString("Salary"))%>
						</td>
						<td><%= (staff_id.getString("staff_Startdate"))%>
						</td>
						<td>

						

<a href="select_staff.jsp?cid=<%= (staff_id.getString("staff_id"))%>"><i class="fa fa-pencil" style="font-size:20px;color:#660000;"></i></a>


						<a href="../staff/delete.jsp?id=<%= (staff_id.getString("staff_id"))%>&telephone=<%=(staff_id.getString("telephone"))%>" onclick="return confirm('คุณแน่ใจหรือไม่ที่จะลบข้อมูล?');"><i class="fa fa-trash-o" style="font-size:20px;color:red;"></i></a>
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


		<%
	String sql_cid=null;
	String bd=null;
	 if(cid!=null){
	 Statement stmt_cid = connection.createStatement();
	 sql_cid="select * from staff where staff_id='"+cid+"'";
	 res_cid=stmt_cid.executeQuery(sql_cid);
	 res_cid.next();
	 bd=res_cid.getString("staff_id");
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
                <form class="form-horizontal"action="../staff/updatestaff_sql.jsp" >	
				<input type="hidden" name="id" value="<%=(res_cid.getString("staff_id"))%>">
                    <div class="form-group">
                        <label for="fname" class="col-sm-2 col-md-2 control-label">ชื่อ:<font color="#ff0000">*</font></label>
                        <div class="col-sm-3 col-md-3">
                            <input type="text" class="form-control"  name="fname" maxlength="250"id="name" value="<%=(res_cid.getString("fname"))%>">
                            <p id="spname"></p>
                        </div>

                        <label for="lname" class="col-sm-2 control-label">นามสกุล:<font color="#ff0000">*</font></label>
                        <div class="col-sm-3 col-md-3">
                            <input type="text" class="form-control" name="lname" 
							value="<%=(res_cid.getString("lname"))%>" maxlength="250"id="surname">
                            <p id="spsurname">
                        </div>

                    </div>


  <div class="form-group">
                        <label for="sex" class="col-sm-2 control-label">เพศ</label>
                        <div class="col-sm-8">
     <input type="radio"name="sex"value="ชาย"id="sex"  
	 <%if (res_cid.getString("sex").equals("ชาย")){
							out.print("checked");}%>>ชาย
	 <input  type="radio"name="sex"value="หญิง"id="sex" <%if(res_cid.getString("sex").equals("หญิง")){ 
	 out.print("checked");
	 }%>>หญิง
      
						</div>
                    </div>

                    <div class="form-group">
                        <label for="line" class="col-sm-2 control-label">การศึกษา</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="line" name="education" value="<%=(res_cid.getString("education"))%>"maxlength="250">
                        </div>
						<label for="facebook" class="col-sm-2 control-label">เงินเดือน</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="pass" name="Salay" value="<%=(res_cid.getString("Salary"))%>"maxlength="250">
                        </div>
                    </div>


 <div class="form-group">
                        <label for="phone" class="col-sm-2 control-label">เบอร์โทรศัพท์</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="phone" name="phone"value="<%=(res_cid.getString("telephone"))%>"maxlength="250">
                        </div>
                    </div>



                    <div class="form-group">
                        <label for="address" class="col-sm-2 control-label">ที่อยู่:<font color="#ff0000">*</font></label>
                        <div class="col-sm-8">
                            <textarea  class="form-control"  name="address"maxlength="1000">
	<%=(res_cid.getString("address"))%>
	</textarea>
                        </div>

                    </div>


                    <div class="form-group">
                        <label for="brithday" class="col-sm-2 control-label">วันที่เข้าทำงาน</label>
                        <div class="col-sm-8">
                            <input type="date" class="form-control" id="pass" name="brithday" value="<%=(res_cid.getString("staff_Startdate"))%>"placeholder="Birthday">
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
	<%@ include file="../staff/frominsertstaff.jsp"%>
	<%//@ include file="../staff/fromeditstaff.jsp"%>
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