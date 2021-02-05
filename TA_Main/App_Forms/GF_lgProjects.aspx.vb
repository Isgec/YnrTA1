Partial Class GF_lgProjects
  Inherits SIS.SYS.GridBase
  Protected Sub GVlgProjects_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVlgProjects.RowCommand
    If e.CommandName.ToLower = "lgedit".ToLower Then
      Try
        Dim ProjectID As String = GVlgProjects.DataKeys(e.CommandArgument).Values("ProjectID")
        Dim RedirectUrl As String = TBLlgProjects.EditUrl & "?ProjectID=" & ProjectID
        Response.Redirect(RedirectUrl)
      Catch ex As Exception
      End Try
    End If
  End Sub
  Protected Sub GVlgProjects_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVlgProjects.Init
    DataClassName = "GlgProjects"
    SetGridView = GVlgProjects
  End Sub
  Protected Sub TBLlgProjects_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLlgProjects.Init
    SetToolBar = TBLlgProjects
  End Sub
  Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
  End Sub
End Class
