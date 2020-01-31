<%@ Page Title="" Language="C#" MasterPageFile="~/MainTheme.Master" AutoEventWireup="true" CodeBehind="Bugs.aspx.cs" Inherits="PMSI.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Bugs</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" href="~/css/Home.css">
    <link rel="stylesheet" href="~/css/bootstrap.css">
   
<form id="ProjectForm" runat="server" method="post" >
    <div class="content-container">

        <div class="container-fluid">

            
            <div class="main">
 
                <h1>Bugs/Issues Reported By Me</h1>
                <button type="button" onclick="showForm()" id="showbtn" class="form-submit"><span class="css-j8fq0c"><span class="css-t5emrf">Report Bug/Issue</span></span></button>
                <asp:GridView ID="GvBugs" runat="server"  AutoGenerateColumns="false" CssClass="table table-hover" Width="70%" HorizontalAlign="Center">

                    <Columns>
                        <asp:BoundField DataField="B_Title" HeaderText=" Bug/Issue Title" />
                        <asp:BoundField DataField="B_P_Key" HeaderText="Project Name/Key" />
                        <asp:BoundField DataField="B_Type" HeaderText="Type" />
                        <asp:BoundField DataField="B_AssignTo" HeaderText="Assigned To" />
                        <asp:BoundField DataField="B_Desc" HeaderText="Description" />
                        <asp:BoundField DataField="B_Priority" HeaderText="Priority" />


                    </Columns>
                </asp:GridView>

            

        
        <div class="project-form" id="p_form" style="display:none;">
                <fieldset>
                    <legend>Bug/Issue Data</legend>
                    <div class="form-group">
                          <label for="Bug Title"></label>
                                <asp:TextBox ID="TxtBName" runat="server" ForeColor="Black" PlaceHolder="Issue Title"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtBName" ForeColor="Red" runat="server" ErrorMessage="Field Required!"></asp:RequiredFieldValidator>
                                </div>
                    
                    <br/>
                           <div class="form-group">
                                <label for="Bug Type"><i style="width:50px;" ></i></label>
                                <asp:DropDownList ID="BugTypeList" runat="server">
                                        <asp:ListItem Enabled="true" Text="Select Type" Value="-1"></asp:ListItem>

                                    <asp:ListItem value="Task">Task</asp:ListItem>
                                    <asp:ListItem value="CodeBug">Code Bug</asp:ListItem>
                                    <asp:ListItem value="Epic">Epic</asp:ListItem>
                                    <asp:ListItem value="G_Changes">Graphical Changes</asp:ListItem>
                                </asp:DropDownList>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="BugTypeList" ForeColor="Red" runat="server" ErrorMessage="Field Required!" InitialValue="-1"></asp:RequiredFieldValidator>        </div>
                
                           <div class="form-group">
                                <label for="Bug Priority"><i style="width:50px;" ></i></label>
                                <asp:DropDownList ID="BugPrioriyList" runat="server">
                                        <asp:ListItem Enabled="true" Text="Select Prioriy" Value="-1"></asp:ListItem>

                                    <asp:ListItem value="1_Hightest">highest</asp:ListItem>
                                    <asp:ListItem value="2_High">High</asp:ListItem>
                                    <asp:ListItem value="3_Medium">Medium</asp:ListItem>
                                    <asp:ListItem value="4_Low">Low</asp:ListItem>
                                </asp:DropDownList>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="BugPrioriyList" ForeColor="Red" runat="server" ErrorMessage="Field Required!" InitialValue="-1"></asp:RequiredFieldValidator>        </div>
          <br />
                              <div class="form-group">
                          <label for="Bug/Issue Description"></label>
                                <asp:TextBox ID="TxtDes" runat="server" TextMode="MultiLine" Columns="10" Rows="3" ForeColor="Black" PlaceHolder="Bug/Issue Description"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TxtDes" ForeColor="Red" runat="server" ErrorMessage="Field Required!"></asp:RequiredFieldValidator>
                                </div>
                    <br />
                              <div class="form-group">
                                <label for="Assign To">Select UserName<i style="width:50px;" ></i></label>
                                <asp:DropDownList ID="AssignToList" runat="server">
                                        <asp:ListItem Enabled="true" Text="Select User" Value="-1">Select User</asp:ListItem>

                                                                  </asp:DropDownList>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="AssignToList" ForeColor="Red" runat="server" ErrorMessage="Field Required!" InitialValue="-1"></asp:RequiredFieldValidator>        </div>
                 <br/>
                     <div class="form-group">
                                <label for="Bug Status"><i style="width:50px;" ></i></label>
                                <asp:DropDownList ID="BugStatusList" runat="server">
                                        <asp:ListItem Enabled="true" Text="Select Status" Value="-1"></asp:ListItem>

                                    <asp:ListItem value="Complete">Solved</asp:ListItem>
                                    <asp:ListItem value="UnSolved">UnSolved</asp:ListItem>
                                  
                                </asp:DropDownList>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="BugStatusList" ForeColor="Red" runat="server" ErrorMessage="Field Required!" InitialValue="-1"></asp:RequiredFieldValidator>        </div>
          <br />
                    <div class="form-group">
                                <label >Select Project Name<i style="width:50px;" ></i></label>
                                <asp:DropDownList ID="B_PList" runat="server">
                                        <asp:ListItem Enabled="true" Text="Select Project" Value="-1">Select Project</asp:ListItem>

                                                                  </asp:DropDownList>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="B_PList" ForeColor="Red" runat="server" ErrorMessage="Field Required!" InitialValue="-1"></asp:RequiredFieldValidator>        </div>
                 <br/>   
                      
          
                    <div class="form-group">
                          <label for="Project File"></label>
                        <asp:FileUpload ID="BugFile" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="BugFile" ForeColor="Red" runat="server" ErrorMessage="Field Required!"></asp:RequiredFieldValidator>
                                </div>
                     <div class="form-group form-button">
                                          <asp:Button ID="BtnBug" runat="server" Text="Reprot Bug" Width="150px"  CssClass="form-submit" OnClick="AddBug" />
                            <br />
                                <asp:Label ID="lblerror" runat="server" ForeColor="Red"></asp:Label>
                            </div>
                        </fieldset>
          
        </div>
</div>
    </div>
    </div>
    </form>
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js">
    </script>

</asp:Content>
