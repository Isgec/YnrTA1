Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel
Namespace SIS.TA
  <DataObject()> _
  Partial Public Class taCurrencies
    Private Shared _RecordCount As Integer
    Private _CurrencyID As String = ""
    Private _CurrencyName As String = ""
    Public ReadOnly Property ForeColor() As System.Drawing.Color
      Get
        Dim mRet As System.Drawing.Color = Drawing.Color.Blue
        Try
          mRet = GetColor()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public ReadOnly Property Visible() As Boolean
      Get
        Dim mRet As Boolean = True
        Try
          mRet = GetVisible()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public ReadOnly Property Enable() As Boolean
      Get
        Dim mRet As Boolean = True
        Try
          mRet = GetEnable()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public Property CurrencyID() As String
      Get
        Return _CurrencyID
      End Get
      Set(ByVal value As String)
        _CurrencyID = value
      End Set
    End Property
    Public Property CurrencyName() As String
      Get
        Return _CurrencyName
      End Get
      Set(ByVal value As String)
         If Convert.IsDBNull(Value) Then
           _CurrencyName = ""
         Else
           _CurrencyName = value
         End If
      End Set
    End Property
    Public Readonly Property DisplayField() As String
      Get
        Return "" & _CurrencyName.ToString.PadRight(50, " ")
      End Get
    End Property
    Public Readonly Property PrimaryKey() As String
      Get
        Return _CurrencyID
      End Get
    End Property
    Public Shared Property RecordCount() As Integer
      Get
        Return _RecordCount
      End Get
      Set(ByVal value As Integer)
        _RecordCount = value
      End Set
    End Property
    Public Class PKtaCurrencies
      Private _CurrencyID As String = ""
      Public Property CurrencyID() As String
        Get
          Return _CurrencyID
        End Get
        Set(ByVal value As String)
          _CurrencyID = value
        End Set
      End Property
    End Class
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function taCurrenciesSelectList(ByVal OrderBy As String) As List(Of SIS.TA.taCurrencies)
      Dim Results As List(Of SIS.TA.taCurrencies) = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "sptaCurrenciesSelectList"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@OrderBy", SqlDbType.NVarChar, 50, OrderBy)
          Cmd.Parameters.Add("@RecordCount", SqlDbType.Int)
          Cmd.Parameters("@RecordCount").Direction = ParameterDirection.Output
          _RecordCount = -1
          Results = New List(Of SIS.TA.taCurrencies)()
          Con.Open()
          Dim Reader As SqlDataReader = Cmd.ExecuteReader()
          While (Reader.Read())
            Results.Add(New SIS.TA.taCurrencies(Reader))
          End While
          Reader.Close()
          _RecordCount = Cmd.Parameters("@RecordCount").Value
        End Using
      End Using
      Return Results
    End Function
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function taCurrenciesGetNewRecord() As SIS.TA.taCurrencies
      Return New SIS.TA.taCurrencies()
    End Function
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function taCurrenciesGetByID(ByVal CurrencyID As String) As SIS.TA.taCurrencies
      Dim Results As SIS.TA.taCurrencies = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "sptaCurrenciesSelectByID"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CurrencyID",SqlDbType.NVarChar,CurrencyID.ToString.Length, CurrencyID)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
          Con.Open()
          Dim Reader As SqlDataReader = Cmd.ExecuteReader()
          If Reader.Read() Then
            Results = New SIS.TA.taCurrencies(Reader)
          End If
          Reader.Close()
        End Using
      End Using
      Return Results
    End Function
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function taCurrenciesSelectList(ByVal StartRowIndex As Integer, ByVal MaximumRows As Integer, ByVal OrderBy As String, ByVal SearchState As Boolean, ByVal SearchText As String) As List(Of SIS.TA.taCurrencies)
      Dim Results As List(Of SIS.TA.taCurrencies) = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          If SearchState Then
            Cmd.CommandText = "sptaCurrenciesSelectListSearch"
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@KeyWord", SqlDbType.NVarChar, 250, SearchText)
          Else
            Cmd.CommandText = "sptaCurrenciesSelectListFilteres"
          End If
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StartRowIndex", SqlDbType.Int, -1, StartRowIndex)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MaximumRows", SqlDbType.Int, -1, MaximumRows)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@OrderBy", SqlDbType.NVarChar, 50, OrderBy)
          Cmd.Parameters.Add("@RecordCount", SqlDbType.Int)
          Cmd.Parameters("@RecordCount").Direction = ParameterDirection.Output
          _RecordCount = -1
          Results = New List(Of SIS.TA.taCurrencies)()
          Con.Open()
          Dim Reader As SqlDataReader = Cmd.ExecuteReader()
          While (Reader.Read())
            Results.Add(New SIS.TA.taCurrencies(Reader))
          End While
          Reader.Close()
          _RecordCount = Cmd.Parameters("@RecordCount").Value
        End Using
      End Using
      Return Results
    End Function
    Public Shared Function taCurrenciesSelectCount(ByVal SearchState As Boolean, ByVal SearchText As String) As Integer
      Return _RecordCount
    End Function
      'Select By ID One Record Filtered Overloaded GetByID
    <DataObjectMethod(DataObjectMethodType.Insert, True)> _
    Public Shared Function taCurrenciesInsert(ByVal Record As SIS.TA.taCurrencies) As SIS.TA.taCurrencies
      Dim _Rec As SIS.TA.taCurrencies = SIS.TA.taCurrencies.taCurrenciesGetNewRecord()
      With _Rec
        .CurrencyID = Record.CurrencyID
        .CurrencyName = Record.CurrencyName
      End With
      Return SIS.TA.taCurrencies.InsertData(_Rec)
    End Function
    Public Shared Function InsertData(ByVal Record As SIS.TA.taCurrencies) As SIS.TA.taCurrencies
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "sptaCurrenciesInsert"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CurrencyID",SqlDbType.NVarChar,7, Record.CurrencyID)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CurrencyName",SqlDbType.NVarChar,51, Iif(Record.CurrencyName= "" ,Convert.DBNull, Record.CurrencyName))
          Cmd.Parameters.Add("@Return_CurrencyID", SqlDbType.NVarChar, 7)
          Cmd.Parameters("@Return_CurrencyID").Direction = ParameterDirection.Output
          Con.Open()
          Cmd.ExecuteNonQuery()
          Record.CurrencyID = Cmd.Parameters("@Return_CurrencyID").Value
        End Using
      End Using
      Return Record
    End Function
    <DataObjectMethod(DataObjectMethodType.Update, True)> _
    Public Shared Function taCurrenciesUpdate(ByVal Record As SIS.TA.taCurrencies) As SIS.TA.taCurrencies
      Dim _Rec As SIS.TA.taCurrencies = SIS.TA.taCurrencies.taCurrenciesGetByID(Record.CurrencyID)
      With _Rec
        .CurrencyName = Record.CurrencyName
      End With
      Return SIS.TA.taCurrencies.UpdateData(_Rec)
    End Function
    Public Shared Function UpdateData(ByVal Record As SIS.TA.taCurrencies) As SIS.TA.taCurrencies
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "sptaCurrenciesUpdate"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Original_CurrencyID",SqlDbType.NVarChar,7, Record.CurrencyID)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CurrencyID",SqlDbType.NVarChar,7, Record.CurrencyID)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CurrencyName",SqlDbType.NVarChar,51, Iif(Record.CurrencyName= "" ,Convert.DBNull, Record.CurrencyName))
          Cmd.Parameters.Add("@RowCount", SqlDbType.Int)
          Cmd.Parameters("@RowCount").Direction = ParameterDirection.Output
          _RecordCount = -1
          Con.Open()
          Cmd.ExecuteNonQuery()
          _RecordCount = Cmd.Parameters("@RowCount").Value
        End Using
      End Using
      Return Record
    End Function
    <DataObjectMethod(DataObjectMethodType.Delete, True)> _
    Public Shared Function taCurrenciesDelete(ByVal Record As SIS.TA.taCurrencies) As Int32
      Dim _Result as Integer = 0
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "sptaCurrenciesDelete"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Original_CurrencyID",SqlDbType.NVarChar,Record.CurrencyID.ToString.Length, Record.CurrencyID)
          Cmd.Parameters.Add("@RowCount", SqlDbType.Int)
          Cmd.Parameters("@RowCount").Direction = ParameterDirection.Output
          _RecordCount = -1
          Con.Open()
          Cmd.ExecuteNonQuery()
          _RecordCount = Cmd.Parameters("@RowCount").Value
        End Using
      End Using
      Return _RecordCount
    End Function
'    Autocomplete Method
    Public Shared Function SelecttaCurrenciesAutoCompleteList(ByVal Prefix As String, ByVal count As Integer, ByVal contextKey As String) As String()
      Dim Results As List(Of String) = Nothing
      Dim aVal() As String = contextKey.Split("|".ToCharArray)
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "sptaCurrenciesAutoCompleteList"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@prefix", SqlDbType.NVarChar, 50, Prefix)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@records", SqlDbType.Int, -1, count)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@bycode", SqlDbType.Int, 1, IIf(IsNumeric(Prefix),0,IIf(Prefix.ToLower=Prefix, 0, 1)))
          Results = New List(Of String)()
          Con.Open()
          Dim Reader As SqlDataReader = Cmd.ExecuteReader()
          If Not Reader.HasRows Then
            Results.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem("---Select Value---".PadRight(50, " "),""))
          End If
          While (Reader.Read())
            Dim Tmp As SIS.TA.taCurrencies = New SIS.TA.taCurrencies(Reader)
            Results.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(Tmp.DisplayField, Tmp.PrimaryKey))
          End While
          Reader.Close()
        End Using
      End Using
      Return Results.ToArray
    End Function
    Public Sub New(ByVal Reader As SqlDataReader)
      On Error Resume Next
      _CurrencyID = Ctype(Reader("CurrencyID"),String)
      If Convert.IsDBNull(Reader("CurrencyName")) Then
        _CurrencyName = String.Empty
      Else
        _CurrencyName = Ctype(Reader("CurrencyName"), String)
      End If
    End Sub
    Public Sub New()
    End Sub
  End Class
End Namespace
