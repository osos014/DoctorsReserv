<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BrowseForm.aspx.cs" Inherits="WebApplication2.BrowseForm" MasterPageFile="~/masterPAGE.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
<head>

    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'/>
   
     <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
     <script src="jquery-1.10.2.min.js"></script>
   
    
     <style>
        body{
            background-repeat:no-repeat;
            background-size:cover;
            background:linear-gradient();
            overflow:hidden;
            
        }
        .slideshow{
            height:100vh; /*very coooool css3 method viewheight and viewwidth*/ /*that what made it appear btw as it was happening in the background*/
            width:100vw;
            background-size:cover;
            position:fixed;
            top:0; /*specifies the margin between the div and the block containing it*/
            left:0;
            background-attachment:fixed;
            z-index:-1; /*to bring the master page navigation bar to front*/
        }
        .ddlContainer{
            background-color:hsla(0, 100%, 100%, 0.78);
            width:100vw;
            height:70px;
            position:relative;
            margin-top:24%;
        }
        .specCityNeighbtabs{
            position:relative;
            padding-left:95px;
            padding-right:95px;
        }
        .ddLISTS{
            height:38px;
            width:160px;
            border-radius:2.5px 2.5px;
            border:0.5px solid grey;
            display:inline;
            float:left;
            margin-left:40px;
            text-align:right;
            text-indent:5px; /*should be put to center the text in the ddl but it's not working*/
        }

        .btnBROWSE{
            background-color:#5BC0DE;
            
            font-size:large;
            font-family:'Titillium Web',sans-serif;
            font-weight:700;
            font-stretch:extra-expanded;
            color:floralwhite;
            border:0;
            height:38px;
            width:170px;
            float:right;
            transition: all 0.7s ease 0s;
            margin-left:350px;
            
        }

        .btnBROWSE:hover{
            transition:all 0.7s ease 0s;
            background-color:#1B6B83;
            
        }
        /*#faderBack, #faderFront, #inFrontOfBoth
            {
                position: absolute;
                top: 0;
                left: 0;
            }
            #faderFront
            {
                background: url("homeDoctorPatient.jpg") no-repeat center top;
            }*/
    </style>

    
    <script type="text/javascript">
        /*Want to make a jQuery image slide show or slider*/

        /* //first trial with changing background in loop with fading and so
        //populate image set
        var imageAry = ["homeKNICK.jpeg", "homeEgyptianDrs.jpg", "homeDoctorPatient.jpg"];
        //in milliseconds
        var fadeSpeed = "1000";
        var timeout = 3000;


        function fadeInFront(i) {
            $('#faderFront').css({
                "background-image": "url(" + imageAry[i] + ")"
            });
            $('#faderFront').fadeIn(fadeSpeed);
            i++;
            if (i == imageAry.length) { i = 0; }
            setTimeout(function () {
                fadeOutFront(i);
            }, timeout);
        }
        function fadeOutFront(i) {
            $('#faderBack').css({
                "background-image": "url(" + imageAry[i] + ")"
            });
            $('#faderFront').fadeOut(fadeSpeed);
            i++;
            if (i == imageAry.length) { i = 0; }
            setTimeout(function () {
                fadeInFront(i);
            }, timeout);
        }
        function preload(arrayOfImages) {
            $(arrayOfImages).each(function () {
                $('<img/>')[0].src = this;
            });
        }

        $(document).ready(function () {
            preload(imageAry);
            setTimeout(function () {
                fadeOutFront(3);
            }, timeout);
        });
        */

        /*Second trial*/
        
        var currentBackground = 0;
        var backgrounds = [];
        backgrounds[0] = 'homeEgyptianDrs.jpg';
        backgrounds[1] = 'homeKNICK.jpeg';
        backgrounds[2] = 'homeDoctorPatient.jpg';

        function changeBackground() {
            currentBackground++;
            if (currentBackground > 2) currentBackground = 0;

            $('.slideshow').fadeOut(400, function () {
                $('.slideshow').css({
                    "background-image": "url('" + backgrounds[currentBackground] + "');"
                });
                $('.slideshow').fadeIn(400);

            });


            setTimeout(changeBackground, 7000);
        }
       
        $(document).ready(function () {
            setTimeout(changeBackground, 500);
        });
        

        /*Third Tial*/ /*working*/
        /*
        $(function () {
            var body = $('body');
            var backgrounds = ['url(homeEgyptianDrs.jpg)', 'url(homeDoctorPatient.jpg)', 'url(homeKNICK.jpeg)'];
            var current = 0;

            function nextBackground() {
                body.css(
                 'background',
                  backgrounds[current = ++current % backgrounds.length]
               );

                setTimeout(nextBackground, 5000);
            }
            setTimeout(nextBackground, 5000);
            body.css('background', backgrounds[0]);
        });
        */
    </script>


    <title>Browse</title>
</head>
<body id="home">
    <form id="form1" runat="server" style="height:inherit;widows:inherit;">
    <div class="slideshow">
        <div style="background-color:hsla(0, 100%, 100%, 0.78)">
        <h3 style="font-family:'Titillium Web',sans-serif;font-size:77px;color:#5BC0DE; margin-left:8%;">we care</h3>
        </div>
        <%--<div id="container">

        <div id="faderBack"></div>
        <div id="faderFront"></div>
        <div id="inFrontOfBoth">Hello World</div>

        </div>--%>
        <div class="ddlContainer">
            <div class="containerRow">
                <div class="specCityNeighbtabs" style="margin-top:10px; padding-top:0.5em; display:inline-block">
                   <div>
                     <asp:DropDownList runat="server" BackColor="WhiteSmoke" ForeColor="#858585" ID="ddlSpeciality" CssClass="ddLISTS" >

                     </asp:DropDownList>
                   </div>

                    <div >
                     <asp:DropDownList runat="server" BackColor="WhiteSmoke" ForeColor="#858585" ID="ddlCity" CssClass="ddLISTS">

                     </asp:DropDownList>
                   </div>

                    <div>
                     <asp:DropDownList runat="server" BackColor="WhiteSmoke" ForeColor="#858585" ID="ddlNeighbourhood" CssClass="ddLISTS">

                     </asp:DropDownList>
                   </div>

                    <div>
                        <asp:Button runat="server" Text="Browse" CssClass="btnBROWSE" OnClick="browseBTN_CLick" />
                    </div>
                </div>
                <div class="browseButtonContainer"></div>
            </div>
        </div>
    </div>
    </form>
</body>
</asp:Content>
