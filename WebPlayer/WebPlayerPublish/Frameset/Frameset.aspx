<%@ page language="C#" autoeventwireup="true" inherits="Microsoft.LearningComponents.Frameset.Frameset_Frameset, App_Web_2vinkmfp" enableviewstate="false" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title><%= PageTitleHtml %></title>
    <link rel="stylesheet" type="text/css" href="Theme/Styles.css" />

<% if (!ShowError)  // не включаем скрипты если произошла ошибка
{ %>
    
    <script src="./Include/Rte1p2Api.js"></script>
    <script src="./Include/parser1p2.js"></script>
    <script src="./Include/typevalidators1p2.js"></script>
    
    <script src="./Include/Rte2004Api.js"></script> 
    <script src="./Include/parser.js"></script>
    <script src="./Include/typevalidators.js"></script>
    
    <script src="./Include/RteApiSite.js"></script>
    <script src="./Include/FramesetMgr.js"></script>
    
    <script>

        // Constants
        SCORM_2004 = "V1p3";
        SCORM_12 = "V1p2";

        // FrameMgr is called from all frames
        var g_frameMgr = new FramesetManager;

        // TODO (M2): The following code is only required if the package is SCORM
        var g_scormVersion = "<%=ScormVersionHtml %>";	// Version of current session

        var API_1484_11 = null; // Name of RTE object for 2004 -- name is determined by SCORM.
        var API = null; // Name of RTE object for 1.2 -- name is determined by SCORM

        // Internal RTE object -- it's the same object as the api objects, just easier to reference.
        var g_API = g_frameMgr.GetRteApi(g_scormVersion, <%=RteRequired %>);  

        if (g_scormVersion == SCORM_2004)
        {
            API_1484_11 = g_API;
        }
        else
        {
            API  = g_API;
        }
    	
    </script>

<% } %>

</head>

<% if (ShowError) // если произошла ошибка, показываем текст ошибки
{  %>

<body class="ErrorBody">

    <table border="0" width="100%" id="table1" style="border-collapse: collapse">
	<tr>
		<td width="60"><p align="center"><img border="0" src="./Theme/Error.gif" width="49" height="49"></td>
        <td class="ErrorTitle"><%= ErrorTitle %></td>
	</tr>
	<tr>
		<td width="61">&nbsp;</td>
		<td><hr></td>
	</tr>
	<tr>
		<td width="61">&nbsp;</td>
		<td class="ErrorMessage"><%= ErrorMsg %></td>
	</tr>
    </table>

</body>

<% } else   // если нет ошибки показываем тест
{ %>

<frameset id="framesetMain" rows="50,*,0" framespacing="0" frameborder="0" border="0">

    <frame id="frameTitle" name="frameTitle" src="Title.aspx"  
        marginwidth="0" marginheight="0" noresize="noresize" scrolling="no" frameborder="0" />

    <frameset id="framesetParentUI" cols="180,*">
	    <frame id="frameToc" name="frameToc" marginWidth="0" marginHeight="0" src="<%= TocFrameUrl %>" frameBorder="0" />
		<frame class="ContentFrameLeftBorder" id="frameContent" name="frameContent" src="Content.aspx" frameBorder="0" />
	</frameset>

	<frame id="frameHidden" tabIndex="-1" name="frameHidden" visible="false"
	    marginWidth="0" marginHeight="0" src="<%= HiddenFrameUrl %>" frameBorder="0" noResize scrolling="no" />

</frameset>

<% } %>

</html>
