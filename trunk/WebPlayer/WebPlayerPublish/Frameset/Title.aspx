<%@ page language="C#" autoeventwireup="true" inherits="Frameset_Title, App_Web_2vinkmfp" enableviewstate="false" enableviewstatemac="false" %>

<html>

<head runat="server">
	<link rel="stylesheet" type="text/css" href="Theme/Styles.css"/>
	<script src="./Include/FramesetMgr.js" type="text/javascript"></script>
	
	<script language="javascript" type="text/javascript">

	    var frameMgr;

	    function onLoad() {
	        frameMgr = API_GetFramesetManager();
	        frameMgr.RegisterFrameLoad(TITLE_FRAME);
	    }

	    // сохраняем выбранные варианты теста и закрываем окно
	    function onSaveAndClose() {
	        frameMgr.IsClosing(true);
	        frameMgr.ClearContentFrameAndPost("S", null);
	    }
	
	</script>

</head>

<body class=ShellTitleServices onload='onLoad();'>

<table width="100%" height="100%" border=0 cellPadding=0 cellSpacing=0>
	<tr valign="middle" height="100%">
		<td valign="middle" align="left" width="100%">
		    <div style="display: none" class="ShellTitleText" id="txtTitle">&nbsp;</div>
		</td>
		<td valign="middle" align="right" id="imgSaveAndCloseTd">
		    <img id="imgSaveAndClose" style="cursor: pointer; margin-right: 10px;" src="./Images/SaveAndClose.gif" onclick="onSaveAndClose();" title="Save & Close"/>
		</td>
	</tr>
    <tr height="2" bgcolor="#d3e6ff">
        <td colspan="2"></td>
    </tr>
</table>

</body>

</html>