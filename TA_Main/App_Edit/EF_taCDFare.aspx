<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="EF_taCDFare.aspx.vb" Inherits="EF_taCDFare" title="Edit: Fare" %>
<asp:Content ID="CPHtaCDFare" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabeltaCDFare" runat="server" Text="&nbsp;Edit: Fare"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLtaCDFare" runat="server" >
<ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLtaCDFare"
    ToolType = "lgNMEdit"
    UpdateAndStay = "False"
    EnableDelete = "False"
    ValidationGroup = "taCDFare"
    runat = "server" />
<asp:FormView ID="FVtaCDFare"
  runat = "server"
  DataKeyNames = "TABillNo,SerialNo"
  DataSourceID = "ODStaCDFare"
  DefaultMode = "Edit" CssClass="sis_formview">
  <EditItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_TABillNo" runat="server" ForeColor="#CC6633" Text="TA Bill No :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox
            ID = "F_TABillNo"
            Width="88px"
            Text='<%# Bind("TABillNo") %>'
            CssClass = "mypktxt"
            Enabled = "False"
            ToolTip="Value of TA Bill No."
            Runat="Server" />
          <asp:Label
            ID = "F_TABillNo_Display"
            Text='<%# Eval("TA_Bills5_PurposeOfJourney") %>'
            CssClass="myLbl"
            Runat="Server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_SerialNo" runat="server" ForeColor="#CC6633" Text="Serial No :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_SerialNo"
            Text='<%# Bind("SerialNo") %>'
            ToolTip="Value of Serial No."
            Enabled = "False"
            CssClass = "mypktxt"
            Width="88px"
            style="text-align: right"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_City1ID" runat="server" Text="From City :" />&nbsp;
        </td>
        <td>
          <asp:TextBox
            ID = "F_City1ID"
            Width="248px"
            Text='<%# Bind("City1ID") %>'
            Enabled = "False"
            ToolTip="Value of From City."
            CssClass = "dmyfktxt"
            Runat="Server" />
          <asp:Label
            ID = "F_City1ID_Display"
            Text='<%# Eval("TA_Cities6_CityName") %>'
            CssClass="myLbl"
            Runat="Server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_City1Text" runat="server" Text="Other City Name :" />&nbsp;
        </td>
        <td>
          <asp:Label ID="F_City1Text"
            Text='<%# Eval("City1Text") %>'
            Width="350px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_City2ID" runat="server" Text="To City :" />&nbsp;
        </td>
        <td>
          <asp:TextBox
            ID = "F_City2ID"
            Width="248px"
            Text='<%# Bind("City2ID") %>'
            Enabled = "False"
            ToolTip="Value of To City."
            CssClass = "dmyfktxt"
            Runat="Server" />
          <asp:Label
            ID = "F_City2ID_Display"
            Text='<%# Eval("TA_Cities7_CityName") %>'
            CssClass="myLbl"
            Runat="Server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_City2Text" runat="server" Text="Other City Name :" />&nbsp;
        </td>
        <td>
          <asp:Label ID="F_City2Text"
            Text='<%# Eval("City2Text") %>'
            Width="350px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_Date1Time" runat="server" Text="Start Date & Time :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_Date1Time"
            Text='<%# Bind("Date1Time") %>'
            Enabled = "False"
            Width="168px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_Date2Time" runat="server" Text="End Date & Time :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_Date2Time"
            Text='<%# Bind("Date2Time") %>'
            Enabled = "False"
            Width="168px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ModeTravelID" runat="server" Text="Travel Mode :" />&nbsp;
        </td>
        <td>
          <asp:TextBox
            ID = "F_ModeTravelID"
            Width="88px"
            Text='<%# Bind("ModeTravelID") %>'
            Enabled = "False"
            CssClass = "dmyfktxt"
            Runat="Server" />
          <asp:Label
            ID = "F_ModeTravelID_Display"
            Text='<%# Eval("TA_TravelModes15_ModeName") %>'
            CssClass="myLbl"
            Runat="Server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_ModeText" runat="server" Text="Other Travel Mode :" />&nbsp;
        </td>
        <td>
          <asp:Label ID="F_ModeText"
            Text='<%# Eval("ModeText") %>'
            Width="350px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_AmountFactor" runat="server" Text="Claimed Amount :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_AmountFactor"
            Text='<%# Bind("AmountFactor") %>'
            ToolTip="Value of Claimed Amount."
            Enabled = "False"
            Width="88px"
            CssClass = "dmytxt"
            style="text-align: right"
            runat="server" />
        </td>
        <td class="alignright">
<%--          <asp:Label ID="L_AmountRate" runat="server" Text="Claimed Rate :" />&nbsp;--%>
        </td>
        <td>
<%--          <asp:TextBox ID="F_AmountRate"
            Text='<%# Bind("AmountRate") %>'
            ToolTip="Value of Claimed Rate."
            Enabled = "False"
            Width="88px"
            CssClass = "dmytxt"
            style="text-align: right"
            runat="server" />--%>
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
<%--      <tr>
        <td class="alignright">
          <asp:Label ID="L_AmountBasic" runat="server" Text="Claimed Basic [Amount x Rate] :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_AmountBasic"
            Text='<%# Bind("AmountBasic") %>'
            ToolTip="Value of Claimed Basic [Amount x Rate]."
            Enabled = "False"
            Width="168px"
            CssClass = "dmytxt"
            style="text-align: right"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_AmountTax" runat="server" Text="Claimed Tax :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_AmountTax"
            Text='<%# Bind("AmountTax") %>'
            ToolTip="Value of Claimed Tax."
            Enabled = "False"
            Width="168px"
            CssClass = "dmytxt"
            style="text-align: right"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_AmountTotal" runat="server" Text="Claimed NET Amount [Basic + Tax] :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_AmountTotal"
            Text='<%# Bind("AmountTotal") %>'
            ToolTip="Value of Claimed NET Amount [Basic + Tax]."
            Enabled = "False"
            Width="168px"
            CssClass = "dmytxt"
            style="text-align: right"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>--%>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_AmountInINR" runat="server" Text="NET Claimed [INR] :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_AmountInINR"
            Text='<%# Bind("AmountInINR") %>'
            ToolTip="Value of NET Claimed [INR]."
            Enabled = "False"
            Width="168px"
            CssClass = "dmytxt"
            style="text-align: right"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_Remarks" runat="server" Text="Remarks :" />&nbsp;
        </td>
        <td>
          <asp:Label ID="F_Remarks"
            Text='<%# Eval("Remarks") %>'
            Width="350px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_OOERemarks" runat="server" Text="OOE Remarks :" />&nbsp;
        </td>
        <td>
          <asp:Label ID="F_OOERemarks"
            Text='<%# Eval("OOERemarks") %>'
            Width="350px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
      </tr>
      <tr id="taCDFare_0"><td colspan="4" onclick="groupClicked(this);" class="groupHeader" >Accounts Section</td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ApprovalWFTypeID" runat="server" Text="Approval Work Flow Type ID :" />
        </td>
        <td>
          <LGM:LC_taApprovalWFTypes
            ID="F_ApprovalWFTypeID"
            SelectedValue='<%# Bind("ApprovalWFTypeID") %>'
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
          <asp:Label ID="L_OOEReasonID" runat="server" Text="OOE Reason ID :" />
        </td>
        <td>
          <LGM:LC_taOOEReasons
            ID="F_OOEReasonID"
            SelectedValue='<%# Bind("OOEReasonID") %>'
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
          <asp:Label ID="L_CostCenterID" runat="server" Text="Cost Center :" /><span style="color:red">*</span>
        </td>
        <td>
          <LGM:LC_taDepartments
            ID="F_CostCenterID"
            SelectedValue='<%# Bind("CostCenterID") %>'
            OrderBy="DisplayField"
            DataTextField="DisplayField"
            DataValueField="PrimaryKey"
            IncludeDefault="true"
            DefaultText="-- Select --"
            Width="200px"
            CssClass="myddl"
            ValidationGroup = "taCDFare"
            RequiredFieldErrorMessage = "<div class='errorLG'>Required!</div>"
            Runat="Server" />
          </td>
        <td class="alignright">
          <asp:Label ID="L_ProjectID" runat="server" Text="Project :" />&nbsp;
        </td>
        <td>
          <asp:TextBox
            ID = "F_ProjectID"
            CssClass = "myfktxt"
            Text='<%# Bind("ProjectID") %>'
            AutoCompleteType = "None"
            Width="56px"
            onfocus = "return this.select();"
            ToolTip="Enter value for Project."
            onblur= "script_taCDFare.validate_ProjectID(this);"
            Runat="Server" />
          <asp:Label
            ID = "F_ProjectID_Display"
            Text='<%# Eval("IDM_Projects3_Description") %>'
            CssClass="myLbl"
            Runat="Server" />
          <AJX:AutoCompleteExtender
            ID="ACEProjectID"
            BehaviorID="B_ACEProjectID"
            ContextKey=""
            UseContextKey="true"
            ServiceMethod="ProjectIDCompletionList"
            TargetControlID="F_ProjectID"
            EnableCaching="false"
            CompletionInterval="100"
            FirstRowSelected="true"
            MinimumPrefixLength="1"
            OnClientItemSelected="script_taCDFare.ACEProjectID_Selected"
            OnClientPopulating="script_taCDFare.ACEProjectID_Populating"
            OnClientPopulated="script_taCDFare.ACEProjectID_Populated"
            CompletionSetCount="10"
            CompletionListCssClass = "autocomplete_completionListElement"
            CompletionListItemCssClass = "autocomplete_listItem"
            CompletionListHighlightedItemCssClass = "autocomplete_highlightedListItem"
            Runat="Server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_CurrencyID" runat="server" Text="Currency :" /><span style="color:red">*</span>
        </td>
        <td>
          <LGM:LC_taCurrencies
            ID="F_CurrencyID"
            SelectedValue='<%# Bind("CurrencyID") %>'
            OrderBy="DisplayField"
            DataTextField="DisplayField"
            DataValueField="PrimaryKey"
            IncludeDefault="true"
            DefaultText="-- Select --"
            Width="200px"
            CssClass="myddl"
            ValidationGroup = "taCDFare"
            RequiredFieldErrorMessage = "<div class='errorLG'>Required!</div>"
            Runat="Server" />
          </td>
        <td class="alignright">
          <asp:Label ID="L_ConversionFactorINR" runat="server" Text="Conversion Factor [INR] :" /><span style="color:red">*</span>
        </td>
        <td>
          <asp:TextBox ID="F_ConversionFactorINR"
            Text='<%# Bind("ConversionFactorINR") %>'
            style="text-align: right"
            Width="88px"
            CssClass = "mytxt"
            ValidationGroup= "taCDFare"
            MaxLength="13"
            onfocus = "return this.select();"
            runat="server" />
          <AJX:MaskedEditExtender 
            ID = "MEEConversionFactorINR"
            runat = "server"
            mask = "999999.999999"
            AcceptNegative = "Left"
            MaskType="Number"
            MessageValidatorTip="true"
            InputDirection="RightToLeft"
            ErrorTooltipEnabled="true"
            TargetControlID="F_ConversionFactorINR" />
          <AJX:MaskedEditValidator 
            ID = "MEVConversionFactorINR"
            runat = "server"
            ControlToValidate = "F_ConversionFactorINR"
            ControlExtender = "MEEConversionFactorINR"
            EmptyValueBlurredText = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "taCDFare"
            IsValidEmpty = "false"
            SetFocusOnError="true" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_PassedAmountFactor" runat="server" Text="Passed Amount :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_PassedAmountFactor"
            Text='<%# Bind("PassedAmountFactor") %>'
            style="text-align: right"
            Width="88px"
            CssClass = "mytxt"
            MaxLength="10"
            onfocus = "return this.select();"
            runat="server" />
          <AJX:MaskedEditExtender 
            ID = "MEEPassedAmountFactor"
            runat = "server"
            mask = "99999999.99"
            AcceptNegative = "Left"
            MaskType="Number"
            MessageValidatorTip="true"
            InputDirection="RightToLeft"
            ErrorTooltipEnabled="true"
            TargetControlID="F_PassedAmountFactor" />
          <AJX:MaskedEditValidator 
            ID = "MEVPassedAmountFactor"
            runat = "server"
            ControlToValidate = "F_PassedAmountFactor"
            ControlExtender = "MEEPassedAmountFactor"
            EmptyValueBlurredText = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            IsValidEmpty = "True"
            SetFocusOnError="true" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_PassedAmountInINR" runat="server" Text="NET Passed [INR] :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_PassedAmountInINR"
            Text='<%# Bind("PassedAmountInINR") %>'
            ToolTip="Value of NET Passed [INR]."
            Enabled = "False"
            Width="168px"
            CssClass = "dmytxt"
            style="text-align: right"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
<%--      <tr>
        <td class="alignright">
          <asp:Label ID="L_PassedAmountBasic" runat="server" Text="Passed Basic [Unit x Rate] :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_PassedAmountBasic"
            Text='<%# Bind("PassedAmountBasic") %>'
            ToolTip="Value of Passed Basic [Unit x Rate]."
            Enabled = "False"
            Width="168px"
            CssClass = "dmytxt"
            style="text-align: right"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_PassedAmountTax" runat="server" Text="Passed Tax :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_PassedAmountTax"
            Text='<%# Bind("PassedAmountTax") %>'
            ToolTip="Value of Passed Tax."
            Enabled = "False"
            Width="168px"
            CssClass = "dmytxt"
            style="text-align: right"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_PassedAmountTotal" runat="server" Text="Passed NET Amount [Basic + Tax] :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_PassedAmountTotal"
            Text='<%# Bind("PassedAmountTotal") %>'
            ToolTip="Value of Passed NET Amount [Basic + Tax]."
            Enabled = "False"
            Width="168px"
            CssClass = "dmytxt"
            style="text-align: right"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_PassedAmountRate" runat="server" Text="Passed Rate :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_PassedAmountRate"
            Text='<%# Bind("PassedAmountRate") %>'
            ToolTip="Value of Passed Rate."
            Enabled = "False"
            Width="88px"
            CssClass = "dmytxt"
            style="text-align: right"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>--%>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_AccountsRemarks" runat="server" Text="Accounts Remarks :" />
        </td>
        <td>
          <asp:TextBox ID="F_AccountsRemarks"
            Text='<%# Bind("AccountsRemarks") %>'
            Width="350px" Height="40px" TextMode="MultiLine"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="taCDFare"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Accounts Remarks."
            MaxLength="500"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_Setteled" runat="server" Text="Setteled :" />&nbsp;
        </td>
        <td>
          <asp:CheckBox ID="F_Setteled"
            Checked='<%# Bind("Setteled") %>'
            CssClass = "mychk"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr id="taCDFare_1"><td colspan="4" onclick="groupClicked(this);" class="groupHeader" >Approval Status</td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ApprovedBy" runat="server" Text="Approved By :" />&nbsp;
        </td>
        <td>
          <asp:TextBox
            ID = "F_ApprovedBy"
            Width="72px"
            Text='<%# Bind("ApprovedBy") %>'
            Enabled = "False"
            CssClass = "dmyfktxt"
            Runat="Server" />
          <asp:Label
            ID = "F_ApprovedBy_Display"
            Text='<%# Eval("aspnet_users1_UserFullName") %>'
            CssClass="myLbl"
            Runat="Server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_ApprovedOn" runat="server" Text="Approved On :" />&nbsp;
        </td>
        <td>
          <asp:TextBox ID="F_ApprovedOn"
            Text='<%# Bind("ApprovedOn") %>'
            Enabled = "False"
            Width="168px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ApprovalRemarks" runat="server" Text="Approval Remarks :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:Label ID="F_ApprovalRemarks"
            Text='<%# Eval("ApprovalRemarks") %>'
            Width="350px"
            CssClass = "dmytxt"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
    </table>
  </div>
  </EditItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODStaCDFare"
  DataObjectTypeName = "SIS.TA.taCDFare"
  SelectMethod = "taCDFareGetByID"
  UpdateMethod="UZ_taCDFareUpdate"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.TA.taCDFare"
  runat = "server" >
<SelectParameters>
  <asp:QueryStringParameter DefaultValue="0" QueryStringField="TABillNo" Name="TABillNo" Type="Int32" />
  <asp:QueryStringParameter DefaultValue="0" QueryStringField="SerialNo" Name="SerialNo" Type="Int32" />
</SelectParameters>
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>