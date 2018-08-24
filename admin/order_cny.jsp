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
ResultSet order_id = null;
ResultSet res_cid = null;
try{
	 request.setCharacterEncoding("UTF-8");
	 Statement stmt_cat = connection.createStatement();
	 String sql_cat="";
	 String sql="";
	 sql_cat="select * from order_cny  where order_status='กำลังจัดส่ง' order by order_id asc";
		if (sName!=null){
			sql="Select * from order_cny where order_id like '"+'%'+sName+'%'+"' or pro_id like '"+'%'+sName+'%'+"' and order_status='กำลังจัดส่ง' order by order_id asc";
		}
		else{
		sql="select * from order_cny where order_status='กำลังจัดส่ง' order by order_id asc";
		}
	    order_id=stmt_cat.executeQuery(sql);

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
				<h2>การสั่งซื้อ</h2>
                    <div class="media services-wrap wow fadeInDown">
					<div class="col-md-offset-8 col-md-5">
					<form method="post" action="" class="form-inline">
						<input class="form-control"type="text" name="sName"  placeholder="ค้นหา">
						<input class="btn btn-sm w3-green" type="submit" value="ค้นหา">
					</form>
					</div>
				
					<table class="table">
					<tr>
					<td bgcolor="#ffcc99">ลำดับ</td>
					<td bgcolor="#ffcc99">รหัสสินค้า</td>
					<td bgcolor="#ffcc99">แบรน</td>
					<td bgcolor="#ffcc99">จำนวน</td>
					<td bgcolor="#ffcc99">ราคารวม</td>
					<td bgcolor="#ffcc99">รหัสสมาชิก</td>
					<td bgcolor="#ffcc99">วันที่</td>
					<td bgcolor="#ffcc99">ชำระเงิน</td>
					<td bgcolor="#ffcc99">จัดการ</td>
					</tr>
					<% while(order_id.next()){%>
                        
							<tr>
							<td><%=(order_id.getString("order_id"))%>
                        </td>
						<td><%= (order_id.getString("pro_id"))%>
						</td>
						<td><%= (order_id.getString("brand"))%>
						</td>
						<td><%= (order_id.getString("number"))%>
						</td>
						<td><%=(order_id.getString("price_sum"))%>
                        </td>
						<td><%= (order_id.getString("mem_id"))%>
						</td>
						<td><%= (order_id.getString("order_date"))%>
						</td>
						<td><a class="btn btn-sm w3-green"  href="../order/update_f.jsp?idf=<%= (order_id.getString("order_id"))%>">ชำระเงิน</td>
						<td>	
						<a href="../order/delete.jsp?id=<%= (order_id.getString("order_id"))%>" onclick="return confirm('คุณแน่ใจหรือไม่ที่จะลบข้อมูล?');"><i class="fa fa-trash-o" style="font-size:20px;color:red;"></i></a>
                        </td>
						</tr>
						

<%
}
%>
</table>
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
	 sql_cid="select * from order_cny where order_id='"+cid+"'";
	 res_cid=stmt_cid.executeQuery(sql_cid);
	 res_cid.next();
	 bd=res_cid.getString("order_id");
	 %>
<style>
div.absolute {
    position: absolute;
    top: 80px;
    right: 0;
    }
</style>
	   
		<%}//ปิด if ตึ๋ง%>
	<%//@ include file="../order_cny/frominsertorder_cny.jsp"%>
	<%//@ include file="../order_cny/fromeditorder_cny.jsp"%>
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
 <%}//ปิดelse บนสูดๆๆๆๆๆๆๆ ตึ๋งเองจะใครล่ะ*/
  else{%>
  <meta http-equiv="refresh" content="0; url=../index.jsp">
  <%
  }%>