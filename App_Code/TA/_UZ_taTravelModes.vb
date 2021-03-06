Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel
Namespace SIS.TA
  Partial Public Class taTravelModes
    Public Function GetColor() As System.Drawing.Color
      Dim mRet As System.Drawing.Color = Drawing.Color.Blue
      Return mRet
    End Function
    Public Function GetVisible() As Boolean
      Dim mRet As Boolean = True
      Return mRet
    End Function
    Public Function GetEnable() As Boolean
      Dim mRet As Boolean = True
      Return mRet
    End Function
    Public Function GetEditable() As Boolean
      Dim mRet As Boolean = True
      Return mRet
    End Function
    Public ReadOnly Property Editable() As Boolean
      Get
        Dim mRet As Boolean = True
        Try
          mRet = GetEditable()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public ReadOnly Property Deleteable() As Boolean
      Get
        Dim mRet As Boolean = True
        Try
          mRet = GetEditable()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public Shared Function UZ_taTravelModesInsert(ByVal Record As SIS.TA.taTravelModes) As SIS.TA.taTravelModes
      Dim _Result As SIS.TA.taTravelModes = taTravelModesInsert(Record)
      Return _Result
    End Function
    Public Shared Function UZ_taTravelModesUpdate(ByVal Record As SIS.TA.taTravelModes) As SIS.TA.taTravelModes
      Dim _Result As SIS.TA.taTravelModes = taTravelModesUpdate(Record)
      Return _Result
    End Function
    Public Shared Function UZ_taTravelModesDelete(ByVal Record As SIS.TA.taTravelModes) As Integer
      Dim _Result as Integer = taTravelModesDelete(Record)
      Return _Result
    End Function
    Public Shared Function SetDefaultValues(ByVal sender As System.Web.UI.WebControls.FormView, ByVal e As System.EventArgs) As System.Web.UI.WebControls.FormView
      With sender
        'CType(.FindControl("F_ModeID"), TextBox).Text = ""
        'CType(.FindControl("F_ModeName"), TextBox).Text = ""
        'CType(.FindControl("F_Sequence"), TextBox).Text = ""
        'CType(.FindControl("F_AllowedToAll"), CheckBox).Checked = False
        'CType(.FindControl("F_UnderMilageClaim"), CheckBox).Checked = False
      End With
      Return sender
    End Function
  End Class
End Namespace
