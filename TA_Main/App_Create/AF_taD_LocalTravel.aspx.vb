Partial Class AF_taD_LocalTravel
  Inherits SIS.SYS.InsertBase
  Protected Sub FVtaD_LocalTravel_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVtaD_LocalTravel.Init
    DataClassName = "AtaD_LocalTravel"
    SetFormView = FVtaD_LocalTravel
  End Sub
  Protected Sub TBLtaD_LocalTravel_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLtaD_LocalTravel.Init
    SetToolBar = TBLtaD_LocalTravel
  End Sub
  Protected Sub FVtaD_LocalTravel_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVtaD_LocalTravel.DataBound
    SIS.TA.taD_LocalTravel.SetDefaultValues(sender, e) 
  End Sub
  Protected Sub FVtaD_LocalTravel_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVtaD_LocalTravel.PreRender
    Dim oF_CategoryID As LC_taCategories = FVtaD_LocalTravel.FindControl("F_CategoryID")
    oF_CategoryID.Enabled = True
    oF_CategoryID.SelectedValue = String.Empty
    If Not Session("F_CategoryID") Is Nothing Then
      If Session("F_CategoryID") <> String.Empty Then
        oF_CategoryID.SelectedValue = Session("F_CategoryID")
      End If
    End If
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/TA_Main/App_Create") & "/AF_taD_LocalTravel.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scripttaD_LocalTravel") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scripttaD_LocalTravel", mStr)
    End If
    If Request.QueryString("SerialNo") IsNot Nothing Then
      CType(FVtaD_LocalTravel.FindControl("F_SerialNo"), TextBox).Text = Request.QueryString("SerialNo")
      CType(FVtaD_LocalTravel.FindControl("F_SerialNo"), TextBox).Enabled = False
    End If
  End Sub

End Class
