<%@ Page Title="" Language="C#" MasterPageFile="~/MainTheme.Master" AutoEventWireup="true" CodeBehind="AddPeople.aspx.cs" Inherits="PMSI.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>People</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <link rel="stylesheet" href="~/css/Home.css">
    <link rel="stylesheet" href="~/css/bootstrap.css">
     <form id="login_form" runat="server" method="POST"  >
<div class="content-container">

    <div class="container-fluid">


        <div class="main">
            <h1>COMPANY NAME</h1>

            <div class="table table-hover">
                
                      <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i>Enter UserName To Add A colleague:</label>
                                <asp:TextBox ID="TxtCollName" runat="server" ForeColor="Black" PlaceHolder="Enter UserName to Add colleague"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtCollName" ForeColor="Red" runat="server" ErrorMessage="Field Required!"></asp:RequiredFieldValidator>
                                </div>
                   <div class="form-group form-button">
                                          <asp:Button ID="BtnAddColl" runat="server" Text="Add Colleague" OnClick="AddColl" Class="form-submit" />
                            <br />
                                <asp:Label ID="lblerror" runat="server" ForeColor="Red"></asp:Label>
                            </div>
                
                    <h3>People</h3>
                
                <br />
                <br />
                <br />
                <br />
             

                <asp:GridView ID="GvColl" runat="server" AutoGenerateColumns="false" CssClass="table table-hover" Width="80px" HorizontalAlign="Center">
                    
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText=" Collauge Name" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="Designation" HeaderText="Designation" />
                         <asp:BoundField DataField="UserColl" HeaderText="CollaugeUSerName" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>

    </div>
</div>
         </form>
</asp:Content>
