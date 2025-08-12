Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Globalization

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub panel_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
		Dim c As HttpCookie = Request.Cookies("Culture")
		If c Is Nothing Then
			Return
		End If
		spellChecker.Culture = New CultureInfo(c.Value)
	End Sub
End Class
