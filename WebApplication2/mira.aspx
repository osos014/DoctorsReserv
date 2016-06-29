<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mira.aspx.cs" Inherits="WebApplication2.WebForm1" Title="Sign-Up---Login FORM" MasterPageFile="~/masterPAGE.Master" %>


<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!--background music-->
    
    <audio src="28 A. Habershon, C. Gabriel - Will The Circle Be Unbroken (full version).mp3" autoplay="autoplay" loop="loop"></audio>
    
    <div class="form">
      
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Sign Up</a></li>
        <li class="tab"><a href="#login">Log In</a></li>
      </ul>
      
      <div class="tab-content">
                                                        <!-- SIGN UP-->
        <div id="signup">   
          <h1>Sign Up for Free</h1>
          
          <form runat="server">   <!--To post form data to another page or so--> <!--action="/" method="POST"--> 
          
						<div class="top-row" > <!-- to make the fname and lname in same row "top row" -->
							<!--first name-->
                            <div class="field-wrap">
								<label>
									First Name<span class="req">*</span>
								</label>
								<input type="text" runat="server" id="FNAMEinp" required="required" autocomplete="off" />
							</div>

                            <!--last name-->
							<div class="field-wrap">
								<label>
									Last Name<span class="req">*</span>
								</label>
								<input type="text" runat="server" id="LNAMEinp" required="required" autocomplete="off" />
							</div>
							
                            </div>

                             <!--speciality-->
                            <div class="field-wrap" style="width:523px;height:43px;overflow:hidden;border:1px solid #A0B3B0">
                               
                                 <asp:DropDownList ID="DropDownListSpeciality" runat="server" Height="43px" 
                                     Width="550px" BackColor="#13232F" ForeColor="#A0B3B0" Font-Size="22px" CssClass="field-wrap dropDownList"
                                      >
                                </asp:DropDownList>
							</div>


                            <!--email-->
							<div class="field-wrap">
                                <label>
                                    Email Address<span class="req">*</span>
                                </label>
                                <input type="email" runat="server" id="MAILinp" required="required" autocomplete="off" />
							</div>

						
                            <!--city-->
                            <div class="field-wrap" style="width:523px;height:43px;overflow:hidden;border:1px solid #A0B3B0">
                               
                                 <asp:DropDownList ID="cityDropDown" runat="server" Height="43px" 
                                     Width="550px" BackColor="#13232F" ForeColor="#A0B3B0" Font-Size="22px" CssClass="field-wrap dropDownList" 
                                      >
                                    
                                </asp:DropDownList>
                                 <!--
                                     <asp:ListItem>Select your city..</asp:ListItem>
                                     <asp:ListItem>Cairo</asp:ListItem>
                                     <asp:ListItem>Giza</asp:ListItem>
                                     <asp:ListItem>Alexandria</asp:ListItem>-->
							</div>

                            <!--neighbourhood-->
                            <div class="field-wrap" style="width:523px;height:43px;overflow:hidden;border:1px solid #A0B3B0">
                               
                                 <asp:DropDownList ID="neighbourhoodDDL" runat="server" Height="43px" 
                                     Width="550px" BackColor="#13232F" ForeColor="#A0B3B0" Font-Size="22px" CssClass="field-wrap dropDownList"
                                      >
                                </asp:DropDownList>
							</div>

                            <!--address-->
                            <div class="field-wrap">
                                <label>
                                    Address<span class="req">*</span>
                                </label>
                                <asp:TextBox ID="Addrss_TxtBox" runat="server" CssClass="aspTXT" ></asp:TextBox>
							</div>
								
                            <!--phone number-->
                            <div class="field-wrap">
                                <label>
                                    Phone Number<span class="req">*</span>
                                </label>
                                <asp:TextBox ID="phoneTXT" TextMode="Number" runat="server" CssClass="aspTXT" ></asp:TextBox>
							 <!-- want to validate the phone number -->
                                <!--   <asp:CustomValidator runat="server" ControlToValidate="phoneTXT"></asp:CustomValidator>-->
                           
                               
                                
                               
                            </div>

                            <!--password-->
							<div class="field-wrap" >
								<label>
									Set A Password<span class="req">*</span>
								</label>
                                <!--<input type="password" required="required" autocomplete="off" />-->
                                <asp:TextBox ID="TextBoxPass" runat="server" TextMode="Password" Width="300px" OnTextChanged="TextBoxPass_TextChanged" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                 ControlToValidate="TextBoxPass" ErrorMessage="Password is required" 
                                 Font-Bold="True" ForeColor="Red" CssClass="text-danger" EnableClientScript="true"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                                ControlToValidate="TextBoxPass" 
                                ErrorMessage="Password MUST be at least 6 characters" Font-Bold="True" 
                                ForeColor="Red" CssClass="text-danger" MaximumValue="6" EnableClientScript="true"></asp:RangeValidator>
                                
							</div>
						    
                            <!--confirm password-->
							<div class="field-wrap" >
								<label>
									Confirm Password<span class="req">*</span>
								</label>
								<!--<input type="password" required="required" autocomplete="off" />-->
                                <asp:TextBox ID="TextBoxConfirmPass" runat="server" TextMode="Password" Width="300px"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ForeColor="Red" Font-Bold="true" 
                                ControlToCompare="TextBoxPass" ControlToValidate="TextBoxConfirmPass" CssClass="text-danger" 
                                Display="Dynamic" ErrorMessage="Passwords Don't Match" />
                            </div>
                                
                            
             
              
           <asp:Button CssClass="button button-block" runat="server" Text="Get Started" ToolTip="Register" CommandName="rgstrBTN"  ID="rgstrBTN" OnClick="rgstrBTN_Click" />
          
          
          </form>

            
        </div>
                                <!-- LOG IN -->
        <div id="login">   
          <h1>Welcome Back!</h1>
          
          <form method="post">
          
            <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <input id="lgINUserName" name="lgINUserName" type="text" required="required" autocomplete="off" />
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input id="lgINPASS" name="lgINPASS"  type="password"required="required" autocomplete="off"  />
          </div>
          
          <p class="forgot"><a href="#">Forgot Password?</a></p>
          
              <!-- here i made html control visible in the code behind runat.at.server -->
          <button class="button button-block" id="loginBTN" type="submit">Log In</button>
          
          </form>

        </div>
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->

    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="jquery-1.10.2.min.js"></script>
    <script src="js/index.js"></script>

    

    </asp:Content>
