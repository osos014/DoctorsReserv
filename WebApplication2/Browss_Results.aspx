<%@ Page Language="C#" MasterPageFile="~/masterPAGE.Master" AutoEventWireup="true" CodeBehind="Browss_Results.aspx.cs" Inherits="WebApplication2.Browss_Results" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
<head>
    <title>Results</title>
    <style>
        .divThumbs{
            margin:15px 5px 5px 15px;
            width:600px;
            height:110px;
            background-color:darkcyan;
            color:wheat;
            border-radius: 4px;
            text-align:center;
            font-size : 120%;
            
        }
        .divThumbs:hover{
            opacity:0.7;
        }
        .dynamicPanel{
            display:table; /*this made the panel height expand with its content*/
            height:auto;
            margin: 50px 0 0 25px;
            border-radius:4px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView runat="server" ID="BrowseResultsGridView" CssClass="gridVIEW">
            </asp:GridView>
            
            <%--<asp:Panel runat="server" ID="testPanel" BackColor="SlateBlue" Width="80%" Wrap="true" >
                <div style="height:100px;width:300px;background-color:azure;margin:30px 10px 10px 15px;" >
                    <h3>Doctor 3bd el samee3</h3>
                </div>
            </asp:Panel>--%>

            <asp:Panel runat="server" ID="dynamicPanel" BackColor="#63C6AE" Width="70%" CssClass="dynamicPanel" Wrap="true">

            </asp:Panel>

           
        </div>
    </form>
</asp:Content>
