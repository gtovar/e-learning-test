<%@ page language="C#" autoeventwireup="true" inherits="Microsoft.LearningComponents.Frameset.Frameset_Hidden, App_Web_2vinkmfp" validaterequest="false" enableviewstate="false" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">

    <script src="./Include/FramesetMgr.js"></script>
	
    <script>

        function OnLoad()
        {
            // Get frameset manager
            frameMgr = API_GetFramesetManager();
    
            // Set data on frameset manager
            <%  WriteFrameMgrInit();  %>
     
            // Register with framemanager that loading is complete
	        frameMgr.RegisterFrameLoad(HIDDEN_FRAME); 	
        }

    </script>

</head>

<body onload="OnLoad();">

    <form id="form1" runat="server">
        <div>
            <% WriteHiddenControls(); %>
        </div>
    </form>

</body>

</html>
