<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Execute.aspx.cs" Inherits="Microsoft.LearningComponents.Frameset.Execute"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><%= PageTitle %></title>
    <link rel="stylesheet" type="text/css" href="./Frameset/Theme/Styles.css" />
</head>

<% if (ShowError)
{  %>

<body class="ErrorBody">

    <table border="0" width="100%" id="table1" style="border-collapse: collapse">
	<tr>
		<td width="60"><p align="center"><img border="0" src="./Frameset/Theme/Error.gif" width="49" height="49"></td>
        <td class="ErrorTitle"><%= ErrorTitle %></td>
	</tr>
	<tr>
		<td width="61">&nbsp;</td>
		<td><hr /></td>
	</tr>
	<tr>
		<td width="61">&nbsp;</td>
		<td class="ErrorMessage"><%= ErrorMsg %></td>
	</tr>
    </table>

</body>

<% } else
{ %>

<frameset id="framesetTestMain" rows="*" framespacing="0" frameborder="0" border="0">

    <frame id="frameTest" name="frameTest" src="<%= TestUrl %>"  
        marginwidth="0" marginheight="0" noresize="noresize" scrolling="no" frameborder="0" />

</frameset>

<% } %>


</html>
