<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="PMSI.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Sign Up Form </title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css"/>

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
    <form id="registerform"  runat="server" method="POST" >
        <div class="main">
            <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <asp:TextBox ID="TxtName" runat="server" ForeColor="Black" PlaceHolder="Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtName" ForeColor="Red" runat="server" ErrorMessage="Field Required!"></asp:RequiredFieldValidator>
                                </div>
                        <div class="form-group">
                                <label for="UserName"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <asp:TextBox ID="TxtUserName" runat="server" ForeColor="Black" PlaceHolder="UserName"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TxtUserName" ForeColor="Red" runat="server" ErrorMessage="Field Required!"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                              <asp:TextBox ID="TxtEmail" runat="server" TextMode="Email" ForeColor="Black" PlaceHolder="Email"></asp:TextBox>
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TxtEmail" ForeColor="Red" runat="server" ErrorMessage="Field Required!"></asp:RequiredFieldValidator>
                                </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <asp:Textbox ID="TxtPass" runat="server" ForeColor="Black" TextMode="Password" PlaceHolder="Password"></asp:Textbox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TxtPass" ForeColor="Red" runat="server" ErrorMessage="Field Required!"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <asp:Textbox ID="TxtPass2" runat="server" ForeColor="Black" TextMode="Password" PlaceHolder="Re-Type Password"></asp:Textbox>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TxtPass" ControlToCompare="TxtPass2" ErrorMessage="Password Not Matched!" ForeColor="Red"></asp:CompareValidator>   
                                </div>
                            <div class="form-group">
                                <label for="designation"><i style="width:50px;" ></i></label>
                                <asp:DropDownList ID="DesignationList"  runat="server"  >
                                    <asp:ListItem Enabled="true" Text="Select Desingation" Value="-1"></asp:ListItem>
                                    
                                    <asp:ListItem value="Lead">Lead</asp:ListItem>
    
                                    <asp:ListItem value="DesktopDeveloper">Desktop Developer</asp:ListItem>
                                    <asp:ListItem value="AndroidDeveloper">Android Developer</asp:ListItem>
                                    <asp:ListItem value="WebDeveloper">Web Developer</asp:ListItem>
                                    <asp:ListItem value="GraphicDesinger">Graphic Desinger</asp:ListItem>
                                </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="DesignationList" ForeColor="Red" runat="server" ErrorMessage="Field Required!" InitialValue="-1"></asp:RequiredFieldValidator>        </div>
                            
                            <div class="form-group form-button">
                                          <asp:Button ID="BtnSubmit" runat="server" Text="SignUp" OnClick="AddUser" Class="form-submit" />
                            <br />
                                <asp:Label ID="lblerror" runat="server" ForeColor="Red"></asp:Label>
                            </div>
                        
                    </div>
                    <div class="signup-image">
                        <figure><img src="images/signup-image.jpg" alt="sing up image"/></figure>
                        <a href="/Index.aspx" class="signup-image-link">I am already member</a>
                        
                    </div>
                </div>
            </div>
        </section>

        </div>
    </form>
</body>
</html>
