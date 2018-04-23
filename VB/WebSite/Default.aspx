<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.2, Version=10.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v10.2, Version=10.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title>How to implement  spell checking for a different culture in a control.</title>
	<script language="javascript" type="text/javascript">
		function SetSpellCulture(e, culture){        
			ASPxClientUtils.SetCookie('Culture', culture);
			panel.PerformCallback(); 
			e.processOnServer = false;
		}
		function SetGermanSpellCulture(s, e){
			SetSpellCulture(e, "de-DE");
		}
		function SetUSSpellCulture(s, e){
			SetSpellCulture(e, "en-US");
		}         
	</script>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<dx:ASPxMemo ID="memo" runat="server" Height="71px" Width="170px" ClientInstanceName="memo"
				Text="Wenn Sie &quot;Auf gut Glück!&quot; suchen, verbringen Sie weniger Zeit mit der Suche nach Webseiten und mehr Zeit damit, sich diese anzusehen.">
			</dx:ASPxMemo>
		</div>
		<dx:ASPxCallbackPanel ID="panel" runat="server" ClientInstanceName="panel" Width="200px"
			OnCallback="panel_Callback">
			<ClientSideEvents EndCallback="function(s, e) { spellChecker.Check(); }" />
			<PanelCollection>
				<dx:PanelContent runat="server">
					<dx:ASPxSpellChecker ID="spellChecker" runat="server" ClientInstanceName="spellChecker"
						EnableViewState="False" CheckedElementID="memo" Culture="English (United States)">
						<Dictionaries>
							<dx:ASPxSpellCheckerOpenOfficeDictionary Culture="English (United States)" DictionaryPath="~/App_Data/Dictionaries/en_US.dic"
								EncodingName="Western European (Windows)" GrammarPath="~/App_Data/Dictionaries/en_US.aff" />
							<dx:ASPxSpellCheckerOpenOfficeDictionary Culture="German (Germany)" DictionaryPath="~/App_Data/Dictionaries/de_DE_frami.dic"
								EncodingName="Western European (Windows)" GrammarPath="~/App_Data/Dictionaries/de_DE_frami.aff" />
						</Dictionaries>
					</dx:ASPxSpellChecker>
				</dx:PanelContent>
			</PanelCollection>
		</dx:ASPxCallbackPanel>
		<table>
			<tr>
				<td>
					<dx:ASPxButton ID="btnEng" runat="server" Text="English" AutoPostBack="False">
						<ClientSideEvents Click="SetUSSpellCulture" />
					</dx:ASPxButton>
				</td>
				<td>
					<dx:ASPxButton ID="btnGerm" runat="server" Text="Deutsch" AutoPostBack="False">
						<ClientSideEvents Click="SetGermanSpellCulture" />
					</dx:ASPxButton>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
