<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="start.aspx.cs" Inherits="wz_ass_02.start" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
<head runat="server">
    <title></title>
         <link rel="stylesheet" href="~/css/style.css" type="text/css"/>
    <link rel="stylesheet" href="~/css/demo.css" type="text/css"/>
     
    
    <!-- Font Awesome CSS -->
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css' />
    

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" type="text/css"/>
 

     <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

 
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <script type="text/javascript">

        $(function () {
            let id;
            $.ajax({
                type: "GET",
                url: "https://localhost:44340/api/Values",
                async: false,
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    //console.log(r);
                    $("#ddl_proj").empty();
                    $("#ddl_proj").append("<option value='0'>--select--</option>");                                        
                    $.each(r, function (key, value) {
                        id = value.ProjectId;
                        //console.log(id);
                        //console.log(value.ProjectId, value.ProjectName);
                        $("#ddl_proj").append($("<option></option>").val(value.ProjectId).html(value.ProjectName));

                    });

                }
            });

        });

        $(function () {
            $("#btnnext").click(function () {
                
                $('.nav-pills a[href="#menu1"]').tab('show')                
                var i = 1;
                var issueid = ""
                var temparr = [];
                $("#tbllist > tbody  > tr").each(function (key) {
                    var issue;
                    ky = key + 1;
                    var chk = "#" + ky;
                    var hid = "#hid_" + ky;
                    if ($(chk).prop('checked')) {                        
                        issueid = $(hid).val();
                        temparr.push(issueid)                        
                    }
                    
                    
                });
                //console.log(temparr);
                //$.ajax({
                //    type: "GET",
                //    url: `https://localhost:44340/api/Values/${item}`,
                //    async: false,
                //    data: '{}',
                //    contentType: "application/json; charset=utf-8",
                //    dataType: "json",
                //    success: function (r) {

                //    }
                //});
                $.ajax({
                    type: "GET",
                    url: `https://localhost:44340/api/DisType`,
                    async: false,
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        //console.log(r);
                        $("#txtstatus").empty();
                        $("#txtstatus").append("<option value=''>--select Type--</option>");
                        $.each(r, function (key, value) {
                            //console.log(value.type);
                            //console.log(value.ProjectId, value.ProjectName);
                            $("#txttype").append($(`<option></option>`).html(value.type));

                        });

                    }
                });
                $.ajax({
                    type: "GET",
                    url: `https://localhost:44340/api/DisStatus`,
                    async: false,
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        $("#txtstatus").empty();
                        $("#txtstatus").append("<option value=''>--select Status--</option>");
                        $.each(r, function (key, value) {
                            //console.log(value.status);
                            //console.log(value.ProjectId, value.ProjectName);
                            $("#txtstatus").append($(`<option></option>`).html(value.status));

                        });

                    }
                });                
                $.ajax({
                    type: "GET",
                    url: `https://localhost:44340/api/DisSubType`,
                    async: false,
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        //console.log(r);
                        $("#txtsubtype").empty();
                        $("#txtsubtype").append("<option value=''>--select Status--</option>");
                        $.each(r, function (key, value) {
                            //console.log("sub" + value.subtype);
                            //console.log(value.ProjectId, value.ProjectName);
                            $("#txtsubtype").append($(`<option></option>`).html(value.subtype));

                        });

                    }
                });                
                $.ajax({
                    type: "GET",
                    url: `https://localhost:44340/api/DisRepBy`,
                    async: false,
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        $("#txtreportedby").empty();
                        $("#txtreportedby").append("<option value=''>--select Status--</option>");
                        $.each(r, function (key, value) {
                            //console.log("sub" + value);
                            //console.log(value.ProjectId, value.ProjectName);
                            $("#txtreportedby").append($(`<option></option>`).html(value.EmployeeName));

                        });

                    }
                });



            });
        });
       
        $(document).ready(function () {
            $("#ddl_proj").on("change", function () {
                var item = $("#ddl_proj option:selected").val();
                //console.log(item);
                //var url = "https://localhost:44340/api/Values/"+item;
                var issdata = [];
                $.ajax({
                    type: "GET",
                    url: `https://localhost:44340/api/Values/${item}`,
                    async: false,
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        //console.log(r);                        
                        $.each(r, function (key, value) {
                            var ky = key + 1;
                            var hid = "hid_" + ky;
                            //console.log(value.IssueID, value.Summary, value.Description, value.Type, value.SubType, value.Status, value.Priority, value.Severity);
                            var chkbox = `<input type="checkbox" data-id="${value.IssueID}" id="${ky}" class="chk_items chk${ky}" /> <input type="hidden" value="${value.IssueID}" id="${hid}" class="chk_items chk${ky}" />`
                            issdata.push([value.IssueID, value.Summary, value.Description, value.Type, value.SubType, value.Status, value.Priority, value.Severity, chkbox]);                            
                        });
                    }
                });
                $("#tbllist").DataTable({
                    data: issdata,
                    "bDestroy": true
                })
                console.log($("#tbllist_filter").html());
                
            });
            
        });


        
        //$(function () {
        //    $("#btnnext1").click(function () {
                
        //        $('.nav-pills a[href="#menu2"]').tab('show')
        //        var i = 1;
        //        var issueid = ""
        //        console.log($("#txtstatus").val(), $("#txttype").val(), $("#txtsubtype").val(), $("#txtreportedby").val(), $("#txtreporteddate").val());
        //        $("#tbllist > tbody  > tr").each(function () {   
                   
        //            var issue;
                    
        //            var chk = "#" + i;
        //            var hid = "#hid_" + i;
        //            if ($(chk).prop('checked')) {
                        //var ddlstatus = $("#txtstatus").val();
                        //var ddltype = $("#txttype").val();
                        //var ddlsubtype = $("#txtsubtype").val();
                        //var ddlreportedby = $("#txtreportedby").val();
        //                var ddlreporteddate = $("#txtreporteddate").val() + " " + $("#txtreportedtime").val();

        //                issueid = $(hid).val();
        //                console.log(ddlstatus, ddltype, ddlsubtype, ddlreportedby, ddlreporteddate)
        //                $.ajax({
        //                    type: 'POST',
        //                    url: "https://localhost:44340/api/UpdateIssue?Type=" + ddltype + "&SubType=" + ddlsubtype + "&Status=" + ddlstatus + "&ReportedBy=" + ddlreportedby + "&ReportedDate=" + ddlreporteddate + "&IssueIDS=" + issueid + "",
        //                    contentType: "application/json; charset=utf-8",
        //                    data: {
                                
        //                    },
        //                    async: false,
        //                    success: function (response) {
        //                        alert(response);
        //                        if (response != null && response.d != null) {
        //                            alert(response.d);
        //                        }
        //                    },
        //                    error: function (XMLHttpRequest, textStatus, errorThrown) {
        //                       // alert(errorThrown);
        //                    }
        //                });
        //            }
        //            i++;
        //        });
        //        alert("Updated succesfully");
        //        $('.nav-pills a[href="#home"]').tab('show')
        //    });
        //});

        $(function () {
            $("#btnnext1").click(function () {

                $('.nav-pills a[href="#menu2"]').tab('show')
                var i = 1;
                var issueid = ""

                $("#tbllist > tbody  > tr").each(function () {


                    var issue;
                    var chk = "#" + i;
                    var hid = "#hid_" + i;
                    if ($(chk).prop('checked')) {


                        issueid += $(hid).val() + ",";


                    }
                    i++;
                });

                var ddlstatus = $("#txtstatus").val();
                var ddltype = $("#txttype").val();
                var ddlsubtype = $("#txtsubtype").val();
                var ddlreportedby = $("#txtreportedby").val();
                var ddlreporteddate = $("#txtreporteddate").val() + " " + $("#txtreportedtime").val();

                $.ajax({
                    type: 'POST',
                    url: "https://localhost:44340/api/UpdateIssue?Type=" + ddltype + "&SubType=" + ddlsubtype + "&Status=" + ddlstatus + "&ReportedBy=" + ddlreportedby + "&ReportedDate=" + ddlreporteddate + "&IssueIDS=" + issueid + "",
                    contentType: "application/json; charset=utf-8",
                    //dataType: 'json',

                    // data: "Type=a&SubType=b&Status=s&ReportedBy=rishi&ReportedDate=2024/01/11&IssueIDS=1",
                    data: {
                        //"Type": txttype,
                        //"SubType": txtsubtype,
                        //"Status": txtstatus,
                        //"ReportedBy": txtreportedby,
                        //"ReportedDate": txtreporteddate,
                        //"IssueIDS": issueid
                    },


                    async: false,
                    success: function (response) {
                        alert(response);
                        if (response != null && response.d != null) {
                            alert(response.d);
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(errorThrown);
                        alert(textStatus);
                        console.log(data);
                        // console.log(data);
                    }
                });
                alert("Updated succesfully");
                $('.nav-pills a[href="#home"]').tab('show')
            });
        });






    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <ul class="nav nav-pills" style="width: 100%">
                <li class="active"><a data-toggle="pill" href="#home">Step 1</a></li>
                <li><a data-toggle="pill" href="#menu1">Step 2</a></li>
                <li><a data-toggle="pill" href="#menu2">Step 3</a></li>
            </ul>


            <div class="tab-content">
                <div id="home" class="tab-pane fade in active" style="padding: 20px;">

                    <div>
                        <asp:DropDownList ID="ddl_proj" runat="server">
                            <asp:ListItem Value="">Please Select</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div>
                        <table class="table table-bordered table-striped" id='tbllist'>
                            <thead class="bg-dark text-white">
                                <tr>
                                    <td>IssueID</td>
                                    <td>Summary</td>
                                    <td>Description</td>
                                    <td>Type</td>
                                    <td>SubType</td>
                                    <td>Status</td>
                                    <td>Priority</td>
                                    <td>Severity</td>
                                    <td>Action</td>


                                </tr>
                            </thead>
                            <tbody>
                            </tbody>

                        </table>

                        <br />
                         <a href="#" id="btnnext" class="btn btn-default">Next</a>
                    </div>

                </div>




                <div id="menu1" class="tab-pane fade">
                    <div class="container body-content">
                        <div class="form-horizontal">

                            <div class="form-group">
                                <div class="col-md-2">
                                    Type
                                </div>
                                <div class="col-md-10">
                                    <%--<asp:TextBox runat="server" ID="txttype" CssClass="form-control"></asp:TextBox>--%>
                                    <asp:DropDownList ID="txttype" runat="server">
                                        <asp:ListItem Text="------Select Type------" />
                                    </asp:DropDownList>
                                </div>
                                </div>


                                <div class="form-group">
                                    <div class="col-md-2">
                                        Sub Type
                                    </div>
                                    <div class="col-md-10">
                                        <%--<asp:TextBox runat="server" ID="txtsubtype" CssClass="form-control">  </asp:TextBox>--%>
                                        <asp:DropDownList ID="txtsubtype" runat="server">
                                        <asp:ListItem Text="------Select Sub Type------" />
                                    </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-2">
                                        Status
                                    </div>
                                    <div class="col-md-10">
                                        <%--<asp:TextBox runat="server" ID="txtstatus" CssClass="form-control">
                                        </asp:TextBox>--%>
                                        <asp:DropDownList ID="txtstatus" runat="server">
                                        <asp:ListItem Text="------Select Status------" />
                                        </asp:DropDownList>

                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-2">
                                        Reported by
                                    </div>
                                    <div class="col-md-10">
                                        <%--<asp:TextBox runat="server" ID="txtreportedby" CssClass="form-control">
                                        </asp:TextBox>--%>
                                        <asp:DropDownList ID="txtreportedby" runat="server">
                                        <asp:ListItem Text="------Select Reported by------" />
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-2">
                                        Reported Date
                                    </div>
                                    <div class="col-md-10">
                                           
                                          <input type="date" id="txtreporteddate" />

                                    </div>
                                </div>



                                <div class="form-group">
                                    <div class="col-md-2">
                                        Reported Time
                                    </div>
                                    <div class="col-md-10">
                                           
                                          <input type="time" id="txtreportedtime" />

                                    </div>
                                </div>





                                <div class="form-group">
                                    <%-- <asp:Button runat="server" Text="update" ID="btnnext1" CssClass="btn btn-default"/>--%>
                                    <%-- <button  id="btnnext1" class="btn btn-secondary" >Update</button>--%>
                                    <a href="#" id="btnnext1" class="btn btn-secondary">Update</a>
                                </div>
                            </div>
                        
                    </div>
                </div>

                <div id="menu2" class="tab-pane fade">
                    Updating
                </div>
            </div>
        </div>
    </form>


    <%--<script src='https://code.jquery.com/jquery-3.7.0.js'></script>--%>
    <%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>--%>
    <script src='https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js'></script>
    <script src='https://cdn.datatables.net/responsive/2.1.0/js/dataTables.responsive.min.js'></script>
    <script src='https://cdn.datatables.net/1.13.5/js/dataTables.bootstrap5.min.js'></script>

    <%--<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>--%>
    <style type="text/css">
        #tbllist_filter {
            margin-bottom: 1%;
        }

    </style>
    <%--<script>
        //$().addClass
        
    </script>--%>

    <!-- Script JS -->
    <script src="./js/script.js"></script>
    <!--$%analytics%$-->
</body>
</html>
