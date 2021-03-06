Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel
Namespace SIS.TA
  <DataObject()> _
  Partial Public Class taLCModes
    Private Shared _RecordCount As Integer
    Private _ModeID As Int32 = 0
    Private _ModeName As String = ""
    Private _OutOfSequence As Boolean = False
    Private _Sequence As String = ""
    Private _UnderMilageClaim As Boolean = False
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
    Public Property ModeID() As Int32
      Get
        Return _ModeID
      End Get
      Set(ByVal value As Int32)
        _ModeID = value
      End Set
    End Property
    Public Property ModeName() As String
      Get
        Return _ModeName
      End Get
      Set(ByVal value As String)
         If Convert.IsDBNull(Value) Then
           _ModeName = ""
         Else
           _ModeName = value
         End If
      End Set
    End Property
    Public Property OutOfSequence() As Boolean
      Get
        Return _OutOfSequence
      End Get
      Set(ByVal value As Boolean)
        _OutOfSequence = value
      End Set
    End Property
    Public Property Sequence() As String
      Get
        Return _Sequence
      End Get
      Set(ByVal value As String)
         If Convert.IsDBNull(Value) Then
           _Sequence = ""
         Else
           _Sequence = value
         End If
      End Set
    End Property
    Public Property UnderMilageClaim() As Boolean
      Get
        Return _UnderMilageClaim
      End Get
      Set(ByVal value As Boolean)
        _UnderMilageClaim = value
      End Set
    End Property
    Public Readonly Property DisplayField() As String
      Get
        Return "" & _ModeName.ToString.PadRight(50, " ")
      End Get
    End Property
    Public Readonly Property PrimaryKey() As String
      Get
        Return _ModeID
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
    Public Class PKtaLCModes
      Private _ModeID As Int32 = 0
      Public Property ModeID() As Int32
        Get
          Return _ModeID
        End Get
        Set(ByVal value As Int32)
          _ModeID = value
        End Set
      End Property
    End Class
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function taLCModesSelectList(ByVal OrderBy As String) As List(Of SIS.TA.taLCModes)
      Dim Results As List(Of SIS.TA.taLCModes) = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          If OrderBy = String.Empty Then OrderBy = "Sequence"
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "sptaLCModesSelectList"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@OrderBy", SqlDbType.NVarChar, 50, OrderBy)
          Cmd.Parameters.Add("@RecordCount", SqlDbType.Int)
          Cmd.Parameters("@RecordCount").Direction = ParameterDirection.Output
          _RecordCount = -1
          Results = New List(Of SIS.TA.taLCModes)()
          Con.Open()
          Dim Reader As SqlDataReader = Cmd.ExecuteReader()
          While (Reader.Read())
            Results.Add(New SIS.TA.taLCModes(Reader))
          End While
          Reader.Close()
          _RecordCount = Cmd.Parameters("@RecordCount").Value
        End Using
      End Using
      Return Results
    End Function
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function taLCModesGetNewRecord() As SIS.TA.taLCModes
      Return New SIS.TA.taLCModes()
    End Function
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function taLCModesGetByID(ByVal ModeID As Int32) As SIS.TA.taLCModes
      Dim Results As SIS.TA.taLCModes = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "sptaLCModesSelectByID"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ModeID",SqlDbType.Int,ModeID.ToString.Length, ModeID)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
          Con.Open()
          Dim Reader As SqlDataReader = Cmd.ExecuteReader()
          If Reader.Read() Then
            Results = New SIS.TA.taLCModes(Reader)
          End If
          Reader.Close()
        End Using
      End Using
      Return Results
    End Function
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function taLCModesSelectList(ByVal StartRowIndex As Integer, ByVal MaximumRows As Integer, ByVal OrderBy As String, ByVal SearchState As Boolean, ByVal SearchText As String) As List(Of SIS.TA.taLCModes)
      Dim Results As List(Of SIS.TA.taLCModes) = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          If OrderBy = String.Empty Then OrderBy = "Sequence"
          Cmd.CommandType = CommandType.StoredProcedure
          If SearchState Then
            Cmd.CommandText = "sptaLCModesSelectListSearch"
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@KeyWord", SqlDbType.NVarChar, 250, SearchText)
          Else
            Cmd.CommandText = "sptaLCModesSelectListFilteres"
          End If
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StartRowIndex", SqlDbType.Int, -1, StartRowIndex)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MaximumRows", SqlDbType.Int, -1, MaximumRows)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@OrderBy", SqlDbType.NVarChar, 50, OrderBy)
          Cmd.Parameters.Add("@RecordCount", SqlDbType.Int)
          Cmd.Parameters("@RecordCount").Direction = ParameterDirection.Output
          _RecordCount = -1
          Results = New List(Of SIS.TA.taLCModes)()
          Con.Open()
          Dim Reader As SqlDataReader = Cmd.ExecuteReader()
          While (Reader.Read())
            Results.Add(New SIS.TA.taLCModes(Reader))
          End While
          Reader.Close()
          _RecordCount = Cmd.Parameters("@RecordCount").Value
        End Using
      End Using
      Return Results
    End Function
    Public Shared Function taLCModesSelectCount(ByVal SearchState As Boolean, ByVal SearchText As String) As Integer
      Return _RecordCount
    End Function
      'Select By ID One Record Filtered Overloaded GetByID
    <DataObjectMethod(DataObjectMethodType.Insert, True)> _
    Public Shared Function taLCModesInsert(ByVal Record As SIS.TA.taLCModes) As SIS.TA.taLCModes
      Dim _Rec As SIS.TA.taLCModes = SIS.TA.taLCModes.taLCModesGetNewRecord()
      With _Rec
        .ModeName = Record.ModeName
        .OutOfSequence = Record.OutOfSequence
        .Sequence = Record.Sequence
        .UnderMilageClaim = Record.UnderMilageClaim
      End With
      Return SIS.TA.taLCModes.InsertData(_Rec)
    End Function
    Public Shared Function InsertData(ByVal Record As SIS.TA.taLCModes) As SIS.TA.taLCModes
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "sptaLCModesInsert"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ModeName",SqlDbType.NVarChar,51, Iif(Record.ModeName= "" ,Convert.DBNull, Record.ModeName))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@OutOfSequence",SqlDbType.Bit,3, Record.OutOfSequence)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Sequence",SqlDbType.Int,11, Iif(Record.Sequence= "" ,Convert.DBNull, Record.Sequence))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@UnderMilageClaim",SqlDbType.Bit,3, Record.UnderMilageClaim)
          Cmd.Parameters.Add("@Return_ModeID", SqlDbType.Int, 11)
          Cmd.Parameters("@Return_ModeID").Direction = ParameterDirection.Output
          Con.Open()
          Cmd.ExecuteNonQuery()
          Record.ModeID = Cmd.Parameters("@Return_ModeID").Value
        End Using
      End Using
      Return Record
    End Function
    <DataObjectMethod(DataObjectMethodType.Update, True)> _
    Public Shared Function taLCModesUpdate(ByVal Record As SIS.TA.taLCModes) As SIS.TA.taLCModes
      Dim _Rec As SIS.TA.taLCModes = SIS.TA.taLCModes.taLCModesGetByID(Record.ModeID)
      With _Rec
        .ModeName = Record.ModeName
        .OutOfSequence = Record.OutOfSequence
        .Sequence = Record.Sequence
        .UnderMilageClaim = Record.UnderMilageClaim
      End With
      Return SIS.TA.taLCModes.UpdateData(_Rec)
    End Function
    Public Shared Function UpdateData(ByVal Record As SIS.TA.taLCModes) As SIS.TA.taLCModes
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "sptaLCModesUpdate"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Original_ModeID",SqlDbType.Int,11, Record.ModeID)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ModeName",SqlDbType.NVarChar,51, Iif(Record.ModeName= "" ,Convert.DBNull, Record.ModeName))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@OutOfSequence",SqlDbType.Bit,3, Record.OutOfSequence)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Sequence",SqlDbType.Int,11, Iif(Record.Sequence= "" ,Convert.DBNull, Record.Sequence))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@UnderMilageClaim",SqlDbType.Bit,3, Record.UnderMilageClaim)
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
    Public Shared Function taLCModesDelete(ByVal Record As SIS.TA.taLCModes) As Int32
      Dim _Result as Integer = 0
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "sptaLCModesDelete"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Original_ModeID",SqlDbType.Int,Record.ModeID.ToString.Length, Record.ModeID)
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
    Public Shared Function SelecttaLCModesAutoCompleteList(ByVal Prefix As String, ByVal count As Integer, ByVal contextKey As String) As String()
      Dim Results As List(Of String) = Nothing
      Dim aVal() As String = contextKey.Split("|".ToCharArray)
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "sptaLCModesAutoCompleteList"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@prefix", SqlDbType.NVarChar, 50, Prefix)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@records", SqlDbType.Int, -1, count)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@bycode", SqlDbType.Int, 1, IIf(IsNumeric(Prefix), 0, 1))
          Results = New List(Of String)()
          Con.Open()
          Dim Reader As SqlDataReader = Cmd.ExecuteReader()
          If Not Reader.HasRows Then
            Results.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem("---Select Value---".PadRight(50, " "),""))
          End If
          While (Reader.Read())
            Dim Tmp As SIS.TA.taLCModes = New SIS.TA.taLCModes(Reader)
            Results.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(Tmp.DisplayField, Tmp.PrimaryKey))
          End While
          Reader.Close()
        End Using
      End Using
      Return Results.ToArray
    End Function
    Public Sub New(ByVal Reader As SqlDataReader)
      On Error Resume Next
      _ModeID = Ctype(Reader("ModeID"),Int32)
      If Convert.IsDBNull(Reader("ModeName")) Then
        _ModeName = String.Empty
      Else
        _ModeName = Ctype(Reader("ModeName"), String)
      End If
      _OutOfSequence = Ctype(Reader("OutOfSequence"),Boolean)
      If Convert.IsDBNull(Reader("Sequence")) Then
        _Sequence = String.Empty
      Else
        _Sequence = Ctype(Reader("Sequence"), String)
      End If
      _UnderMilageClaim = Ctype(Reader("UnderMilageClaim"),Boolean)
    End Sub
    Public Sub New()
    End Sub
  End Class
End Namespace
