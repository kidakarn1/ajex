<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Gp Bootstrap Template</title>

    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="../css/font-awesome.min.css">
	<link href="../css/animate.min.css" rel="stylesheet">
    <link href="../css/prettyPhoto.css" rel="stylesheet">      
	<link href="../css/main.css" rel="stylesheet">
	 <link href="../css/responsive.css" rel="stylesheet">
	 <link href="../css/w3.css" rel="stylesheet">
	 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="../css/bootstrap.min.css" rel="stylesheet"> 
<%@page pageEncoding="UTF-8"%>
<%@ include file="../connect.jsp"%>
<%
String bid=request.getParameter("bid");
String sName=request.getParameter("sName");
int p1=0;
ResultSet cat_id = null;
ResultSet res_bid = null;
try{
	 request.setCharacterEncoding("UTF-8");
	 Statement stmt_cat = connection.createStatement();
	 String sql_cat="";
	 String sql="";
	 sql_cat="select * from brand";
		if (sName!=null){
		sql="Select * from brand where brand_id like '"+'%'+sName+'%'+"' or brand_name like '"+'%'+sName+'%'+"'";
		}
		else{
		sql="select * from brand";
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
    
  </head>
   <body class="homepage">   
	<header id="header">
        <nav class="navbar navbar-fixed-top" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html">คลีนิคยางยนต์ 	 <%//=nub_product.getInt("p")%><%//=nub_yang.getInt("pn")%></a>
                </div>
				
                <%@ include file="menu_admin.jsp" %>
            </div><!--/.container-->
        </nav><!--/nav-->
		
    </header><!--/header-->

	<section id="services" class="service-item">
	   <div class="container">
	   <div class="col-md-offset-3 col-sm-5 col-md-4">
				</div>
            <div class="row">
				  
                <div class="col-md-offset-3  col-sm-6 col-md-6">
				<h2>จัดการแบรนสินค้า</h2>
                    <div class="media services-wrap wow fadeInDown">
					<div class="col-md-offset-6 col-md-8">
					<form method="post" action="" class="form-inline">
						<input class="form-control"type="text" name="sName"  placeholder="ค้นหา">
						<input class="btn btn-sm w3-green" type="submit" value="ค้นหา">
					</form>
					</div>
					<%
	String sql_bid=null;
	String bd=null;
	 if(bid!=null){
	 Statement stmt_bid = connection.createStatement();
	 sql_bid="select * from brand where brand_id='"+bid+"'";
	 res_bid=stmt_bid.executeQuery(sql_bid);
	 res_bid.next();
	 bd=res_bid.getString("brand_id");
	 %>
<style>
div.absolute {
    position: absolute;
    top: 80px;
    right: 0;
    }
</style>
	    <div class="modal-dialog absolute" id="up" role="document" >
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal-dialog" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="ebrand">แก้ไขข้อมูล</h4>
                </div>
                <br>
                <form class="form-horizontal"action="../brand/updatebrand_sql.jsp" >		
                    <div class="form-group">
                        <label for="fname" class="col-sm-2 col-md-2 control-label">รหัสแบรน:<font color="#ff0000">*</font></label>
                        <div class="col-sm-3 col-md-3">
                            <input type="text" class="form-control"  name="id" maxlength="250"id="name" value="<%=(res_bid.getString("brand_id"))%>">
                            <p id="spname"></p>
                        </div>

                        <label for="lname" class="col-sm-2 control-label">ชื่อแบรน:<font color="#ff0000">*</font></label>
                        <div class="col-sm-3 col-md-3">
                            <input type="text" class="form-control" id="surname" name="name" value="<%=(res_bid.getString("brand_name"))%>" maxlength="250"id="surname">
                            <p id="spsurname">
                        </div>

                    </div>

                    <div class="modal-footer">
                        <input class="btn btn-success" type="submit" value="ตกลง">
						 <input class="btn btn-success" type="button" id="up"value="ยกเลิก">
                    </div>

                    <br>        
                </form>
            </div>
        </div>
		<%}//ปิด if ตึ๋ง%>
					<table class="table">
					<tr>
					<td bgcolor="#ffcc99">รหัสแบรน</td>
					<td bgcolor="#ffcc99">ชื่อแบรน</td>
					<td bgcolor="#ffcc99">จัดาการข้อมูล</td>
					</tr>
					<% while(cat_id.next()){%>
                        
							<tr>
							<td><%= (cat_id.getString("brand_id"))%>
                        </td>
						<td><%= (cat_id.getString("brand_name"))%>
						</td>
						<td>
						

<a href="select_brand.jsp?bid=<%= (cat_id.getString("brand_id"))%>"><i class="fa fa-pencil" style="font-size:20px;color:#660000;"></i></a>


						<a href="../brand/delete.jsp?id=<%= (cat_id.getString("brand_id"))%>" onclick="return confirm('คุณแน่ใจหรือไม่ที่จะลบข้อมูล?');"><i class="fa fa-trash-o" style="font-size:20px;color:red;"></i></a>
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
	<form method="post" action="">
		<input type="text" name="b" value="<%= bid%>">		<input class="btn btn-success" type="button" name="test"id="test"value="test">

		<h3>kkljlk</h3>
	</form>
	</section><!--/#feature-->
	<%@ include file="../brand/frominsertbrand.jsp"%>
	<%@ include file="../brand/fromeditbrand.jsp"%>
	<%//@ include file="insert_basket.jsp"%>
	<%@ include file="../footer.jsp"%>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.prettyPhoto.js"></script>
    <script src="../js/jquery.isotope.min.js"></script>   
    <script src="../js/wow.min.js"></script>
	<script src="../js/main.js"></script>
  <script>
$(document).ready(function(){
    $("#up").click(function(){
		//alert("ooo");
        $(this).hide();
    });
	$("input[name=test]").click(function(){
		//alert("ooo");
		var b = $("input[name=b]").val()
		var c = $("input[name=b]").val()
	
		//$.post(`../brand/insertbrand_sql.jsp?b=${b}`).done()
debugger
	let obj = {
		b: b,
		c: c
	}

	$.post('../brand/testi.jsp', obj, function(res){
		debugger
			//document.querySelector('h3').text = res.message;
		$('h3').text(res.message);
		let [b, c] = [res.data.b, res.data.c];
	
		let td = `
			<tr>
				<td>` + b + `</td>
				<td> ` + c + ` </td>
				<td>
					<a href="select_brand.jsp?bid=">
						<i class="fa fa-pencil"				  style="font-size:20px;color:#660000;">
						</i>
					</a>

					<a href="../brand/delete.jsp?id=` + b + ` " onclick="return confirm('คุณแน่ใจหรือไม่ที่จะลบข้อมูล?');"><i class="fa fa-trash-o" style="font-size:20px;color:red;"></i></a>
                </td></tr>`;

		$('table tbody').append( td );
	}, 'json')
	.fail(function(e){
		console.log(e.responseText);
	})



    });
});
</script>
  </body>
</html>
