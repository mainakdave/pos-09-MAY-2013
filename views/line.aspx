﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="line.aspx.cs" Inherits="POS.views.line" MasterPageFile="~/views/masterPage.Master" %>

<%@ Register src="~/piczardUserControls/simpleImageUploadUserControl/SimpleImageUpload.ascx" tagname="SimpleImageUpload" tagprefix="ccPiczardUC" %>



<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

    <script type="text/javascript">

        var IU = 'I';
        var ID = -1;
        var isDelete = false;

        $(document).ready(function () {

            // positioning alertBox
            $("#alertBox").css("top", $(window).outerHeight() / 2);
            $("#alertBox").css("left", $(window).outerWidth() / 2);


            /*
            var IU = 'I';
            var ID = -1;
            var isDelete = false;
            */



            $("#btnCancel").click(function () {
                //alert(document.forms[0].name);
                //var theForm = document.forms['#departmentForm'];

                //document.getElementById("departmentForm").submit()
                //document.forms[0].submit();

                clearAllElements();
                return false;
            });



            $("#submit").click(function () {



                //$("#<%=Button1.ClientID %>").click();

                if (window.IU == 'I') {


                    $.post("../Ajax/line.aspx",
                        {
                            brandID: $('#<%=brandDrplst.ClientID %>').val(),
                            lineName: $("#lineName").val(),
                            description: $("#description").val(),
                            createDate: '',
                            createUser: '-1',
                            modifyUser: '-1',
                            StatementType: 'Insert'
                        },

                        function (response) {
                            //alert(response);
                            //PageMethods.SendForm(response);
                            //PageMethods.saveImage(response);

                            //alert("Data inserted...");
                            $(document).trigger("add-alerts", [
                                {
                                    'message': "Data inserted...",
                                    'priority': 'success'
                                }
                              ]);

                            clearAllElements();
                        }
                    );

                    return false;
                }
                else if (window.IU == 'U') {


                    $.post("../Ajax/line.aspx",
                        {
                            brandID: $('#<%=brandDrplst.ClientID %>').val(),
                            lineID: window.ID,
                            lineName: $("#lineName").val(),
                            description: $("#description").val(),
                            modifyUser: '-1',
                            StatementType: 'Update'
                        },

                        function (response) {
                            //alert(response);
                            //PageMethods.SendForm(response);
                            //PageMethods.saveImage(window.ID);
                            window.IU = 'I';

                            //alert("Data updated...");
                            $(document).trigger("add-alerts", [
                                {
                                    'message': "Data updated...",
                                    'priority': 'success'
                                }
                              ]);

                            clearAllElements();
                        }
                    );

                    return false;
                }
            });


        });


        function updateRow(brandID, lineID, lineName, description) {
            if (!window.isDelete) {
                //alert(id);
                //$("#deptName").val(id);
                window.IU = 'U';
                window.ID = lineID;

                $("#<%=brandDrplst.ClientID %>").val(brandID);
                $("#lineID").val(lineID);
                $("#lineName").val(lineName);
                $("#description").val(description);


                //args = id + "," + deptName + "," + description
                //__doPostBack("id", id);
                //return false;


            }
        }


        function deleteRow(brandID, lineID) {
            window.isDelete = true;

            if (confirm('Sure To Delete?')) {
                $.post("../Ajax/line.aspx",
                    {
                        brandID: brandID,
                        lineID: lineID,
                        StatementType: 'Delete'
                    },

                    function (response) {
                        //alert(response);
                        //PageMethods.SendForm(response);
                        //PageMethods.saveImage(window.ID);

                        //alert("Data deleted...");
                        $(document).trigger("add-alerts", [
                                {
                                    'message': "Data deleted...",
                                    'priority': 'error'
                                }
                              ]);
                    }
                );
            } else {
                // Do nothing!
            }

            //clearAllElements();
            return false;
        }

        function clearAllElements() {
            window.IU = 'I';
            window.ID = -1;
            window.isDelete = false;

            $('#<%=brandDrplst.ClientID %>').val(-1);
            $("#lineName").val(null);
            $("#description").val(null);


        }
    </script>

</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <div id="alertBox" data-alerts="alerts"  data-fade="3000"></div>


    <div class="navbar">
        <div class="navbar-inner">
            <ul class="nav">
                <li><a href="department.aspx">Department</a></li>
                <li class="divider-vertical"></li>
                <li><a href="section.aspx">Section</a></li>
                <li class="divider-vertical"></li>
                <li><a href="family.aspx">Family</a></li>
                <li class="divider-vertical"></li>
                <li><a href="brand.aspx">Brand</a></li>
                <li class="divider-vertical"></li>
                <li class="active"><a href="line.aspx">Line</a></li>
            </ul>
            </div>
    </div>

        <div class="row-fluid">
            <div class="span6">
                <form class="navbar-form pull-left" id="lineForm" action="line.aspx">

                    <asp:ScriptManager runat="server" ID="ScriptManager1" EnablePageMethods="true">
                            </asp:ScriptManager>  

                    <div id="line">
                <table>
                    <tr>
                        <td><label>Brand Name</label></td>
                        <td><asp:DropDownList ID="brandDrplst" runat="server"></asp:DropDownList></td>
                    </tr>

                    <tr>
                        <td><label>Line Name</label></td>
                        <td><input id="lineName" type="text" placeholder="Line Name" class="span2" /></td>
                    </tr>

                    <tr>
                        <td><label>Description</label></td>
                        <td><input id="description" type="text" placeholder="Description" class="span2" /></td>
                    </tr>

                    <tr>
                        <td></td>
                        <td>
                            

                            <div id="submit" class="btn" >Submit</div>
                            <asp:Button ID="Button1" runat="server" class="btn" Text="Button" Visible="false"/>
                            <div id="btnCancel" class="btn" >Cancel</div>
                            
                        </td>
                    </tr>                  
                                   <!-- Item Name -->
                </table>
            
                 
            
                

                
            
                <!-- Item Image -->
           </div>

                </form>
            </div>

            <div class="span6">

            <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Always">
                <ContentTemplate>

                    <asp:Panel ID="Panel1" ScrollBars="Vertical" Height="300" runat="server">
                        <asp:ListView ID="lstvLine" runat="server" >
            <LayoutTemplate >
                <table class="table table-condensed">
                    <tr>
                        <td style="background:#00ffff; font-size:medium">Line Name List</td>
                    </tr>
                    <tr>
                        <td><asp:PlaceHolder id="itemPlaceholder" runat="server" /></td>
                    </tr>
                </table>
            </LayoutTemplate>

            <ItemTemplate>
                <tr onmouseup="updateRow(<%#Eval("brandID") %>, <%#Eval("lineID") %>, '<%#Eval("lineName") %>', '<%#Eval("description ") %>')">
                    <td>
                        <asp:Label ID="lblDeptID" runat="Server" Text='<%#Eval("lineID") %>' />
                    </td>

                    <td>
                        <asp:Label ID="lblDeptName" runat="Server" Text='<%#Eval("lineName") %>' />
                    </td>

                    <td class="btn btn-danger btn-mini"  onmouseup="deleteRow(<%#Eval("brandID") %>, <%#Eval("lineID") %>)" style="cursor:pointer">Delete</td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
                    </asp:Panel>

                </ContentTemplate>
            </asp:UpdatePanel>

            </div>
        </div>
                    
        
                
                 
        
       
                


        
       
        

        
</asp:Content>



