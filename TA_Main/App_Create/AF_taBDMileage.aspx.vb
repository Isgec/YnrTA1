Partial Class AF_taBDMileage
  Inherits SIS.SYS.InsertBase
  Protected Sub FVtaBDMileage_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVtaBDMileage.Init
    DataClassName = "AtaBDMileage"
    SetFormView = FVtaBDMileage
  End Sub
  Protected Sub TBLtaBDMileage_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLtaBDMileage.Init
    SetToolBar = TBLtaBDMileage
  End Sub
  Protected Sub FVtaBDMileage_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVtaBDMileage.DataBound
    SIS.TA.taBDMileage.SetDefaultValues(sender, e) 
  End Sub
  Protected Sub FVtaBDMileage_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVtaBDMileage.PreRender
    Dim oF_TABillNo_Display As Label  = FVtaBDMileage.FindControl("F_TABillNo_Display")
    oF_TABillNo_Display.Text = String.Empty
    If Not Session("F_TABillNo_Display") Is Nothing Then
      If Session("F_TABillNo_Display") <> String.Empty Then
        oF_TABillNo_Display.Text = Session("F_TABillNo_Display")
      End If
    End If
    Dim oF_TABillNo As TextBox  = FVtaBDMileage.FindControl("F_TABillNo")
    oF_TABillNo.Enabled = True
    oF_TABillNo.Text = String.Empty
    If Not Session("F_TABillNo") Is Nothing Then
      If Session("F_TABillNo") <> String.Empty Then
        oF_TABillNo.Text = Session("F_TABillNo")
      End If
    End If
    Dim oF_City1ID_Display As Label  = FVtaBDMileage.FindControl("F_City1ID_Display")
    Dim oF_City1ID As TextBox  = FVtaBDMileage.FindControl("F_City1ID")
    Dim oF_City2ID_Display As Label  = FVtaBDMileage.FindControl("F_City2ID_Display")
    Dim oF_City2ID As TextBox  = FVtaBDMileage.FindControl("F_City2ID")
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/TA_Main/App_Create") & "/AF_taBDMileage.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scripttaBDMileage") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scripttaBDMileage", mStr)
    End If
    If Request.QueryString("TABillNo") IsNot Nothing Then
      CType(FVtaBDMileage.FindControl("F_TABillNo"), TextBox).Text = Request.QueryString("TABillNo")
      CType(FVtaBDMileage.FindControl("F_TABillNo"), TextBox).Enabled = False
    End If
    If Request.QueryString("SerialNo") IsNot Nothing Then
      CType(FVtaBDMileage.FindControl("F_SerialNo"), TextBox).Text = Request.QueryString("SerialNo")
      CType(FVtaBDMileage.FindControl("F_SerialNo"), TextBox).Enabled = False
    End If
  End Sub
  <System.Web.Services.WebMethod()> _
  <System.Web.Script.Services.ScriptMethod()> _
  Public Shared Function TABillNoCompletionList(ByVal prefixText As String, ByVal count As Integer, ByVal contextKey As String) As String()
    Return SIS.TA.taBH.SelecttaBHAutoCompleteList(prefixText, count, contextKey)
  End Function
  <System.Web.Services.WebMethod()> _
  <System.Web.Script.Services.ScriptMethod()> _
  Public Shared Function City1IDCompletionList(ByVal prefixText As String, ByVal count As Integer, ByVal contextKey As String) As String()
    Return SIS.TA.taCities.SelecttaCitiesAutoCompleteList(prefixText, count, contextKey)
  End Function
  <System.Web.Services.WebMethod()> _
  <System.Web.Script.Services.ScriptMethod()> _
  Public Shared Function City2IDCompletionList(ByVal prefixText As String, ByVal count As Integer, ByVal contextKey As String) As String()
    Return SIS.TA.taCities.SelecttaCitiesAutoCompleteList(prefixText, count, contextKey)
  End Function
  <System.Web.Services.WebMethod()> _
  Public Shared Function validate_FK_TA_BillDetails_TABillNo(ByVal value As String) As String
    Dim aVal() As String = value.Split(",".ToCharArray)
    Dim mRet As String="0|" & aVal(0)
    Dim TABillNo As Int32 = CType(aVal(1),Int32)
    Dim oVar As SIS.TA.taBH = SIS.TA.taBH.taBHGetByID(TABillNo)
    If oVar Is Nothing Then
      mRet = "1|" & aVal(0) & "|Record not found." 
    Else
      mRet = "0|" & aVal(0) & "|" & oVar.DisplayField 
    End If
    Return mRet
  End Function
  <System.Web.Services.WebMethod()> _
  Public Shared Function validate_FK_TA_BillDetails_City1ID(ByVal value As String) As String
    Dim aVal() As String = value.Split(",".ToCharArray)
    Dim mRet As String="0|" & aVal(0)
    Dim City1ID As String = CType(aVal(1),String)
    Dim oVar As SIS.TA.taCities = SIS.TA.taCities.taCitiesGetByID(City1ID)
    If oVar Is Nothing Then
      mRet = "1|" & aVal(0) & "|Record not found." 
    Else
      mRet = "0|" & aVal(0) & "|" & oVar.DisplayField 
    End If
    Return mRet
  End Function
  <System.Web.Services.WebMethod()> _
  Public Shared Function validate_FK_TA_BillDetails_City2ID(ByVal value As String) As String
    Dim aVal() As String = value.Split(",".ToCharArray)
    Dim mRet As String="0|" & aVal(0)
    Dim City2ID As String = CType(aVal(1),String)
    Dim oVar As SIS.TA.taCities = SIS.TA.taCities.taCitiesGetByID(City2ID)
    If oVar Is Nothing Then
      mRet = "1|" & aVal(0) & "|Record not found." 
    Else
      mRet = "0|" & aVal(0) & "|" & oVar.DisplayField 
    End If
    Return mRet
  End Function

End Class
