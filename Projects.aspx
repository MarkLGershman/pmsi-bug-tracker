<%@ Page Title="" Language="C#" MasterPageFile="~/MainTheme.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="PMSI.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Projects</title>
</asp:Content>
           
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" href="~/css/Home.css">
    <link rel="stylesheet" href="~/css/bootstrap.css">
   
<form id="ProjectForm" runat="server" method="post" >
    <div class="content-container">

        <div class="container-fluid">

            
            <div class="main">
 
                <h1>PROJECTS UPLOADED</h1>
                <button type="button" onclick="showForm()" id="showbtn" class="form-submit"><span class="css-j8fq0c"><span class="css-t5emrf">Create project</span></span></button>
                <asp:GridView ID="GvProject" runat="server" PagerStyle-Width="60%" AutoGenerateColumns="false" CssClass="table table-hover" Width="80px" HorizontalAlign="Center">

                    <Columns>
                        <asp:BoundField DataField="P_Name" HeaderText=" Project Name" />
                        <asp:BoundField DataField="P_Key" HeaderText="Project Key" />
                        <asp:BoundField DataField="P_Cat" HeaderText="Type" />
                        <asp:BoundField DataField="P_AssignTo" HeaderText="Assigned To" />
                    </Columns>
                </asp:GridView>

            

        </div>
        <div class="project-form" id="p_form" style="display:none;">
                <fieldset>
                    <legend>Project Data</legend>
                    <div class="form-group">
                          <label for="Project Name"></label>
                                <asp:TextBox ID="TxtPName" runat="server" ForeColor="Black" PlaceHolder="Project Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtPName" ForeColor="Red" runat="server" ErrorMessage="Field Required!"></asp:RequiredFieldValidator>
                                </div>
                    
                    <br/>
                    <div class="form-group">
                          <label for="Project Key"></label>
                                <asp:TextBox ID="TxtPKey" runat="server" ForeColor="Black" PlaceHolder="Project Key"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TxtPKey" ForeColor="Red" runat="server" ErrorMessage="Field Required!"></asp:RequiredFieldValidator>
                                </div>
                    <br/>
                                <div class="form-group">
                                <label for="Project Type"><i style="width:50px;" ></i></label>
                                <asp:DropDownList ID="ProjectTypeList" runat="server">
                                        <asp:ListItem Enabled="true" Text="Select Type" Value="-1"></asp:ListItem>

                                    <asp:ListItem value="DesktopApp">Desktop Application</asp:ListItem>
                                    <asp:ListItem value="AndroidApp">Android Application</asp:ListItem>
                                    <asp:ListItem value="WebApp">Web Application</asp:ListItem>
                                    <asp:ListItem value="Graphical">Graphic Work</asp:ListItem>
                                </asp:DropDownList>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="ProjectTypeList" ForeColor="Red" runat="server" ErrorMessage="Field Required!" InitialValue="-1"></asp:RequiredFieldValidator>        </div>
                
                                <div class="form-group">
                                <label for="Assign To"><i style="width:50px;" ></i></label>
                                <asp:DropDownList ID="AssignToList" runat="server">
                                        <asp:ListItem Enabled="true" Text="Select Type" Value="-1"></asp:ListItem>

                                                                  </asp:DropDownList>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="AssignToList" ForeColor="Red" runat="server" ErrorMessage="Field Required!" InitialValue="-1"></asp:RequiredFieldValidator>        </div>
                 <br/>
                    <div class="form-group">
                          <label for="Project Description"></label>
                                <asp:TextBox ID="TxtDes" runat="server" TextMode="MultiLine" Columns="20" Rows="10" ForeColor="Black" PlaceHolder="Project Description"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TxtDes" ForeColor="Red" runat="server" ErrorMessage="Field Required!"></asp:RequiredFieldValidator>
                                </div>
                    <br/>
                    <div class="form-group">
                          <label for="Project File"></label>
                        <asp:FileUpload ID="ProjectFile" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="ProjectFile" ForeColor="Red" runat="server" ErrorMessage="Field Required!"></asp:RequiredFieldValidator>
                                </div>
                     <div class="form-group form-button">
                                          <asp:Button ID="BtnProject" runat="server" Text="Add Project" Width="150px"  Class="form-submit" OnClick="AddProject" />
                            <br />
                                <asp:Label ID="lblerror" runat="server" ForeColor="Red"></asp:Label>
                            </div>
                        </fieldset>
          
        </div>

    </div>
    </div>
    </form>
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js">
    </script>

</asp:Content>
