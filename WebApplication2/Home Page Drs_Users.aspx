<%@ Page Language="C#" MasterPageFile="~/masterPAGE.Master" AutoEventWireup="true" CodeBehind="Home Page Drs_Users.aspx.cs" Inherits="WebApplication2.Home_Page_Drs_Users" Title="Home" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1"> 
<head>
    <title>Home</title>
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'/>

    <style type="text/css">
        body{
            background-color:white;
            overflow:hidden;
        }
        .twoPics{
            min-height:initial;
            width:100%;
            float:left;
            margin-left:-7px;
        }

        #DRpic{
            width:50%;
            height:auto;
        }

        image{
            position:fixed;
            overflow:hidden;

        }

        a:hover {
            opacity:0.5;
        }
        .imgs{
            display:inline-block;
        }
        a.imgs:hover{
            opacity:0.5;
        }
        image:hover{
            opacity:0.5;
        }

        .imgTitle{
            font-family:'Titillium Web',sans-serif;
            background-color:white;
            margin-bottom:-19px;
            align-content:center;
            
        }
    </style>

</head>

<body>

    <form id="form1" runat="server">
    <div class="twoPics">
        
        <div id="DRpic" class="imgs">
            <div class="imgTitle" style="margin-right:-7px;"> <h3 style="margin-left:50%">Doctor</h3><br /> </div>
            <a href="mira.aspx" style=""><img src="doctor-6.jpg" style="width:50%;height:670px;margin-right:2px"/></a>
        </div>

        <div id="PTpic" class="imgs">
            <div class="imgTitle"style="margin-left:3px; width:1200%"><h3 style="margin-left:50%">Patient</h3><br /></div>
            <a href="BrowseForm.aspx"><img src="patient-6.jpg" style="width:50%;height:670px;float:right;position:fixed;margin-left:3px;"/></a>
        </div>
    </div>
    </form>
</body>

</asp:Content>