<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AF_taEmployees.aspx.vb" Inherits="AF_taEmployees" title="Add: Employees" %>
<asp:Content ID="CPHtaEmployees" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabeltaEmployees" runat="server" Text="&nbsp;Add: Employees"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLtaEmployees" runat="server" >
  <ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLtaEmployees"
    ToolType = "lgNMAdd"
    InsertAndStay = "False"
    ValidationGroup = "taEmployees"
    runat = "server" />
<asp:FormView ID="FVtaEmployees"
  runat = "server"
  DataKeyNames = "CardNo"
  DataSourceID = "ODStaEmployees"
  DefaultMode = "Insert" CssClass="sis_formview">
  <InsertItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <asp:Label ID="L_ErrMsgtaEmployees" runat="server" ForeColor="Red" Font-Bold="true" Text=""></asp:Label>
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_CardNo" ForeColor="#CC6633" runat="server" Text="Card No :" /><span style="color:red">*</span></b>
        </td>
        <td>
          <asp:TextBox ID="F_CardNo"
            Text='<%# Bind("CardNo") %>'
            CssClass = "mypktxt"
            onfocus = "return this.select();"
            ValidationGroup="taEmployees"
            onblur= "script_taEmployees.validate_CardNo(this);"
            ToolTip="Enter value for Card No."
            MaxLength="8"
            Width="72px"
            runat="server" />
          <asp:RequiredFieldValidator 
            ID = "RFVCardNo"
            runat = "server"
            ControlToValidate = "F_CardNo"
            ErrorMessage = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "taEmployees"
            SetFocusOnError="true" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_EmployeeName" runat="server" Text="Employee Name :" /><span style="color:red">*</span>
        </td>
        <td>
          <asp:TextBox ID="F_EmployeeName"
            Text='<%# Bind("EmployeeName") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="taEmployees"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Employee Name."
            MaxLength="50"
            Width="408px"
            runat="server" />
          <asp:RequiredFieldValidator 
            ID = "RFVEmployeeName"
            runat = "server"
            ControlToValidate = "F_EmployeeName"
            ErrorMessage = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "taEmployees"
            SetFocusOnError="true" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_C_CompanyID" runat="server" Text="Company :" />&nbsp;
        </td>
        <td>
          <LGM:LC_qcmCompanies
            ID="F_C_CompanyID"
            SelectedValue='<%# Bind("C_CompanyID") %>'
            OrderBy="DisplayField"
            DataTextField="DisplayField"
            DataValueField="PrimaryKey"
            IncludeDefault="true"
            DefaultText="-- Select --"
            Width="200px"
            CssClass="myddl"
            Runat="Server" />
          </td>
        <td class="alignright">
          <asp:Label ID="L_C_DivisionID" runat="server" Text="Division :" />&nbsp;
        </td>
        <td>
          <LGM:LC_taDivisions
            ID="F_C_DivisionID"
            SelectedValue='<%# Bind("C_DivisionID") %>'
            OrderBy="DisplayField"
            DataTextField="DisplayField"
            DataValueField="PrimaryKey"
            IncludeDefault="true"
            DefaultText="-- Select --"
            Width="200px"
            CssClass="myddl"
            Runat="Server" />
          </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_C_DepartmentID" runat="server" Text="Department :" />&nbsp;
        </td>
        <td>
          <LGM:LC_taDepartments
            ID="F_C_DepartmentID"
            SelectedValue='<%# Bind("C_DepartmentID") %>'
            OrderBy="DisplayField"
            DataTextField="DisplayField"
            DataValueField="PrimaryKey"
            IncludeDefault="true"
            DefaultText="-- Select --"
            Width="200px"
            CssClass="myddl"
            Runat="Server" />
          </td>
        <td class="alignright">
          <asp:Label ID="L_C_DesignationID" runat="server" Text="Designation :" />&nbsp;
        </td>
        <td>
          <LGM:LC_qcmDesignations
            ID="F_C_DesignationID"
            SelectedValue='<%# Bind("C_DesignationID") %>'
            OrderBy="DisplayField"
            DataTextField="DisplayField"
            DataValueField="PrimaryKey"
            IncludeDefault="true"
            DefaultText="-- Select --"
            Width="200px"
            CssClass="myddl"
            Runat="Server" />
          </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_C_OfficeID" runat="server" Text="Location :" />&nbsp;
        </td>
        <td>
          <LGM:LC_qcmOffices
            ID="F_C_OfficeID"
            SelectedValue='<%# Bind("C_OfficeID") %>'
            OrderBy="DisplayField"
            DataTextField="DisplayField"
            DataValueField="PrimaryKey"
            IncludeDefault="true"
            DefaultText="-- Select --"
            Width="200px"
            CssClass="myddl"
            Runat="Server" />
          </td>
        <td class="alignright">
          <asp:Label ID="L_ActiveState" runat="server" Text="Active State :" />&nbsp;
        </td>
        <td>
          <asp:CheckBox ID="F_ActiveState"
           Checked='<%# Bind("ActiveState") %>'
           CssClass = "mychk"
           runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_TASelfApproval" runat="server" Text="TA Self Approval :" />&nbsp;
        </td>
        <td>
          <asp:CheckBox ID="F_TASelfApproval"
           Checked='<%# Bind("TASelfApproval") %>'
           CssClass = "mychk"
           runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_TAVerifier" runat="server" Text="Verifier :" />&nbsp;
        </td>
        <td>
          <asp:TextBox
            ID = "F_TAVerifier"
            CssClass = "myfktxt"
            Width="72px"
            Text='<%# Bind("TAVerifier") %>'
            AutoCompleteType = "None"
            onfocus = "return this.select();"
            ToolTip="Enter value for Verifier."
            onblur= "script_taEmployees.validate_TAVerifier(this);"
            Runat="Server" />
          <asp:Label
            ID = "F_TAVerifier_Display"
            Text='<%# Eval("HRM_Employees6_EmployeeName") %>'
            CssClass="myLbl"
            Runat="Server" />
          <AJX:AutoCompleteExtender
            ID="ACETAVerifier"
            BehaviorID="B_ACETAVerifier"
            ContextKey=""
            UseContextKey="true"
            ServiceMethod="TAVerifierCompletionList"
            TargetControlID="F_TAVerifier"
            EnableCaching="false"
            CompletionInterval="100"
            FirstRowSelected="true"
            MinimumPrefixLength="1"
            OnClientItemSelected="script_taEmployees.ACETAVerifier_Selected"
            OnClientPopulating="script_taEmployees.ACETAVerifier_Populating"
            OnClientPopulated="script_taEmployees.ACETAVerifier_Populated"
            CompletionSetCount="10"
            CompletionListCssClass = "autocomplete_completionListElement"
            CompletionListItemCssClass = "autocomplete_listItem"
            CompletionListHighlightedItemCssClass = "autocomplete_highlightedListItem"
            Runat="Server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_TAApprover" runat="server" Text="Approver :" />&nbsp;
        </td>
        <td>
          <asp:TextBox
            ID = "F_TAApprover"
            CssClass = "myfktxt"
            Width="72px"
            Text='<%# Bind("TAApprover") %>'
            AutoCompleteType = "None"
            onfocus = "return this.select();"
            ToolTip="Enter value for Approver."
            onblur= "script_taEmployees.validate_TAApprover(this);"
            Runat="Server" />
          <asp:Label
            ID = "F_TAApprover_Display"
            Text='<%# Eval("HRM_Employees7_EmployeeName") %>'
            CssClass="myLbl"
            Runat="Server" />
          <AJX:AutoCompleteExtender
            ID="ACETAApprover"
            BehaviorID="B_ACETAApprover"
            ContextKey=""
            UseContextKey="true"
            ServiceMethod="TAApproverCompletionList"
            TargetControlID="F_TAApprover"
            EnableCaching="false"
            CompletionInterval="100"
            FirstRowSelected="true"
            MinimumPrefixLength="1"
            OnClientItemSelected="script_taEmployees.ACETAApprover_Selected"
            OnClientPopulating="script_taEmployees.ACETAApprover_Populating"
            OnClientPopulated="script_taEmployees.ACETAApprover_Populated"
            CompletionSetCount="10"
            CompletionListCssClass = "autocomplete_completionListElement"
            CompletionListItemCssClass = "autocomplete_listItem"
            CompletionListHighlightedItemCssClass = "autocomplete_highlightedListItem"
            Runat="Server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_TASanctioningAuthority" runat="server" Text="Sanctioning Authority :" />&nbsp;
        </td>
        <td>
          <asp:TextBox
            ID = "F_TASanctioningAuthority"
            CssClass = "myfktxt"
            Width="72px"
            Text='<%# Bind("TASanctioningAuthority") %>'
            AutoCompleteType = "None"
            onfocus = "return this.select();"
            ToolTip="Enter value for Sanctioning Authority."
            onblur= "script_taEmployees.validate_TASanctioningAuthority(this);"
            Runat="Server" />
          <asp:Label
            ID = "F_TASanctioningAuthority_Display"
            Text='<%# Eval("HRM_Employees9_EmployeeName") %>'
            CssClass="myLbl"
            Runat="Server" />
          <AJX:AutoCompleteExtender
            ID="ACETASanctioningAuthority"
            BehaviorID="B_ACETASanctioningAuthority"
            ContextKey=""
            UseContextKey="true"
            ServiceMethod="TASanctioningAuthorityCompletionList"
            TargetControlID="F_TASanctioningAuthority"
            EnableCaching="false"
            CompletionInterval="100"
            FirstRowSelected="true"
            MinimumPrefixLength="1"
            OnClientItemSelected="script_taEmployees.ACETASanctioningAuthority_Selected"
            OnClientPopulating="script_taEmployees.ACETASanctioningAuthority_Populating"
            OnClientPopulated="script_taEmployees.ACETASanctioningAuthority_Populated"
            CompletionSetCount="10"
            CompletionListCssClass = "autocomplete_completionListElement"
            CompletionListItemCssClass = "autocomplete_listItem"
            CompletionListHighlightedItemCssClass = "autocomplete_highlightedListItem"
            Runat="Server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_CategoryID" runat="server" Text="Category ID :" />&nbsp;
        </td>
        <td>
          <LGM:LC_taCategories
            ID="F_CategoryID"
            SelectedValue='<%# Bind("CategoryID") %>'
            OrderBy="DisplayField"
            DataTextField="DisplayField"
            DataValueField="PrimaryKey"
            IncludeDefault="true"
            DefaultText="-- Select --"
            Width="200px"
            CssClass="myddl"
            Runat="Server" />
          </td>
        <td class="alignright">
          <asp:Label ID="L_EMailID" runat="server" Text="E-Mail-ID :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_EMailID"
            Text='<%# Bind("EMailID") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for E-Mail-ID."
            MaxLength="50"
            Width="408px"
            runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_Contractual" runat="server" Text="Contractual :" />&nbsp;
        </td>
        <td>
          <asp:CheckBox ID="F_Contractual"
           Checked='<%# Bind("Contractual") %>'
           CssClass = "mychk"
           runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_NonTechnical" runat="server" Text="NonTechnical :" />&nbsp;
        </td>
        <td>
          <asp:CheckBox ID="F_NonTechnical"
           Checked='<%# Bind("NonTechnical") %>'
           CssClass = "mychk"
           runat="server" />
        </td>
      </tr>
    </table>
    </div>
  </InsertItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODStaEmployees"
  DataObjectTypeName = "SIS.TA.taEmployees"
  InsertMethod="taEmployeesInsert"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.TA.taEmployees"
  SelectMethod = "GetNewRecord"
  runat = "server" >
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>
