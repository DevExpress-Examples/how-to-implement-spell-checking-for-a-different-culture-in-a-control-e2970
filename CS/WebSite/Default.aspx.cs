using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Globalization;

public partial class _Default : System.Web.UI.Page
{
	protected void panel_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e) {
		HttpCookie c = Request.Cookies["Culture"];
		if (c == null)
			return;
		spellChecker.Culture = new CultureInfo(c.Value);
	}
}
