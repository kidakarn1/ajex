<%@ page import="java.sql.*" %> 
<%@page pageEncoding="UTF-8"%>
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">    <body>
      <div class="modal fade" id="ebrand" tabindex="-1" role="dialog" aria-labelledby="ebrand">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="ebrand">แก้ไขข้อมูล</h4>
                </div>
                <br>
                <form class="form-horizontal"action="../category/updatecategory_sql.jsp" >		
                    <div class="form-group">
                        <label for="fname" class="col-sm-2 col-md-2 control-label">รหัสประเภท:<font color="#ff0000">*</font></label>
                        <div class="col-sm-3 col-md-3">
                            <input type="text" class="form-control"  name="id" maxlength="250"id="name">
                            <p id="spname"></p>
                        </div>

                        <label for="lname" class="col-sm-2 control-label">ชื่อประเภท:<font color="#ff0000">*</font></label>
                        <div class="col-sm-3 col-md-3">
                            <input type="text" class="form-control" id="surname" name="name" maxlength="250"id="surname">
                            <p id="spsurname">
                        </div>

                    </div>

                    <div class="modal-footer">

                        <input class="btn btn-success" type="submit" value="ตกลง">
                         <button type="close" class="btn btn-danger"class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">ยกเลิก</button>

                    </div>

                    <br>        
                </form>

            </div>
        </div>
    </div>
    </body>
</html>