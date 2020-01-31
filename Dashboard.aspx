<%@ Page Title="" Language="C#" MasterPageFile="~/MainTheme.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="PMSI.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Dashboard</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="~/css/Home.css">
    <link rel="stylesheet" href="~/css/bootstrap.css">
    <form id="ProjectForm" runat="server" method="post" >
<div class="content-container">

    <div class="container-fluid">


        <div class="main">
            <h1>COMPANY NAME</h1>

            <div class="project-table">
                <div class="project-image">
                    <figure><img src="/images/folder2.png" alt="sing up image" width="200" height="200"></figure>
                    <h1>Projects Assigned</h1>
                </div>
             <div class="table table-hover">
  
                   
                <asp:GridView ID="GvProjectAssigned" runat="server"  AutoGenerateColumns="false" CssClass="table table-hover" Width="600px" HorizontalAlign="Center">

                    <Columns>  
                        <asp:BoundField DataField="P_Name" HeaderText=" Project Name" />
                        <asp:BoundField DataField="P_Key" HeaderText="Project Key" />
                        <asp:BoundField DataField="P_Cat" HeaderText="Type" />
                        <asp:BoundField DataField="AssignBy" HeaderText="Assigned By" />
                        
                          <asp:TemplateField ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:LinkButton ID="lnkDownload" runat="server" Text="Download" OnClick="DownloadFile"
                    CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

</div> 

            </div>
            </div>
      <div class ="main">
            <br />
            <div class="project-table">
                <div class="project-image">
                    <figure><img src="/images/bug2.png" alt="Bug_img" width="200" height="200"></figure>
                    <h1>Open Bugs</h1>
                </div>
             <div class="table table-hover">
  
                   
                <asp:GridView ID="GvOpenBugs" runat="server"  AutoGenerateColumns="false" CssClass="table table-hover" Width="600px" HorizontalAlign="Center">

                    <Columns>
                        <asp:BoundField DataField="B_Title" HeaderText=" Bug/Issue Title" />
                        <asp:BoundField DataField="B_P_Key" HeaderText="Project Name/Key" />
                        <asp:BoundField DataField="B_Type" HeaderText="Type" />
                        <asp:BoundField DataField="B_AssignBy" HeaderText="Assigned By" />
                        <asp:BoundField DataField="B_Desc" HeaderText="Description" />
                        <asp:BoundField DataField="B_Priority" HeaderText="Priority" />

                          <asp:TemplateField ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:LinkButton ID="lnkDownload1" runat="server" Text="Download" OnClick="DownloadFileBug"
                    CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

</div> 

            </div>
          </div>
        </div>

</div>
    
        </form>
</asp:Content>
