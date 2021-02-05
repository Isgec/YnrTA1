Imports System.Web.Script.Serialization
Partial Class EF_taD_LocalTravel
  Inherits SIS.SYS.UpdateBase
  Public Property Editable() As Boolean
    Get
      If ViewState("Editable") IsNot Nothing Then
        Return CType(ViewState("Editable"), Boolean)
      End If
      Return True
    End Get
    Set(ByVal value As Boolean)
      ViewState.Add("Editable", value)
    End Set
  End Property
  Public Property Deleteable() As Boolean
    Get
      If ViewState("Deleteable") IsNot Nothing Then
        Return CType(ViewState("Deleteable"), Boolean)
      End If
      Return True
    End Get
    Set(ByVal value As Boolean)
      ViewState.Add("Deleteable", value)
    End Set
  End Property
  Public Property PrimaryKey() As String
    Get
      If ViewState("PrimaryKey") IsNot Nothing Then
        Return CType(ViewState("PrimaryKey"), String)
      End If
      Return True
    End Get
    Set(ByVal value As String)
      ViewState.Add("PrimaryKey", value)
    End Set
  End Property
  Protected Sub ODStaD_LocalTravel_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ODStaD_LocalTravel.Selected
    Dim tmp As SIS.TA.taD_LocalTravel = CType(e.ReturnValue, SIS.TA.taD_LocalTravel)
    Editable = tmp.Editable
    Deleteable = tmp.Deleteable
    PrimaryKey = tmp.PrimaryKey
  End Sub
  Protected Sub FVtaD_LocalTravel_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVtaD_LocalTravel.Init
    DataClassName = "EtaD_LocalTravel"
    SetFormView = FVtaD_LocalTravel
  End Sub
  Protected Sub TBLtaD_LocalTravel_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLtaD_LocalTravel.Init
    SetToolBar = TBLtaD_LocalTravel
  End Sub
  Protected Sub FVtaD_LocalTravel_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVtaD_LocalTravel.PreRender
    TBLtaD_LocalTravel.EnableSave = Editable
    TBLtaD_LocalTravel.EnableDelete = Deleteable
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/TA_Main/App_Edit") & "/EF_taD_LocalTravel.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scripttaD_LocalTravel") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scripttaD_LocalTravel", mStr)
    End If
  End Sub

End Class
