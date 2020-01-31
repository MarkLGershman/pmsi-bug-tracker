<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="PMSI.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>LogIn Form </title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css"/>

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css"/></head>
<body>
    <form id="login_form" runat="server" method="POST"  >
        <div class="main">
  <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="images/signin-image.jpg" alt="sign up image"/></figure>
                        <a href="/SignUp.aspx" class="signup-image-link">Create an account</a>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Log In</h2>
                            <div class="form-group">
                                <label for="UserName"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <asp:TextBox ID="TxtUserName" runat="server" ForeColor="Black" PlaceHolder="UserName"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TxtUserName" ForeColor="Red" runat="server" ErrorMessage="Field Required!"></asp:RequiredFieldValidator>
                           </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <asp:Textbox ID="TxtPass" runat="server" ForeColor="Black"  TextMode="Password" PlaceHolder="Password"></asp:Textbox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TxtPass" ForeColor="Red" runat="server" ErrorMessage="Field Required!"></asp:RequiredFieldValidator>
                            </div>
                        <div class="form-group form-button">
                                          <asp:Button ID="BtnSubmit" runat="server" Text="LogIn"  Class="form-submit" OnClick="UserLogin" />
                            <br />
                                <asp:Label ID="lblerror" runat="server" ForeColor="Red"></asp:Label>
                            </div>
                       
                    </div>
                </div>
            </div>
        </section>
        </div>
    </form>
</body>
</html>
