<%@ page language="C#" autoeventwireup="true" inherits="Microsoft.LearningComponents.Frameset.Frameset_ClearContent, App_Web_2vinkmfp" enableviewstate="false" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>

<head>
	<link rel="stylesheet" type="text/css" href="./Theme/Styles.css"/>
	<script src="./Include/FramesetMgr.js"></script>
	
	<script language="jscript">
	
	function onLoad()
	{ 
	    frameMgr = API_GetFramesetManager();
	    frameMgr.SetPostFrame(HIDDEN_FRAME);
        frameMgr.SetPostableForm(window.top.frames[MAIN_FRAME].document.all[HIDDEN_FRAME].contentWindow.document.forms[0]);
        
        contentIsCleared = frameMgr.ContentIsCleared();
        
	    if (contentIsCleared == true)
	    {
	        setTimeout(PleaseWait, 500);
	    }
	    else
	    {
	        frameMgr.ShowErrorMessage("<%= UnexpectedErrorTitleHtml %>", "<%= UnexpectedErrorMsgHtml %>");
	    }
	}
	
	function PleaseWait()
    {
        try
        {
            // clears content from the window and displays a "Please wait" message
            document.body.innerHTML = "<table width='100%' class='ErrorTitle'><tr><td align='center'><%= PleaseWaitHtml %></td></tr></table>";
        }
        catch(e)
        {
            // only happens in odd boundary cases. Retry the message after another timeout.
            setTimeout(PleaseWait, 500);
        }
    }
	
    </script>

</head>

<body onload='onLoad()' class="ErrorBody">
    &nbsp;
</body>

</html>
