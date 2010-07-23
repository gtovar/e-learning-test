<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TOC.aspx.cs" Inherits="Microsoft.LearningComponents.Frameset.Frameset_TOC" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head>

    <link rel="stylesheet" type="text/css" href="Theme/Styles.css" />
    <script src="./Include/FramesetMgr.js"></script>
    <script src="./Include/Toc.js"></script>
    <script src="./Include/vernum.js"></script>

    <script language="jscript">
        g_currentActivityId = null;
        g_previousActivityId = null;
        g_frameMgr = API_GetFramesetManager();
    
        function body_onload()
        {
            // Tell frameMgr to call back when current activity changes
            g_frameMgr.ShowActivityId = SetCurrentElement;
            g_frameMgr.ResetActivityId = ResetToPreviousSelection;
        
            // Tell frameMgr to call back with TOC active / inactive state changes
            g_frameMgr.SetTocNodes = SetTocNodes;
         
            // Register with framemanager that loading is complete
	        g_frameMgr.RegisterFrameLoad(TOC_FRAME); 
        }
    </script>

</head>

<body class="NavBody" onclick="body_onclick();" onload="body_onload()">

<div id="divMain" style="visibility: hidden; margin: 5px">
	<div nowrap="nowrap">
		<% WriteToc(); %>		
    </div>
</div>

<script type="text/javascript" defer="true">
        
  // If the version of the page differs from the version of the script, don't render
  if ("<%=TocVersion %>" != JsVersion())
  {
    document.writeln("<%=InvalidVersionHtml %>");
  }
        
</script>

</body>

</html>
